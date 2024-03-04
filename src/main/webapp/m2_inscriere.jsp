<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*,  java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Inscriere</title>
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
            h1 {
                text-align: center;
                margin-top: 20px;
            }
            p, a {
                text-align: center;
                margin-top: 10px;
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
            <h1>Tabela Inscriere</h1>
            <br/>
            <p>
                <a href="nou_inscriere.jsp">Adauga o noua inscriere</a>
            </p>
            <%
                jb.connect();
                int aux = java.lang.Integer.parseInt(request.getParameter("idinscriere"));
                String idstudent = request.getParameter("idstudent");
                String idcurs = request.getParameter("idcurs");
                String DataInscriere = request.getParameter("Data_inscriere");
                String[] valori = {idstudent, idcurs, DataInscriere};
                String[] campuri = {"idstudent", "idcurs", "Data_inscriere"};
                jb.modificaTabela("inscrieri", "idinscriere", aux, campuri, valori);
                jb.disconnect();
            %>
            <h1>Modificarile au fost efectuate!</h1>
            <p>
                <a href="index.html">Home</a>
                <a href="modifica_inscriere.jsp">Modifică Inscriere</a>
            </p>
        </div>
    </body>
</html>
