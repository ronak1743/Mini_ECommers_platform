package com.ronak.model;

import java.sql.*;
import java.util.ArrayList;

public class Connecter {
    Database db=new Database();
    final private String url=db.getUrl();
    final private String user=db.getUser();
    final private String pass=db.getPass();
    public Connecter() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void createUser(String Username, String pass){
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        try {
            Connection c=DriverManager.getConnection(url,user,this.pass);
            PreparedStatement ps=c.prepareStatement(sql);
            ps.setString(1,Username);
            ps.setString(2,pass);
            ps.execute();
            System.out.println("Created user");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isExist(String username){
        String sql="select * from users where username=?";
        try {
            Connection c=DriverManager.getConnection(url,user,this.pass);
            PreparedStatement ps=c.prepareStatement(sql);
            ps.setString(1,username);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                c.close();
                return  true;
            }
            else{
                c.close();
                return false;
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return true;
    }
    public boolean validateUser(String Username, String pass){
        String sql = "select password from users where username=?";
        try {
            Connection c=DriverManager.getConnection(url,user,this.pass);
            PreparedStatement ps=c.prepareStatement(sql);
            ps.setString(1,Username);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                String dbpass=rs.getString("password");
                if(dbpass.equals(pass)){
                    System.out.println("Login ok");

                    c.close();
                    return true;
                }
                else {
                    System.out.println("pass wrong");

                    c.close();
                    return false;
                }
            }
            else{
                System.out.println("No user");

                c.close();
                return  false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public ArrayList<Item> getList(){
        ArrayList<Item>list=new ArrayList<>();
        String sql = "select * from items";
        try {
            Connection c = DriverManager.getConnection(url, user, this.pass);
            Statement s =c.createStatement();
            ResultSet rs=s.executeQuery(sql);
            while (rs.next()){
                String name=rs.getString("name");
                String discription=rs.getString("description");
                int id=rs.getInt("id");
                int price=rs.getInt("price");
                String url=rs.getString("image_url");
                list.add(new Item(name,id,discription,price,url));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public void addItem(int itemid, int count, String username) {
        String sql = "INSERT INTO Orders (username, itemid, quantity) VALUES (?, ?, ?);";
        try {
            Connection c = DriverManager.getConnection(url, this.user, this.pass);
            PreparedStatement ps = c.prepareStatement(sql);

            ps.setString(1, username);
            ps.setInt(2, itemid);
            ps.setInt(3, count);



            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Order> getOrders(String user){
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE username = ?;";
        String sql2 = "SELECT * FROM Items WHERE id = ?;";

        try (Connection c = DriverManager.getConnection(url, this.user, this.pass);
             PreparedStatement psItem = c.prepareStatement(sql2);
             PreparedStatement psOrder = c.prepareStatement(sql)) {

            psOrder.setString(1, user); // safely bind username
            ResultSet rs = psOrder.executeQuery();

            while (rs.next()) {
                int itemId = rs.getInt("itemid");

                // get item info
                psItem.setInt(1, itemId);
                ResultSet rsItem = psItem.executeQuery();
                int price = 0;
                String itemName = "";
                if (rsItem.next()) {
                    price = rsItem.getInt("price");
                    itemName = rsItem.getString("name");
                }

                Order o = new Order();
                o.setOid(rs.getInt("oid"));
                o.setUser(user);
                o.setItemid(itemId);
                o.setItemname(itemName);
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(price);
                o.setAmount(price * rs.getInt("quantity"));

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
