package com.ronak.model;

public class Item {
    private  String name;
    private int id;
    private String discription;
    private int price;
    private String url;

    public Item(String name, int id, String discription, int price, String url) {
        this.name = name;
        this.id = id;
        this.discription = discription;
        this.price = price;
        this.url = url;
    }

    public Item(){}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
