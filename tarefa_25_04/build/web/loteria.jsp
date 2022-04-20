<%-- 
    Document   : index
    Created on : 20 de abr. de 2022, 00:00:43
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    
    if(request.getParameter("gerar-nums") != null){
        session.setAttribute("0", request.getParameter("0"));
        session.setAttribute("1", request.getParameter("1"));
        session.setAttribute("2", request.getParameter("2"));
        session.setAttribute("3", request.getParameter("3"));
        session.setAttribute("4", request.getParameter("4"));
        session.setAttribute("5", request.getParameter("5"));
        response.sendRedirect(request.getRequestURI());
    }
    String num0 = (String) session.getAttribute("0");
    String num1 = (String) session.getAttribute("1");
    String num2 = (String) session.getAttribute("2");
    String num3 = (String) session.getAttribute("3");
    String num4 = (String) session.getAttribute("4");
    String num5 = (String) session.getAttribute("5");
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/header.jspf"%>
    </head>
    <body>
        
        <%if(sessionName == null){%>
            <br/>
            <h2>Deve estar logado para visualizar esta pagina!</h2>
            <br/><br/>
            
        <%} else { %>
            <p> Bem vindo(a), <%= sessionName%> <input type="submit" name="session-logout" value="Sair"> </p>
            
            <input type="submit" name="gerar-nums" value="Gerar Numeros">
            <div name="session-numbers">
            <table border="1">
                
                    <% 
                    if(session.getAttribute("gerar-nums") == null) {
                        for(int i=0;i<6; i++) {
                            int num = ((int)(Math.random()*100));
                    %>
                            <td name="<%= i%>"><%= num %></td>
                    <%  }  
                    } else { %>
                            <td name="num1"><%= num0 %></td>
                            <td name="num2"><%= num1 %></td>
                            <td name="num3"><%= num2 %></td>
                            <td name="num4"><%= num3 %></td>
                            <td name="num5"><%= num4 %></td>
                            <td name="num6"><%= num5 %></td>
                    <%  }  %>
                
            </table>
            </div>
            <br/>
            
        <% } %>
    </body>
</html>