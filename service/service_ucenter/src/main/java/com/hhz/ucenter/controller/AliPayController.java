package com.hhz.ucenter.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.hhz.ucenter.utils.ConstantAliUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author: hhz
 * @Date: 2023/4/10
 * @Time: 15:15
 * @Description:
 */
@RequestMapping("/api/ucenter/ali")
public class AliPayController {

    //格式化
    private final static String FORMAT = "json";
    //签名类型
    private final static String SIGNTYPE = "RSA2";
    //编码格式
    private final static String CHARSET = "utf-8";

    /*
     * 获取订单信息
     * */
    @GetMapping("getOrderInfo")
    public String getOrderInfo() {
        //实例化客户端
        AlipayClient alipayClient = new DefaultAlipayClient(ConstantAliUtils.GATEWAY_URL, ConstantAliUtils.ALIPAY_APP_ID, ConstantAliUtils.ALIPAY_PRIVATE_KEY, FORMAT, CHARSET, ConstantAliUtils.ALIPAY_PUBLIC_KEY, SIGNTYPE);
        //实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
        AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
        //SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。
        AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
        model.setBody("我是测试数据");
        model.setSubject("App支付测试Java");
        model.setOutTradeNo("这里是交易订单号");
        model.setTimeoutExpress("30m");
        model.setTotalAmount("0.01");
        model.setProductCode("QUICK_MSECURITY_PAY");
        request.setBizModel(model);
        request.setNotifyUrl("商户外网可以访问的异步地址");
        try {
            //这里和普通的接口调用不同，使用的是sdkExecute
            AlipayTradeAppPayResponse response = alipayClient.sdkExecute(request);
            System.out.println(response.getBody());//就是orderString 可以直接给客户端请求，无需再做处理。
            return response.getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @PostMapping("/notify_url")
    public String notify_url(HttpServletRequest request) {
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        try {

            boolean flag = AlipaySignature.rsaCheckV1(params, ConstantAliUtils.ALIPAY_PUBLIC_KEY, CHARSET, SIGNTYPE);
            //如果验签失败
            if (!flag) {
                return "fail";
            }
            //验签成功后
            //商户的业务逻辑  比如修改订单号
            System.out.println("修改订单成功");

        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return "success";
    }
}
