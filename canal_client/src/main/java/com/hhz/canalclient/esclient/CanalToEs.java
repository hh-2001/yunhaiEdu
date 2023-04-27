package com.hhz.canalclient.esclient;

import com.alibaba.otter.canal.client.CanalConnector;
import com.alibaba.otter.canal.client.CanalConnectors;
import com.alibaba.otter.canal.protocol.CanalEntry.*;
import com.alibaba.otter.canal.protocol.Message;
import com.google.protobuf.InvalidProtocolBufferException;

import org.apache.commons.lang.StringUtils;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.client.indices.GetIndexResponse;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


import java.io.IOException;
import java.net.InetSocketAddress;

import java.util.*;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.stream.Collectors;

/**
 * 自动同步es
 */
@Component
public class CanalToEs {

    @Value("${canalClient.host}")
    private String host;

    @Value("${canalClient.port}")
    private Integer port;

    @Value("${canalClient.destination}")
    private String destination;

    @Value("${canalClient.username}")
    private String username;
    @Value("${canalClient.password}")
    private String password;

    @Value("${canalClient.batchsize}")
    private int batchSize;

    @Autowired
    private RestHighLevelClient restHighLevelClient;

    private Queue<Object> ES_QUEUE = new ConcurrentLinkedQueue<>();

    /**
     * canal入库方法
     */
    public void run() {

        CanalConnector connector = CanalConnectors.newSingleConnector(new InetSocketAddress(host,
                port), destination, username, password);
        try {
            connector.connect();
            connector.subscribe(".*\\..*");
            connector.rollback();
            try {
                while (true) {
                    //尝试从master那边拉去数据batchSize条记录，有多少取多少
                    Message message = connector.getWithoutAck(batchSize);
                    long batchId = message.getId();
                    int size = message.getEntries().size();
                    if (batchId == -1 || size == 0) {
                        Thread.sleep(1000);
                    } else {
                        //做数据处理且进行同步
                        dataHandle(message.getEntries());
                    }
                    connector.ack(batchId);

                    //当队列里面堆积的sql大于一定数值的时候就模拟执行
                    if (ES_QUEUE.size() >= 1) {
                        executeEs();
                    }
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (InvalidProtocolBufferException e) {
                e.printStackTrace();
            }
        } finally {
            connector.disconnect();
        }
    }


    /**
     * 数据处理
     *
     * @param entrys
     */
    private void dataHandle(List<Entry> entrys) throws InvalidProtocolBufferException {
        for (Entry entry : entrys) {
            if (EntryType.ROWDATA == entry.getEntryType()) {
                RowChange rowChange = RowChange.parseFrom(entry.getStoreValue());
                EventType eventType = rowChange.getEventType();
                if (eventType == EventType.DELETE) {
                    //删除操作
                    saveDeleteEs(entry, eventType);
                } else if (eventType == EventType.UPDATE) {
                    //更新操作
                    saveUpdateEs(entry);
                } else if (eventType == EventType.INSERT) {
                    //插入操作
                    saveInsertEs(entry);
                }
            }
        }
    }

    /**
     * 模拟执行队列里面的sql语句
     */
    public void executeEs() {
        int size = ES_QUEUE.size();
        for (int i = 0; i < size; i++) {
            Object sql = ES_QUEUE.poll();
            System.out.println("[esSQL]----> " + sql);
            this.execute(sql);
        }
    }

    /**
     * 保存更新语句
     *
     * @param entry
     */
    private void saveUpdateEs(Entry entry) {
        try {
            String indexName = isExist(entry.getHeader().getTableName());
            if (StringUtils.isNotEmpty(indexName)) {
                UpdateRequest updateRequest = new UpdateRequest().index(indexName);
                //数据库
                List<Map<String, Object>> list = makeData(entry,null);
                updateRequest.id((String) list.get(0).get("id"));
                updateRequest.doc(list.get(0), XContentType.JSON);
                ES_QUEUE.add(updateRequest);
            }
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 保存删除语句
     *
     * @param entry
     * @param eventType
     */
    private void saveDeleteEs(Entry entry, EventType eventType) {
        try {
            String indexName = isExist(entry.getHeader().getTableName());
            if (StringUtils.isNotEmpty(indexName)) {
                DeleteRequest deleteRequest = new DeleteRequest();
                //数据集
                List<Map<String, Object>> list = makeData(entry,eventType);
                deleteRequest.index(indexName);
                for (Map<String, Object> map : list) {
                    deleteRequest.id((String) map.get("id"));
                }
                ES_QUEUE.add(deleteRequest);
            }
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 保存插入语句
     *
     * @param entry
     */
    private void saveInsertEs(Entry entry) {
        try {
            String indexName = isExist(entry.getHeader().getTableName());
            if (StringUtils.isNotEmpty(indexName)) {
                IndexRequest indexRequest = new IndexRequest().index(indexName);
                List<Map<String, Object>> list = makeData(entry,null);
                indexRequest.id((String) list.get(0).get("id"));
                indexRequest.source(list.get(0),XContentType.JSON);
                ES_QUEUE.add(indexRequest);
            }
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 判断索引库是否存在
     *
     * @param tableName
     * @return
     * @throws IOException
     */
    private String isExist(String tableName) throws IOException {
        String[] table = tableName.split("_");
        if (table[0].equals("edu")) {
            String indexName = table[1] + "_list";
            GetIndexRequest request = new GetIndexRequest("*");
            GetIndexResponse response = restHighLevelClient.indices().get(request, RequestOptions.DEFAULT);
            String[] indices = response.getIndices();

            System.out.println(response.getIndices()[0]);
            if(indices.length > 0){
                return Arrays.stream(indices).anyMatch(s -> s.equals(indexName)) ? indexName : "";
            }
            return "";
        } else {
            return "";
        }
    }

    /**
     * 构建es所需的数据列
     *
     * @param entry
     * @return
     * @throws InvalidProtocolBufferException
     */
    private List<Map<String, Object>> makeData(Entry entry, EventType eventType) throws InvalidProtocolBufferException {
        List<Map<String, Object>> list = new ArrayList<>();
        RowChange rowChange = RowChange.parseFrom(entry.getStoreValue());
        List<RowData> rowDatasList = rowChange.getRowDatasList();

        //删除操作
        if(Objects.nonNull(eventType)){
            for (RowData rowData : rowDatasList) {
                List<Column> columnList = rowData.getBeforeColumnsList();
                Map<String, Object> map = columnList.stream().collect(Collectors.toMap(s -> s.getName(), s -> s.getValue()));
                list.add(map);
            }
        }else {
            for (RowData rowData : rowDatasList) {
                List<Column> columnList = rowData.getAfterColumnsList();
                Map<String, Object> map = columnList.stream().collect(Collectors.toMap(s -> s.getName(), s -> s.getValue()));
                list.add(map);
            }
        }
        return list;
    }

    /**
     * 执行
     *
     * @param request
     */
    public void execute(Object request) {
        try {
            System.out.println(request.getClass());
            if (request.getClass().equals(IndexRequest.class)) {
                System.out.println("新增");
                restHighLevelClient.index((IndexRequest) request, RequestOptions.DEFAULT);
            } else if (request.getClass().equals(UpdateRequest.class)) {
                restHighLevelClient.update((UpdateRequest) request, RequestOptions.DEFAULT);
            } else if (request.getClass().equals(DeleteRequest.class)) {
                restHighLevelClient.delete((DeleteRequest) request, RequestOptions.DEFAULT);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
