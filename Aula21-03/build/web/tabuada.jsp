<%-- 
    Document   : index
    Created on : 21 de mar. de 2022, 13:49:14
    Author     : Fatec
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean hasParameters = request.getParameter("tabuada")!=null;
    String errorMessage = null;
    int n = 0;
    try {
        if(hasParameters) {
            String p = request.getParameter("n");
            n = Integer.parseInt(p);
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
        <h3>Tabuada</h3>
        <% if (errorMessage != null) { %>
                <h4 style="color: red"> <%= errorMessage %> </h4>
        <%  } else if (hasParameters) { %>
                <table>
                    <% for(int i = 0; i <= 10; i++) { %>
                    <tr>
                        <td><%= n %> X <%= i %> = <%= n*i %></td>
                    </tr>
                    <% } %>
                </table>                
        <%  } %>
        <hr/>
        <form action="tabuada.jsp">
            Número: <input type="number" name="n" value="<%= n %>"/><br/><br/>
            <input type="submit" value="Tabuada" name="tabuada"/>
        </form>
    </body>
</html>