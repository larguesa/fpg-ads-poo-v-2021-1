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
        <title>Tabuada - JSP</title>
    </head>
    <body>
        <a href="index.html">Voltar</a>
        <h1>Aula 06 - Java Server Pages</h1>
        <h2>Tabuada</h2>
        <%if(errorMessage != null){ %>
            <div style="color: red"><%= errorMessage %></div>
        <%}else if(n==0){%>
            Nenhum número informado.
        <%}else{%>
            <table>
                <%for(int i=1; i<=10; i++){%>
                <tr>
                    <td><%= n %></td>
                    <td>x <%= i %></td>
                    <td> = <%= (n*i) %></td>
                </tr>
                <%}%>
            </table>
        <%}%>
        <hr/>
        <h2>Nova tabuada:</h2>
        <form>
            <input type="number" name="n" />
            <input type="submit" name="random" value="="/>
        </form>
    </body>
</html>
