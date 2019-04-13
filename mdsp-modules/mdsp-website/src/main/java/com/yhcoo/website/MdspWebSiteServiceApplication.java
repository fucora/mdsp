package com.yhcoo.website;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@EnableFeignClients
@SpringBootApplication
@ComponentScan(basePackages = {"com.yhcoo.website", "com.yhcoo.common"})
public class MdspWebSiteServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MdspWebSiteServiceApplication.class, args);
    }
}
