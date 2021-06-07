<%-- 
    Document   : categories
    Created on : 7 de jun. de 2021, 15:27:10
    Author     : rlarg
--%>

<%@page import="db.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    if(request.getParameter("add")!=null){
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        try{
            Category.addCategory(name, description);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na criação do categoria ["+ex.getMessage()+"]";
        }
    }else if(request.getParameter("remove")!=null){
        String name = request.getParameter("name");
        try{
            Category.removeCategory(name);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na exclusão do categoria ["+ex.getMessage()+"]";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias - MyFinance$</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(requestError != null){%>
            <div style="color: red">
                Erro ao manipular usuário: <%= requestError %>
            </div>
        <%}%>
        <h2>Categorias</h2>
        <% String login = (String) session.getAttribute("user.login");%>
        <%if(login == null){%>
            <div>Esta página é restrita a usuários logados.</div>
        <%}else{%>
        <fieldset>
            <legend>Nova categoria:</legend>
            <form method="post">
                Nome: 
                <br/><input type="text" name="name"/>
                <br/>Descrição:
                <br/><input type="text" name="description"/>
                <br/><br/>
                <input type="submit" name="add" value="Adicionar"/>
            </form>
        </fieldset>
        <br/>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Exclusão</th>
            </tr>
            <%for(Category cat: Category.getCategories()){%>
                <tr>
                    <td><%= cat.getName() %></td>
                    <td><%= cat.getDescription()%></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="name" value="<%= cat.getName()%>"/>
                            <input type="submit" name="remove" value="Remover"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>