<%-- 
    Document   : datahora
    Created on : 15 de mar. de 2021, 15:36:02
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    double n=0;
    try{
        n = Double.parseDouble(request.getParameter("n"));
    }catch(Exception ex){
        errorMessage = "Erro na leitura do parâmetro";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Números aleatórios - JSP</title>
    </head>
    <body>
        <a href="index.html">Voltar</a>
        <h1>Aula 06 - Java Server Pages</h1>
        <h2>Números aleatórios</h2>
        <%if(errorMessage != null){ %>
            <div style="color: red"><%= errorMessage %></div>
        <%}else if(n==0){%>
            Nenhum número informado.
        <%}else{%>
            <table border="1">
                <tr><th>Índice</th><th>Número</th></tr>
                <%for(int i=1; i<=n; i++){%>
                <tr>
                    <td><%= i %></td>
                    <td><%= (int)(Math.random()*100) %></td>
                </tr>
                <%}%>
            </table>
        <%}%>
        <hr/>
        <h2>Nova lista</h2>
        <form>
            <input type="number" name="n" />
            <input type="submit" name="random" value="="/>
        </form>
    </body>
</html>
