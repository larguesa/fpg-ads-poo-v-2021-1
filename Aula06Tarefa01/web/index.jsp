<%-- 
    Document   : index
    Created on : 15 de mar. de 2021, 21:33:34
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.GregorianCalendar" %>
<!DOCTYPE html>
<%
    int year = Calendar.getInstance().get(Calendar.YEAR);
    int month = Calendar.getInstance().get(Calendar.MONTH)+1;
    try{
        year = Integer.parseInt(request.getParameter("year"));
        month = Integer.parseInt(request.getParameter("month"));
        if(month<1) {month=12; year -= 1;}
        if(month>12) {month=1; year += 1;}
    }catch (Exception ex){/*Não é preciso fazer nada porque será usado o valor atual de referência*/}
    //Detecta o dia da semana
    Calendar c = Calendar.getInstance();
    c.set(year, month-1, 1);
    int firstWeekDay = c.get(Calendar.DAY_OF_WEEK);
    int monthDays = new GregorianCalendar(year, month-1, 1).getActualMaximum(Calendar.DAY_OF_MONTH);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendário JSP</title>
    </head>
    <body>
        <div align="center">
            <h1>Calendário</h1>
            <h2><%= year %></h2>
            <h3>
                <a href="?year=<%=year%>&month=<%=month-1%>"><<</a>
                <%= month %>
                <a href="?year=<%=year%>&month=<%=month+1%>">>></a>
            </h3>
            <table border="1">
                <tr>
                    <th>DOMINGO</th>
                    <th>SEGUNDA</th>
                    <th>TERÇA</th>
                    <th>QUARTA</th>
                    <th>QUINTA</th>
                    <th>SEXTA</th>
                    <th>SÁBADO</th>
                </tr>
                <% int day = 0; %>
                
                <%for(int week=1; week<=6; week++){%>
                    <tr>
                    <%for(int weekDay=1; weekDay<=7; weekDay++){%>
                        <%if(day == 0 && firstWeekDay == weekDay) day=1;%>
                        
                        <%if(day==0 || day>monthDays){%>
                            <td>&nbsp;</td>
                        <%}else{%>
                            <td><%= day++ %></td>
                        <%}%>
                    <%}%>
                    
                    <%if(day>monthDays) break;%>
                    </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
