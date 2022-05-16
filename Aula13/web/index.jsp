<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 13:40:43
    Author     : Fatec
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyTasks</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h1>Início</h1>
        <%= "123456".hashCode() %>
        
        <h4>Lista de Usuários no BDD</h4>
        <table border="1">
            <tr><th>Usuário</th><th>Nome</th></tr>
            <% for(Users u: Users.getAllUsers()) {%>
            <tr>
                <td><%= u.getUsername()%></td>
                <td><%= u.getName()%></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
