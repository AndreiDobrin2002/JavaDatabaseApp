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
        h1 {
            margin-bottom: 20px;
        }
        p, table {
            margin: 0;
            padding: 0;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 5px;
        }
        input[type="submit"], .button {
            text-decoration: none;
            color: #0066cc;
            font-weight: bold;
            display: inline-block;
            margin: 5px;
            border: 2px solid #0066cc;
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
        }
        input[type="submit"]:hover, .button:hover {
            background-color: #0066cc;
            color: #fff;
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div id="container">
        <h1>Tabela Cursuri</h1>
        <br/>
        <p align="center">
            <a href="nou_cursuri.jsp" class="button"><b>Adauga un nou curs</b></a>
        </p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("cursuri", "idcurs", aux);
            rs.first();
            String Denumire = rs.getString("Denumire");
            int AnRecomandat = rs.getInt("AnRecomandat");
            String FacultateRecomandata = rs.getString("FacultateRecomandata");
            String Domeniu = rs.getString("Domeniu");
            int Semestru = rs.getInt("Semestru");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_curs.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdCurs:</td>
                    <td> <input type="text" name="idcurs" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="Denumire" size="30" value="<%= Denumire%>"/></td>
                </tr>
                <tr>
                    <td align="right">AnRecomandat:</td>
                    <td> <input type="text" name="AnRecomandat" size="30" value="<%= AnRecomandat%>"/></td>
                </tr>
                <tr>
                    <td align="right">FacultateRecomandata:</td>
                    <td> <input type="text" name="FacultateRecomandata" size="30" value="<%= FacultateRecomandata%>"/></td>
                </tr>
                <tr>
                    <td align="right">Domeniu:</td>
                    <td> <input type="text" name="Domeniu" size="30" value="<%= Domeniu%>"/></td>
                </tr>
                <tr>
                    <td align="right">Semestru:</td>
                    <td> <input type="text" name="Semestru" size="30" value="<%= Semestru%>"/></td>
                </tr>
            </table>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html" class="button"><b>Home</b></a>
            <br/>
        </p>
    </div>
</body>
</html>
