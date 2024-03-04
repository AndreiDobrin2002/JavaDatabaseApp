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
            color: #0066cc; /* culoare link si buton */
            font-weight: bold;
            display: inline-block;
            margin: 5px;
            border: 2px solid #0066cc; /* culoare chenar */
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
        }
        input[type="submit"]:hover, .button:hover {
            background-color: #0066cc; /* culoare de fundal la hover */
            color: #fff; /* culoare text la hover */
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div id="container">
        <h1>Tabela Studenti</h1>
        <br/>
        <p align="center">
            <a href="nou_student.jsp" class="button"><b>Adaugă un nou student</b></a>
        </p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("studenti", "idstudent", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Prenume = rs.getString("Prenume");
            String CNP = rs.getString("CNP");
            int AnStudiu = rs.getInt("AnStudiu");
            String Facultate = rs.getString("Facultate");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_student.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdStudent:</td>
                    <td> <input type="text" name="idstudent" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">CNP:</td>
                    <td> <input type="text" name="CNP" size="30" value="<%= CNP%>"/></td>
                </tr>
                <tr>
                    <td align="right">AnStudiu:</td>
                    <td> <input type="text" name="AnStudiu" size="30" value="<%= AnStudiu%>"/></td>
                </tr>
                <tr>
                    <td align="right">Facultate:</td>
                    <td> <input type="text" name="Facultate" size="30" value="<%= Facultate%>"/></td>
                </tr>
            </table>
            <p>
                <input type="submit" value="Modifică linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html" class="button"><b>Home</b></a>
            <br/>
        </p>
    </div>
</body>
</html>
