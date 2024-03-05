package com.listening;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.listening.Mapper")
@SpringBootApplication
public class ListeningApplication {

    public static void main(String[] args) {
        SpringApplication.run(ListeningApplication.class, args);
    }

}
