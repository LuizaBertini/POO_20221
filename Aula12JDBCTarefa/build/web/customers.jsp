<%-- 
    Document   : index
    Created on : 9 de mai. de 2022, 16:02:44
    Author     : Fatec
--%>

<%@page import="model.Employees"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Costumers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    Exception requestEx = null;
    ArrayList<Costumers> list = new ArrayList<>();
    int costumersCount = 0;
    
    try{
        costumersCount = Costumers.getCostumersCount();
        list = Costumers.getCostumersList(); // aqui só lê a lista
    } catch(Exception e){
        requestEx = e;
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index - Tarefa JDBC</title>
    </head>
    <body>
        <%if (requestEx != null) {%>
            <h3><%= requestEx.getMessage()%></h3>
        <%} else {%>
            <h1>Lista de Clientes (Total de <%= costumersCount%>) | <a href="index.jsp"> Voltar </a></h1>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>Empresa</th>
                </tr>
                <%for(Costumers c: list){%>
                <tr>
                    <td><%= c.getCostumerID()%></td>
                    <td><%= c.getFirstName()%></td>
                    <td><%= c.getLastName()%></td>
                    <td><%= c.getCompany()%></td>
                </tr>
                <%}%>
            </table>
        <%}%>
        <hr/>
        <h4> Created by Maria Luiza Bertini (RA 1290481923005)</h4>
       
    </body>
</html>
