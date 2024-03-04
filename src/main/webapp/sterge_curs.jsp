<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Cursuri</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                background-color: #f5f5f5;
            }
            #container {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            a {
                text-decoration: none;
                color: #0066cc;
                font-weight: bold;
                margin: 0 10px;
                display: inline-block;
                border: 2px solid #0066cc;
                border-radius: 5px;
                padding: 10px 20px;
                transition: background-color 0.3s, color 0.3s;
            }
            a:hover {
                background-color: #0066cc;
                color: #fff;
            }
        </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <div id="container">
            <%
                String[] s = request.getParameterValues("primarykey");
                jb.connect();
                jb.stergeDateTabela(s, "cursuri", "idcurs");
                jb.disconnect();
            %>
            <h1 align="center">Cursul a fost sters!</h1>
            <p>
                <a href="index.html">Home</a>
                <a href="tabela_cursuri.jsp">Cursuri</a>
            </p>
        </div>
    </body>
</html>
