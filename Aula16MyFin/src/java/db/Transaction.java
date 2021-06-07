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
public class Transaction {
    private long rowId;
    private String datetime;
    private String description;
    private String category;
    private double value;
    private String origin;
    
    public static ArrayList<Transaction> getTransactions() throws Exception{
        ArrayList<Transaction> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT rowid, * from transactions");
        while(rs.next()){
            list.add(new Transaction(
                    rs.getLong("rowid")
                    , rs.getString("datetime")
                    , rs.getString("description")
                    , rs.getString("category")
                    , rs.getDouble("value")
                    , rs.getString("origin")
            ));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static Transaction getTransaction(long rowId) throws Exception{
        Transaction t = null;
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT rowid, * from transactions WHERE rowid=?");
        stmt.setLong(1, rowId);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            t = new Transaction(
                    rs.getLong("rowid")
                    , rs.getString("datetime")
                    , rs.getString("description")
                    , rs.getString("category")
                    , rs.getDouble("value")
                    , rs.getString("origin")
            );
        }
        rs.close();
        stmt.close();
        con.close();
        return t;
    }
    
    public static void addTransaction(String datetime, String description, String category, double value, String origin) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "INSERT INTO transactions(datetime, description, category, value, origin)"
                + "VALUES(?, ?, ?, round(?, 2), ?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, datetime);
        stmt.setString(2, description);
        stmt.setString(3, category);
        stmt.setDouble(4, value);
        stmt.setString(5, origin);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void updateTransaction(long rowId, String datetime, String description, String category, double value, String origin) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "UPDATE transactions "
                + "SET datetime=?, description=?, category=?, value=round(?, 2), origin=? "
                + "WHERE rowId=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, datetime);
        stmt.setString(2, description);
        stmt.setString(3, category);
        stmt.setDouble(4, value);
        stmt.setString(5, origin);
        stmt.setLong(6, rowId);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void removeTransaction(long rowId) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "DELETE FROM transactions WHERE rowId = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setLong(1, rowId);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Transaction(long rowId, String datetime, String description, String category, double value, String origin) {
        this.rowId = rowId;
        this.datetime = datetime;
        this.description = description;
        this.category = category;
        this.value = value;
        this.origin = origin;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }
    
}