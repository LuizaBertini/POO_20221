<%-- 
    Document   : index
    Created on : 21 de mar. de 2022, 13:49:14
    Author     : Fatec
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Java EE</h1>
        <h2>Java Server Pages</h2>
        <h3>Inicio</h3>
        <hr/>
        <h4><a href="datahora.jsp">Data/Hora do servidor</a></h4>
        <hr/>
        <h4>Somar dois valores</h4>
        <form action="soma.jsp">
            Número 1: <input type="text" name="n1" value="0"/><br/><br/>
            Número 2: <input type="text" name="n2" value="0"><br/><br/>
            <input type="submit" value="Somar" name="somar"/>
        </form>
        <hr/>
        <h4>Números Aleatórios</h4>
        <form action="aleatorios.jsp">
            Qntd de números: <input type="number" name="n" value="0"/><br/><br/>
            <input type="submit" value="Gerar" name="gerar"/>
        </form>
        <hr/>
        <h4>Tabuada</h4>
        <form action="tabuada.jsp">
            Número: <input type="number" name="n" value="0"/><br/><br/>
            <input type="submit" value="Calcular" name="tabuada"/>
        </form>
        <hr/>
    </body>
</html>
