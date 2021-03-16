<%-- 
    Document   : datahora
    Created on : 15 de mar. de 2021, 15:36:02
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data/hora - JSP</title>
    </head>
    <body>
        <a href="index.html">Voltar</a>
        <h1>Aula 06 - Java Server Pages</h1>
        <h2>Data / hora no servidor</h2>
        <h3>...com scriptlet:</h3>
        <%
            
            java.util.Date serverTime = new java.util.Date();
            out.println(serverTime);
        %>
        <h3>...com expression:</h3>
        <%= new java.util.Date() %>
    </body>
</html>
