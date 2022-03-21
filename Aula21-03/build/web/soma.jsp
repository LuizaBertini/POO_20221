<%-- 
    Document   : index
    Created on : 21 de mar. de 2022, 13:49:14
    Author     : Fatec
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean hasParameters = request.getParameter("somar")!=null;
    String errorMessage = null;
    double n1 = 0, n2 = 0, soma = 0;
    try {
        if(hasParameters) {
            String p1 = request.getParameter("n1");
            n1 = Double.parseDouble(p1);
            String p2 = request.getParameter("n2");
            n2 = Double.parseDouble(p2);
            soma = n1+n2;
        }
    } catch (Exception err) {
        errorMessage = err.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4><a href="index.jsp">Voltar</a></h4>
        <h1>Java EE</h1>
        <h2>Java Server Pages</h2>
        <h3>Somar dois valores</h3>
        <% if (errorMessage != null) { %>
                <h4 style="color: red"> <%= errorMessage %> </h4>
        <%  } else if (hasParameters) { %>
                <h4><%= n1 %> + <%= n2 %> = <%= soma%></h4>
        <%  } %>
        <form action="soma.jsp">
            Número 1: <input type="text" name="n1" value="<%= n1 %>"/><br/><br/>
            Número 2: <input type="text" name="n2" value="<%= n2 %>"><br/><br/>
            <input type="submit" value="Somar" name="somar"/>
        </form>
    </body>
</html>
