<%-- 
    Document   : index
    Created on : 21 de mar. de 2022, 13:49:14
    Author     : Fatec
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean hasParameters = request.getParameter("gerar")!=null;
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
        <h3>Aleatórios</h3>
        <% if (errorMessage != null) { %>
                <h4 style="color: red"> <%= errorMessage %> </h4>
        <%  } else if (hasParameters) { %>
                <table>
                    <tr>
                        <th>Índice</th>
                        <th>Número</th>
                    </tr>
                    <% for(int i = 1; i <= n; i++) { %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= ((int)(Math.random()*100)) %></td>
                    </tr>
                    <% } %>
                </table>                
        <%  } %>
        <hr/>
        <form action="aleatorios.jsp">
            Qntd de números: <input type="number" name="n" value="<%= n %>"/><br/><br/>
            <input type="submit" value="Gerar" name="gerar"/>
        </form>
    </body>
</html>