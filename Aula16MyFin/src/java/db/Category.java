/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author rlarg
 */
public class Category {
    private String name;
    private String description;
    
    public static ArrayList<Category> getCategories() throws Exception{
        ArrayList<Category> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from categories ORDER BY name");
        while(rs.next()){
            list.add(new Category(
                    rs.getString("name")
                    , rs.getString("description")
            ));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addCategory(String name, String description) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "INSERT INTO categories(name, description)"
                + "VALUES(?, ?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, description);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void removeCategory(String name) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "DELETE FROM categories WHERE name = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Category(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}