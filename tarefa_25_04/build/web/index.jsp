<%-- 
    Document   : index
    Created on : 20 de abr. de 2022, 00:00:43
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/header.jspf"%>
    </head>
    <body>
        
        <%if(sessionName == null){%>
            <br/>
            <form>
                Usuário: <input type="text" name="session-name"> <br/><br/>
                <input type="submit" name="session-login" value="Entrar">
            </form>
            <br/><br/>
            
        <%} else { %>
            <p> Bem vindo(a), <%= sessionName%> <input type="submit" name="session-logout" value="Sair"> </p>
            <br/>
            
        <% } %>
    </body>
</html>