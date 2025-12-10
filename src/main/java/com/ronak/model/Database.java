package com.ronak.model;

import io.github.cdimascio.dotenv.Dotenv;
//import io.github.cdimascio.dotenv.DotenvException;

public class Database {
    private  String url;
    private  String user;
    private  String pass;

    public Database() {
        Dotenv dotenv = Dotenv.configure()
                .directory("./")    // project root
                .load();
         url = dotenv.get("DB_URL");
         user = dotenv.get("DB_USER");
         pass = dotenv.get("DB_PASS");
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
