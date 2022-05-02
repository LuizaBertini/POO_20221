<%-- 
    Document   : index
    Created on : 2 de mai. de 2022, 13:49:34
    Author     : Fatec
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="demo.Pessoa"%>
<%
    Pessoa maria = new Pessoa("Maria");
    Pessoa jose = new Pessoa("Jose");
    Pessoa ana = new Pessoa("Ana");
    Pessoa paulo = new Pessoa("Paulo");
    jose.setPai(paulo);
    jose.setMae(ana);
    Pessoa helena = new Pessoa("Helena");
    helena.setMae(maria);
    Pessoa eu = new Pessoa("Laura");
    eu.setPai(jose);
    eu.setMae(helena);
    Pessoa agatha = new Pessoa("Agatha");
    agatha.setMae(eu);
    Pessoa kiara = new Pessoa("Kiara");
    kiara.setMae(eu);
    ArrayList<Pessoa> lista = new ArrayList<>();
    lista.add(paulo); 
    lista.add(jose);
    lista.add(ana);
    lista.add(maria);
    lista.add(eu);
    lista.add(agatha);
    lista.add(kiara);
    //Pessoa eu2 = new Pessoa("12345678900", "Luana", 1.6, 60, '05/06/2000');
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <hr/>
        <div>
            <table border="1">
                <tr>
                    <th>Nome</th>
                    <th>Pai</th>
                    <th>Avó Paterna</th>
                    <th>Avô Paterno</th>
                    <th>Mae</th>
                    <th>Avó Materna</th>
                    <th>Avô Materno</th>
                </tr>
                <% for(Pessoa p: lista) {%>
                <tr>
                    <td><%= p.getNome()%></td>
                    <td><%= (p.getPai() != null)? p.getPai().getNome(): "" %></td>
                    <td><%= (p.getPai() != null && p.getAvóPaterno() != null)? p.getAvóPaterno().getNome(): "" %></td>
                    <td><%= (p.getPai() != null && p.getAvôPaterno() != null)? p.getAvôPaterno().getNome(): "" %></td>
                    <td><%= (p.getMae() != null)? p.getMae().getNome(): "" %></td>
                    <td><%= (p.getMae() != null && p.getAvóMaterna() != null)? p.getAvóMaterna().getNome(): "" %></td>
                    <td><%= (p.getMae() != null && p.getAvôMaterna() != null)? p.getAvôMaterna().getNome(): "" %></td>
                    
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
