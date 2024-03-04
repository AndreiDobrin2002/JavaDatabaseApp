<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Studenti</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #f5f5f5; /* culoare fundal */
        }
        #container {
            text-align: center;
            background-color: #fff; /* culoare fundal container */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* umbra */
        }
        h1 {
            margin-bottom: 20px;
        }
        p, table {
            margin: 0;
            padding: 0;
        }
        .button {
            text-decoration: none;
            color: #0066cc; /* culoare link si buton */
            font-weight: bold;
            display: inline-block;
            margin: 5px;
            border: 2px solid #0066cc; /* culoare chenar */
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
        }
        .button:hover {
            background-color: #0066cc; /* culoare de fundal la hover */
            color: #fff; /* culoare text la hover */
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div id="container">
        <h1 align="center">Tabela Studenti</h1>
        <br/>
        <p align="center">
            <a href="nou_student.jsp" class="button"><b>Adaugă un nou student</b></a>
        </p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idstudent"));
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String CNP = request.getParameter("CNP");
            String AnStudiu = request.getParameter("AnStudiu");
            String Facultate = request.getParameter("Facultate");

            String[] valori = {Nume, Prenume, CNP, AnStudiu, Facultate};
            String[] campuri = {"Nume", "Prenume", "CNP", "AnStudiu", "Facultate"};
            jb.modificaTabela("studenti", "idstudent", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificările au fost efectuate!</h1>
        <p align="center">
            <a href="index.html" class="button"><b>Home</b></a>
            <a href="modifica_student.jsp" class="button"><b>Modifică Studenti</b></a>
            <br/>
        </p>
    </div>
</body>
</html>
