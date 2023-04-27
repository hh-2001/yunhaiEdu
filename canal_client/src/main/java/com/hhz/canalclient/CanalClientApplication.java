package com.hhz.canalclient;

import com.hhz.canalclient.client.CanalClient;
import com.hhz.canalclient.esclient.CanalToEs;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.Resource;

@SpringBootApplication
public class CanalClientApplication implements CommandLineRunner {

    @Resource
    private CanalToEs canalToEs;

    public static void main(String[] args) {
        SpringApplication.run(CanalClientApplication.class, args);
    }

    @Override
    public void run(String... strings) throws Exception {
        //项目启动，执行canal客户端监听
        canalToEs.run();
    }
}
