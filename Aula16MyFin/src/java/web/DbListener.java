/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import db.Category;
import db.User;
import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author rlarg
 */
public class DbListener implements ServletContextListener {
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:myfin.db";
    
    public static String step = null;
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            step = "Conectando com a base";
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            //stmt.execute("DROP TABLE users");
            step = "Criando tabela de usuários";
            String sql = "CREATE TABLE IF NOT EXISTS users("
                    + "name VARCHAR(200) NOT NULL,"
                    + "login VARCHAR(50) UNIQUE NOT NULL,"
                    + "password_hash LONG,"
                    + "role VARCHAR(20) NOT NULL"
                    + ")";
            stmt.execute(sql);
            if(User.getUsers().isEmpty()){
                step = "Inserindo usuários";
                sql = "INSERT INTO users(name, login, password_hash, role) "
                    + "VALUES('Administrador', 'admin', '"+("1234".hashCode())+"', 'ADMIN')";
                stmt.execute(sql);
                sql = "INSERT INTO users(name, login, password_hash, role) "
                    + "VALUES('Fulano da Silva', 'fulano', '"+("1234".hashCode())+"', 'USER')";
                stmt.execute(sql);
            }
            
            step = "Criando tabela de categories";
            sql = "CREATE TABLE IF NOT EXISTS categories("
                    + "name VARCHAR(50) PRIMARY KEY,"
                    + "description VARCHAR(200) NOT NULL"
                    + ")";
            stmt.execute(sql);
            if(Category.getCategories().isEmpty()){
                step = "Inserindo categorias padrão";
                sql = "INSERT INTO categories(name, description) "
                    + "VALUES('Moradia', 'Despesas com moradia como aluguel, IPTU, luz, água, etc.')";
                stmt.execute(sql);
                sql = "INSERT INTO categories(name, description) "
                    + "VALUES('Alimentação', 'Gastos com restaurantes, mercado, etc.')";
                stmt.execute(sql);
                sql = "INSERT INTO categories(name, description) "
                    + "VALUES('Outras', 'Gastos diversos não especificados.')";
                stmt.execute(sql);
            }
            
            step = "Criando tabela de transações";
            sql = "CREATE TABLE IF NOT EXISTS transactions("
                    + "datetime VARCHAR(25),"
                    + "description VARCHAR(200) NOT NULL,"
                    + "category VARCHAR(50) NOT NULL,"
                    + "value NUMERIC(10,2) NOT NULL,"
                    + "origin VARCHAR(200) NOT NULL,"
                    + "FOREIGN KEY(category) REFERENCES categories(name)"
                    + ")";
            stmt.execute(sql);
            
            stmt.close();
            con.close();
        }catch(Exception ex){
            exception = ex;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
