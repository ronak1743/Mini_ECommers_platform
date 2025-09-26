package com.ronak.model;

public class Carditem {
    String user,Itemname;
    int oid,itemid,quantity;

    public Carditem(String user, String itemname, int oid, int itemid) {
        this.user = user;
        this.Itemname = itemname;
        this.oid = oid;
        this.itemid = itemid;
    }
    public Carditem(){}

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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
