<%-- 
    Document   : calendario
    Created on : 21 de mar. de 2022, 15:51:37
    Author     : Fatec
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.YearMonth"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int mes=0;
int ano=2021;
String month=null;
String errorMessage=null;    
if(request.getParameter("mes")==null || Integer.parseInt(request.getParameter("mes")) == 0){
    errorMessage = "Não foi informado o parâmetro necessário (mês)"; 
} else if (Integer.parseInt(request.getParameter("mes")) > 12) {
    errorMessage = "Valor informado como mês não é um valor válido (maior do que 12)"; 
} else if(request.getParameter("ano")==null || Integer.parseInt(request.getParameter("ano")) == 0){
    errorMessage = "Não foi informado o parâmetro necessário (ano)"; 
} else {
    try {
        mes = Integer.parseInt(request.getParameter("mes"));
        ano = Integer.parseInt(request.getParameter("ano"));
    } catch(Exception err){
        errorMessage = "O valor informado como parâmetro não é um valor válido" ;
    }
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendario JSP</title>
    </head>
    <body>
        <h1>Calendário</h1>
        
        <% if(errorMessage != null) {%>  
            <div style="color: red"><%= errorMessage %></div>
        <% } else {        
        
            switch (mes) {
                case 1:
                    %><h3>Janeiro, <%=ano%></h3><%
                    month = "January";
                break;
                case 2:
                    %><h3>Fevereiro, <%=ano%></h3><%
                    month = "February";
                break;
                case 3:
                    %><h3>Março, <%=ano%></h3><%
                    month = "March";
                break;
                case 4:
                    %><h3>Abril, <%=ano%></h3><%
                    month = "April";
                break;
                case 5:
                    %><h3>Maio, <%=ano%></h3><%
                    month = "May";
                break;
                case 6:
                    %><h3>Junho, <%=ano%></h3><%
                    month = "June";
                break;
                case 7:
                    %><h3>Julho, <%=ano%></h3><%
                    month = "July";
                break;
                case 8:
                    %><h3>Agosto, <%=ano%></h3><%
                    month = "August";
                break;
                case 9:
                    %><h3>Setembro, <%=ano%></h3><%
                    month = "September";
                break;
                case 10:
                    %><h3>Outubro, <%=ano%></h3><%
                    month = "Octuber";
                break;
                case 11:
                    %><h3>Novembro, <%=ano%></h3><%
                    month = "November";
                break;
                case 12:
                    %><h3>Dezembro, <%=ano%></h3><%
                    month = "December";
                break;
                default:
                    %><h3>Mês Inválido</h3><%
                break;
            }
            YearMonth date = YearMonth.of(ano, mes); 
            int qtd_dias = date.lengthOfMonth(); // quantidade de dias no mês
            int dia_inicio_mes = 0;
            Date d = new Date(mes, ano, 1); 
            Calendar c = new GregorianCalendar(); 
            c.setTime(d); 
            String nome = ""; 
            int dia = c.get(c.DAY_OF_WEEK) - 1; 
            
            switch(dia){ 
            case Calendar.SUNDAY: 
                nome = "Domingo";
                dia_inicio_mes = 0;
            break; 
            case Calendar.MONDAY: 
                nome = "Segunda";
                dia_inicio_mes = 1;
            break; 
            case Calendar.TUESDAY: 
                nome = "Terça";
                dia_inicio_mes = 2;
            break; 
            case Calendar.WEDNESDAY: 
                nome = "Quarta";
                dia_inicio_mes = 3;
            break; 
            case Calendar.THURSDAY: 
                nome = "Quinta";
                dia_inicio_mes = 4;
            break; 
            case Calendar.FRIDAY: 
                nome = "Sexta";
                dia_inicio_mes = 5;
            break; 
            case Calendar.SATURDAY: 
                nome = "sábado";
                dia_inicio_mes = 6;
            break; 
            } 
            %>
            <table border="1">    
            <tr> 
                <td>Domingo</td>
                <td>Segunda</td>
                <td>Terça</td>
                <td>Quarta</td>
                <td>Quinta</td>
                <td>Sexta</td>
                <td>Sábado</td>
                
            </tr>
            <tr>
            <% 
            for(int j = 1; j<=dia_inicio_mes; j++){
                %><td></td><%
            }
            for(int i = 1; i <= qtd_dias; i++) { 
                %><td><%= i %></td><%
                if((i + dia_inicio_mes) % 7 == 0) {
                    %></tr><tr><%
                } 
                    
             }
            %>
            </tr>
            </table>
        <% } %>
        <hr>
        <form action="calendario.jsp">
            Mês: <input type="number" name="mes" value="<%= mes %>"><br><br>
            Ano: <input type="number" name="ano" value="<%= ano %>"><br><br>
            <input type="submit" value="Gerar">
        </form>
     
        <h4><a href="index.jsp">Voltar</a></h4>
    </body>
</html>