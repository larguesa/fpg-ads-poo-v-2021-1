<%-- 
    Document   : index
    Created on : 29 de mar. de 2021, 15:32:49
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("set")!=null){
        session.setAttribute("session.name", request.getParameter("name"));
        response.sendRedirect(request.getRequestURI());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index - JavaAttributes</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h2>Atributo de Sessão</h2>
        <%if(session.getAttribute("session.name")!=null){%>
            <div>name: <%= session.getAttribute("session.name") %></div>
        <%}%>
        
        <form>
            <input type="text" name="name"/>
            <input type="submit" name="set" value="Set"/>
        </form>
        
    </body>
</html>
