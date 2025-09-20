package com.ronak.model;

public class Order {
    String user,Itemname;
    int oid,itemid,amount,quantity,price;

    public Order(String user, String itemname, int oid, int itemid, int amount, int quantity, int price) {
        this.user = user;
        Itemname = itemname;
        this.oid = oid;
        this.itemid = itemid;
        this.amount = amount;
        this.quantity = quantity;
        this.price = price;
    }

    public Order() {
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getItemname() {
        return Itemname;
    }

    public void setItemname(String itemname) {
        Itemname = itemname;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
