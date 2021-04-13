<%-- 
    Document   : index
    Created on : 12 de abr. de 2021, 22:26:16
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String disciplinas [] = {"Disciplina 1", "Disciplina 2", "Disciplina 3"};
    
    if(request.getParameter("atualizarNotas")!=null){
        for(int i=0; i<3; i++){
            session.setAttribute("p1_"+i, request.getParameter("p1_"+i));
            session.setAttribute("p2_"+i, request.getParameter("p2_"+i));
        }
        response.sendRedirect(request.getRequestURI());
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index - P1</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>DISCIPLINAS</h2>
        <%if(session.getAttribute("session.username")==null){%>
            <div style="color:red">Você não tem permissão para ver este conteúdo</div>
        <%}else{%>
        <form>
            <table border="1">
                <tr>
                    <th>Disciplina</th>
                    <th>Nota 1</th>
                    <th>Nota 2</th>
                </tr>
                <%for(int i=0; i<3; i++){%>
                <tr>
                    <td><%= disciplinas[i] %></td>
                    <td><input type="number" name="p1_<%=i%>" value="<%= session.getAttribute("p1_"+i) %>"/></td>
                    <td><input type="number" name="p2_<%=i%>" value="<%= session.getAttribute("p2_"+i) %>"/></td>
                </tr>
                <%}%>
            </table>
            <tr/>
            <input type="submit" name="atualizarNotas" value="Atualizar notas"/>
        </form>
        <%}%>
    </body>
</html>
