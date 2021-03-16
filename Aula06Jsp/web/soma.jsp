<%-- 
    Document   : datahora
    Created on : 15 de mar. de 2021, 15:36:02
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    double n1=0, n2=0, soma=0;
    try{
        n1 = Double.parseDouble(request.getParameter("n1"));
        n2 = Double.parseDouble(request.getParameter("n2"));
        soma = n1+n2;
    }catch(Exception ex){
        errorMessage = "Erro na leitura dos parâmetros";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Soma - JSP</title>
    </head>
    <body>
        <a href="index.html">Voltar</a>
        <h1>Aula 06 - Java Server Pages</h1>
        <h2>Soma</h2>
        <%if(errorMessage != null){ %>
            <div style="color: red"><%= errorMessage %></div>
        <%}else{%>
            <%= n1 %> + <%= n2 %> = <b><%= (soma) %></b>
        <%}%>
        <hr/>
        <h2>Nova soma:</h2>
        <form>
            <input type="number" name="n1" />+
            <input type="number" name="n2" />
            <input type="submit" name="somar" value="="/>
        </form>
    </body>
</html>
