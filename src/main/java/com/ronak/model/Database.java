package com.ronak.model;

public class Database {
    final private String url="jdbc:mysql://localhost:3306/LetsOrder";
    final private String user="root";
    final private String pass="root@123";

    public String getPass() {
        return pass;
    }

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }
}
