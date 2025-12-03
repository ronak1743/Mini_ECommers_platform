package com.ronak.model;

import io.github.cdimascio.dotenv.Dotenv;
//import io.github.cdimascio.dotenv.DotenvException;

public class Database {
    private final String url;
    private final String user;
    private final String pass;

    public Database() {
        String envUrl = System.getenv("DB_URL");
        String envUser = System.getenv("DB_USER");
        String envPass = System.getenv("DB_PASS");

        if (envUrl != null && envUser != null && envPass != null) {
            System.out.println("Using system environment variables.");
            url = envUrl;
            user = envUser;
            pass = envPass;
        } else {
            System.out.println("System vars not found, attempting to load from .env file in project root.");
            try {

                Dotenv dotenv = Dotenv.load();

                url = dotenv.get("DB_URL");
                user = dotenv.get("DB_USER");
                pass = dotenv.get("DB_PASS");

                if (url == null || user == null || pass == null) {
               }

            } catch (Exception e) {
                System.err.println("Error loading .env file: " + e.getMessage());
                throw new RuntimeException("Database configuration failed: Cannot find .env file or missing variables.", e);
            }
        }
    }

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }
}
