<%-- 
    Document   : users
    Created on : 31 de mai. de 2021, 16:22:43
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    if(request.getParameter("add")!=null){
        String login = request.getParameter("login");
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        try{
            User.addUser(login, name, role, password);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na criação do usuário ["+ex.getMessage()+"]";
        }
    }else if(request.getParameter("remove")!=null){
        String login = request.getParameter("login");
        try{
            User.removeUser(login);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na exclusão do usuário ["+ex.getMessage()+"]";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - MyFinance$</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(requestError != null){%>
            <div style="color: red">
                Erro ao manipular usuário: <%= requestError %>
            </div>
        <%}%>
        <h2>Usuários</h2>
        <% String login = (String) session.getAttribute("user.login");%>
        <% String role = (String) session.getAttribute("user.role");%>
        <%if(login == null){%>
            <div>Esta página é restrita a usuários logados.</div>
        <%}else if(!role.equals("ADMIN")){%>
            <div>Esta página é restrita a administradores.</div>
        <%}else{%>
        <form method="post">
            Nome: <input type="text" name="name"/>
            Login: <input type="text" name="login"/>
            Papél: <select name="role">
                <option value="ADMIN">ADMIN</option>
                <option value="USER">USER</option>
            </select>
            Password: <input type="password" name="password"/>
            <input type="submit" name="add" value="Adicionar Usuário"/>
        </form>
        <br/>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Login</th>
                <th>Papel</th>
                <th>Exclusão</th>
            </tr>
            <%for(User user: User.getUsers()){%>
                <tr>
                    <td><%= user.getName() %></td>
                    <td><%= user.getLogin()%></td>
                    <td><%= user.getRole() %></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="login" value="<%= user.getLogin()%>"/>
                            <input type="submit" name="remove" value="Remover"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>
