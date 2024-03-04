<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga Student</title>
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
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 5px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #0066cc;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a, input[type="submit"] {
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
        a:hover, input[type="submit"]:hover {
            background-color: #0066cc; /* culoare de fundal la hover */
            color: #fff; /* culoare text la hover */
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div id="container">
        <h1>Adauga Student</h1>
        <%
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String CNP = request.getParameter("CNP");
            String AnStudiuStr = request.getParameter("AnStudiu");
            int AnStudiu = 0; // sau o valoare implicită corespunzătoare
            if (AnStudiuStr != null && !AnStudiuStr.isEmpty()) {
                try {
                    AnStudiu = Integer.parseInt(AnStudiuStr);
                } catch (NumberFormatException e) {
                    // Tratează cazul în care conversia nu este posibilă
                }
            }

            String Facultate = request.getParameter("Facultate");
            if (Nume != null) {
                jb.connect();
                jb.adaugaStudenti(Nume, Prenume, CNP, AnStudiu, Facultate);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate</p><%
        } else {
        %>
        <form action="nou_student.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Student:</td>
                    <td> <input type="text" name="Nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume Student:</td>
                    <td> <input type="text" name="Prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">CNP:</td>
                    <td> <input type="text" name="CNP" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">AnStudiu:</td>
                    <td> <input type="text" name="AnStudiu" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Facultate:</td>
                    <td> <input type="text" name="Facultate" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga studentul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html">Home</a>
        <a href="tabela_studenti.jsp">Studenti</a>
    </div>
</body>
</html>
