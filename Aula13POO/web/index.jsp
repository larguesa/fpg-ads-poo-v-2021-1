<%-- 
    Document   : index
    Created on : 10 de mai. de 2021, 15:36:23
    Author     : rlarg
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="teste.Base"%>
<%@page import="teste.Contato"%>
<%@page import="teste.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%ArrayList<Contato> contatos = Base.getContatos();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POO - Testes</title>
    </head>
    <body>
        <h1>Testes com a classe 'Data'</h1>
        <%
            Data independênciaDoBrasil = new Data(7, 9, 1822);
        %>
        <h2>Data da Independência do Brasil</h2>
        <h3><%= independênciaDoBrasil.getData() %></h3>
        <h2>Aniversário do Brasil</h2>
        <h3><%= independênciaDoBrasil.getAniversário()%></h3>
        <h1>Testes com as classes 'Base' e 'Contato'</h1>
        <table border='1'>
            <tr>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Aniversário</th>
            </tr>
            <% for(Contato c: contatos) { %>
            <tr>
                <td><%= c.getNome() %></td>
                <td><%= c.getTefone() %></td>
                <td><%= c.getNascimento().getAniversário() %></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
