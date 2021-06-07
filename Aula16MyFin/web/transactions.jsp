<%-- 
    Document   : transactions
    Created on : 7 de jun. de 2021, 15:53:23
    Author     : rlarg
--%>

<%@page import="db.Category"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.Transaction"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String requestError = null;
    if(request.getParameter("add")!=null){
        String datetime = request.getParameter("datetime");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double value = Double.parseDouble(request.getParameter("value"));
        String origin = request.getParameter("origin");
        try{
            Transaction.addTransaction(datetime, description, category, value, origin);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na criação do transação ["+ex.getMessage()+"]";
        }
    }else if(request.getParameter("update")!=null){
        long rowId = Long.parseLong(request.getParameter("rowId"));
        String datetime = request.getParameter("datetime");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double value = Double.parseDouble(request.getParameter("value"));
        String origin = request.getParameter("origin");
        try{
            Transaction.updateTransaction(rowId, datetime, description, category, value, origin);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na criação do transação ["+ex.getMessage()+"]";
        }
    }else if(request.getParameter("remove")!=null){
        long rowId = Long.parseLong(request.getParameter("rowId"));
        try{
            Transaction.removeTransaction(rowId);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na exclusão do transação ["+ex.getMessage()+"]";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transações - MyFinance$</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(requestError != null){%>
            <div style="color: red">
                Erro ao manipular usuário: <%= requestError %>
            </div>
        <%}%>
        <h2>Transações</h2>
        <% String login = (String) session.getAttribute("user.login");%>
        <%if(login == null){%>
            <div>Esta página é restrita a usuários logados.</div>
        <%}else{%>
        
        <%if(request.getParameter("pepareAdd")!=null){%>
            <fieldset>
                <legend>Nova transação</legend>
                <form method="post">
                    Data / hora: 
                    <input type="datetime-local" name="datetime" value="<%= new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").format(new Date()) %>"/>
                    Descrição:
                    <input type="text" name="description"/>
                    Categoria: <select name="category">
                        <option value=""></option>
                        <%for(Category c: Category.getCategories()){%>
                        <option value="<%= c.getName() %>">
                            <%= c.getName() %>
                        </option>
                        <%}%>
                    </select>
                    Valor: <input type="number" step="0.01" name="value"/>
                    Origem: <input type="text" name="origin"/>
                    <br/><br/>
                    <input type="submit" name="add" value="Adicionar"/>
                    <input type="submit" name="cancel" value="Cancelar"/>
                </form>
            </fieldset>
        <%}else if(request.getParameter("prepareUpdate")!=null){%>
            <fieldset>
                <legend>Alterar transação</legend>
                <% long rowId = Long.parseLong(request.getParameter("rowId")); %>
                <% Transaction t = Transaction.getTransaction(rowId); %>
                <% if(t == null){ %>
                    <div>O registro <%= request.getParameter("rowId") %> não foi encontrado</div>
                <% } else {%>
                    <form method="post">
                        Data / hora: 
                        <input type="datetime-local" name="datetime" value="<%= t.getDatetime() %>"/>
                        Descrição:
                        <input type="text" name="description" value="<%= t.getDescription() %>"/>
                        Categoria: <select name="category">
                            <option value=""></option>
                            <%for(Category c: Category.getCategories()){%>
                            <option value="<%= c.getName() %>" <%= c.getName().equals(t.getCategory()) ? "selected" : "" %>>
                                <%= c.getName() %>
                            </option>
                            <%}%>
                        </select>
                        Valor: <input type="number" step="0.01" name="value" value="<%= t.getValue() %>"/>
                        Origem: <input type="text" name="origin" value="<%= t.getOrigin() %>"/>
                        <br/><br/>
                        <input type="hidden" name="rowId" value="<%= request.getParameter("rowId") %>"/>
                        <input type="submit" name="update" value="Alterar"/>
                        <input type="submit" name="cancel" value="Cancelar"/>
                    </form>
                <% } %>
            </fieldset>
        <%}else if(request.getParameter("pepareRemove")!=null){%>
            <fieldset>
                <legend>Remover transação</legend>
                <form method="post">
                    Deseja realmente remover a transação <%= request.getParameter("rowId") %>?
                    <br/><br/>
                    <input type="hidden" name="rowId" value="<%= request.getParameter("rowId") %>"/>
                    <input type="submit" name="remove" value="Remover"/>
                    <input type="submit" name="cancel" value="Cancelar"/>
                </form>
            </fieldset>
        <%}else{%>
            <form method="post">
                <input type="submit" name="pepareAdd" value="Adicionar"/>
            </form>
        <%}%>
        <hr/>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Data/hora</th>
                <th>Descrição</th>
                <th>Categoria</th>
                <th>Valor</th>
                <th>Origem</th>
                <th>Comandos</th>
            </tr>
            <%for(Transaction t: Transaction.getTransactions()){%>
                <tr>
                    <td><%= t.getRowId() %></td>
                    <td><%= t.getDatetime() %></td>
                    <td><%= t.getDescription() %></td>
                    <td><%= t.getCategory() %></td>
                    <td><%= t.getValue() %></td>
                    <td><%= t.getOrigin() %></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="rowId" value="<%= t.getRowId()%>"/>
                            <input type="submit" name="prepareUpdate" value="Alterar"/>
                            <input type="submit" name="pepareRemove" value="Remover"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>
