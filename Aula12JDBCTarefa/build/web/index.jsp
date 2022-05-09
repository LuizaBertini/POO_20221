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
    //ArrayList<Costumers> list = new ArrayList<>();
    int costumersCount = 0;
    int employeesCount = 0;
    
    try{
        costumersCount = Costumers.getCostumersCount();
        employeesCount = Employees.getEmployeesCount();
    //list = Costumers.getCostumersList(); // aqui só lê a lista
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
            <h1><a href="customers.jsp">Lista de Clientes (Total de <%= costumersCount%>)</a></h1>
            <h1><a href="employee.jsp">Lista de Funcionários (Total de <%= employeesCount%>)</a></h1>
        <%}%>
        <hr/>
        <h4> Created by Maria Luiza Bertini (RA 1290481923005)</h4>
    </body>
</html>
