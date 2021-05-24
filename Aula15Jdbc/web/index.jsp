<%-- 
    Document   : index
    Created on : 24 de mai. de 2021, 15:35:11
    Author     : rlarg
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    /*
    Considerando que foi criado um banco de dados manualmente utilizando a aba "Services":
    1) Carregando o driver na pasta "Drvers";
    2) Criando um banco na pasta 'C:\Users\[user]\Desktop\test.db'
    
    *instruções no vídeo da aula 15
    */
    String error = null;
    ArrayList<String> tasks = new ArrayList<>();
    try{
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:C:\\Users\\[user]\\Desktop\\test.db";
        Connection con = DriverManager.getConnection(url);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from Tasks");
        while(rs.next()){
            tasks.add(rs.getString("name"));
        }
        rs.close();
        stmt.close();
        con.close();
    }catch(Exception ex){
        error = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JDBC - Início</title>
    </head>
    <body>
        <h1>JDBC</h1>
        <h2>Início</h2>
        <%if(error != null){%>
        <div style="color: red"><%= error %></div>
        <%}%>
        <ul>
        <%for(String taskName: tasks){%>
        <li><%= taskName %></li>
        <%}%>
        </ul>
    </body>
</html>
