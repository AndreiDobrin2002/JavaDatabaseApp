<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga Curs</title>
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
        <h1>Adauga Curs</h1>
        <%
            String Denumire = request.getParameter("Denumire");
            String AnRecomandatStr = request.getParameter("AnRecomandat");
            int AnRecomandat = 0; // sau o valoare implicită corespunzătoare
            if (AnRecomandatStr != null && !AnRecomandatStr.isEmpty()) {
                try {
                    AnRecomandat = Integer.parseInt(AnRecomandatStr);
                } catch (NumberFormatException e) {
                    // Tratează cazul în care conversia nu este posibilă
                }
            }

            String FacultateRecomandata = request.getParameter("FacultateRecomandata");
            String Domeniu = request.getParameter("Domeniu");
            String SemestruStr = request.getParameter("Semestru");
            int Semestru = 0; // sau o valoare implicită corespunzătoare
            if (SemestruStr != null && !SemestruStr.isEmpty()) {
                try {
                    Semestru = Integer.parseInt(SemestruStr);
                } catch (NumberFormatException e) {
                    // Tratează cazul în care conversia nu este posibilă
                }
            }

            if (Denumire != null) {
                jb.connect();
                jb.adaugaCurs(Denumire, AnRecomandat, FacultateRecomandata, Domeniu, Semestru);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate</p><%
        } else {
        %>
        <form action="nou_cursuri.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="Denumire" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">AnRecomandat:</td>
                    <td> <input type="text" name="AnRecomandat" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">FacultateRecomandata:</td>
                    <td> <input type="text" name="FacultateRecomandata" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Domeniu:</td>
                    <td> <input type="text" name="Domeniu" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Semestru:</td>
                    <td> <input type="text" name="Semestru" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga cursul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html">Home</a>
        <a href="tabela_cursuri.jsp">Cursuri</a>
    </div>
</body>
</html>
