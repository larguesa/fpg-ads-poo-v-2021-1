<%-- 
    Document   : my-profile
    Created on : 31 de mai. de 2021, 16:50:52
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    if(request.getParameter("changePassword")!=null){
        String login = (String) session.getAttribute("user.login");
        String pass = request.getParameter("pass");
        String novoPass = request.getParameter("novoPass");
        String confirmNovoPass = request.getParameter("confirmNovoPass");
        try{
            if(User.getUser(login, pass)==null){
                requestError = "Senha inválida.";
            }else if(!novoPass.equals(confirmNovoPass)){
                requestError = "A confirmação do novo password está inválida.";
            }else{
                User.changePassword(login, novoPass);
                response.sendRedirect(request.getRequestURI());
            }
        }catch(Exception ex){
            requestError = "Falha na criação do usuário ["+ex.getMessage()+"]";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu Perfil - MyFinance$</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(requestError != null){%>
            <div style="color: red">
                Erro ao manipular perfil: <%= requestError %>
            </div>
        <%}%>
        <h2>Meu Perfil</h2>
        <% String name = (String) session.getAttribute("user.name");%>
        <% String login = (String) session.getAttribute("user.login");%>
        <% String role = (String) session.getAttribute("user.role");%>
        <%if(login == null){%>
            <div>Esta página é restrita a usuários logados.</div>
        <%}else{%>
        <h3>Nome:</h3>
        <div><%= name %></div>
        <h3>Login:</h3>
        <div><%= login %></div>
        <h3>Papel:</h3>
        <div><%= role %></div>
        <fieldset>
            <legend>Alterar password</legend>
            <form method="post">
                Password atual:
                <br/><input type="password" name="pass"/>
                <br/>Novo password:
                <br/><input type="password" name="novoPass"/>
                <br/>Confirmação do novo password:
                <br/><input type="password" name="confirmNovoPass"/>
                <hr/>
                <input type="submit" name="changePassword" value="Alterar Password"/>
            </form>
        </fieldset>
        <%}%>
    </body>
</html>