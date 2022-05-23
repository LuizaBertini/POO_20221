<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 13:40:43
    Author     : Fatec
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Exception indexException = null;
    int usersCount = -1;
    
    try {
        usersCount = Users.getAllUsers().size();
    } catch(Exception ex) {
        indexException = ex;
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyTasks</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h1>Início</h1>
        <h3>
            Total de Usuários: 
            <!--<a href="users.jsp">--><%= (usersCount>-1)? usersCount : "0"%><!--</a>-->
        </h3>
        
        <%= "1234".hashCode() %>
</html>
