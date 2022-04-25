<%-- 
    Document   : index
    Created on : 25 de abr. de 2022, 13:40:32
    Author     : Fatec
--%>

<%@page import="demo.DataBase"%>
<%@page import="demo.Contato"%>
<%@page import="demo.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Data hoje = new Data();
        
hoje.setAno(2022);
hoje.setMes(4);
hoje.setDia(25);

Data amanha = new Data();
amanha.setData(26, 4, 2022);

Data padrao = new Data(); // pega a data do construtor

Data nasc = new Data(21, 04, 2001);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <hr/>
        <h2>Testes com a classe Data</h2>
        <h3>Hoje é dia <%= hoje.getDia() %></h3>
        <h3>Amanhã é dia <%= amanha.getDia() %></h3>
        <h3>Dia padrão: <%= padrao.getData() %></h3>
        <h3>Dia de nascimento: <%= nasc.getData() %></h3>
        <h3>Dia de aniversário: <%= nasc.getAniversario() %></h3>
        <hr/>
        <h2>Testes com a classe Contato</h2>
        <h2>Lista de contatos a partir do método Contato.getList()</h2>
        <table border="1">
            <tr><th>Nome</th><th>Telefone</th><th>Aniversario</th></tr>
            <% for(Contato c: Contato.getList()){%>
            <tr>
                <td><%= c.getNome()%></td>
                <td><%= c.getTelefone()%></td>
                <td><%= c.getNascimento().getAniversario()%></td>
            </tr>
            <% } %>
        </table>
        
        <h2>Lista de contatos a partir do método DataBase.getContatos()</h2>
        <table border="1">
            <tr><th>Nome</th><th>Telefone</th><th>Aniversario</th></tr>
            <% for(Contato c: DataBase.getContatos()){%>
            <tr>
                <td><%= c.getNome()%></td>
                <td><%= c.getTelefone()%></td>
                <td><%= c.getNascimento().getAniversario()%></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
