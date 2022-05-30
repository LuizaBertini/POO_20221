<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 13:40:43
    Author     : Fatec
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Exception userException = null;
    ArrayList<Users> users = new ArrayList<>();
    
    try {
        users = Users.getAllUsers();
        if (request.getParameter("user-add") != null) {
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            Users user = new Users(
               username, 
               (username+password).hashCode(), 
                name      
            );
            Users.AddUsers(user);
            response.sendRedirect(request.getRequestURI());
        } else if (request.getParameter("user-delete") != null) {
            String username = request.getParameter("username");
            Users.DeleteUsers(username);
            response.sendRedirect(request.getRequestURI());
        } else if (request.getParameter("alter-password") != null) {
            String username = request.getParameter("username");
            String newPassword = request.getParameter("newPassword");
            Users.AlterUserPassword(username, username + newPassword.hashCode());
            response.sendRedirect(request.getRequestURI());
        }
    } catch(Exception ex) {
        userException = ex;
    }

    //"123456".hashCode() -- senha em hash

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
        <% if(userException != null) {%>
            <div style="color: red">
                <%= userException.getMessage() %>
            </div>
        <% } %>
        <% if(session.getAttribute("user") != null){%>
            <form>
                <fieldset>
                    <legend>Adicionar um novo usuário</legend>
                    Username: <br/>
                    <input type="text" name="username"/><br/>
                    Nome: <br/>
                    <input type="text" name="name"/><br/>
                    Senha: <br/>
                    <input type="password" name="password"/><br/><br/>
                    <input type="submit" value="Adicionar" name="user-add"/>
                </fieldset>
            </form>
            <h3>Lista de Usuários no BDD</h3>
            <table border="1">
                <tr><th>Usuário</th><th>Nome</th><th>Alterar Senha</th><th>Excluir</th></tr>
                <% for(Users u: users) {%>
                <tr>
                    <td><%= u.getUsername()%></td>
                    <td><%= u.getName()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="username" value="<%= u.getUsername() %>"/>
                            <input type="password" name="newPassword"/>
                            <input type="submit" name="alter-password" value="Alterar senha"/>
                        </form>
                    </td>
                    <td>
                        <form>
                            <input type="hidden" name="username" value="<%= u.getUsername() %>"/>
                            <input type="submit" name="user-delete" value="Excluir"/>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } else { %>
            <p>Você deve estar logado para visualizar esse conteúdo.</p>
        <% }%>
        
        <h4><a href="index.jsp">Voltar</a></h4>
    </body>
</html>
