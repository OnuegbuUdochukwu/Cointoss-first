package org.example.cointoss;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class CointossApplication {

    public static void main(String[] args) {
    // Debug: Print DB_URL at startup
    String dbUrl = System.getenv("DB_URL");
    System.out.println("\n==============================");
    System.out.println("DB_URL at startup: " + dbUrl);
    System.out.println("==============================\n");
    SpringApplication.run(CointossApplication.class, args);
    }

}
