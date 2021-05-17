<%-- 
    Document   : users
    Created on : 17 de mai. de 2021, 15:24:31
    Author     : rlarg
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("user.add")!=null){
        String name = request.getParameter("user.name");
        String email = request.getParameter("user.email");
        String password = request.getParameter("user.password");
        User newUser = new User(name, email, password.hashCode());
        Database.addUser(newUser);
        response.sendRedirect(request.getRequestURI());
    }else if(request.getParameter("user.remove")!=null){
        String email = request.getParameter("user.email");
        Database.removeUser(email);
        response.sendRedirect(request.getRequestURI());
    }
    
    ArrayList<User> users = Database.getUsers();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - MySuperApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Usuários</h2>
        <%if(!"Administrador".equals(session.getAttribute("session.name"))){%>
            <p>Você não tem autorização para acessar o sistema</p>
            <p></p>
            <p>Favor fazer o login!</p>
        <%} else {%>
            
        <form>
            Nome: <input type="text" name="user.name"/>
            Email: <input type="text" name="user.email"/>
            Password: <input type="password" name="user.password"/>
            <input type="submit" name="user.add"/>
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>Exclusão</th>
            </tr>
            <%for(User user: users){%>
            <tr>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td>
                    <form>
                        <input type="hidden" name="user.email" value="<%=user.getEmail()%>"/>
                        <input type="submit" name="user.remove" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <%} %>
        </table>
            
        <%}%>
    </body>
</html>
