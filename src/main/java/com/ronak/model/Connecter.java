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
}
