<%-- 
    Document   : index
    Created on : 25 de abr. de 2022, 16:26:57
    Author     : Fatec
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="demo.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Horario intervalo = new Horario(14, 50, 01);

Horario atual = new Horario();
atual.setHorario(18, 11, 44);

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        //return dtf.format(LocalDateTime.now());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horario</title>
    </head>
    <body>
        <h1>Horarios</h1>
        
        <h3>Horário do Intervalo: <%= intervalo.getHorario()%></h3>
        <h3>Horário Atual (com a classe Horario): <%= atual.getHorario()%></h3>
        <h3>Horário Atual (com a classe LocalDateTime.now()): <%= dtf.format(LocalDateTime.now())%></h3>
        
        <hr/>
        
        <h4>Maria Luiza Bertini</h4>
        <h4>RA: 1290481923005</h4>
    </body>
</html>
