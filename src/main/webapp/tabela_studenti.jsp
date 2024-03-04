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
        input[type="checkbox"] {
            margin: 0;
        }
    </style>
    <script>
        function validateForm() {
            var checkboxes = document.getElementsByName("primarykey");
            var isChecked = false;

            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isChecked = true;
                    break;
                }
            }

            if (!isChecked) {
                alert("Selectați cel puțin o linie înainte de a șterge.");
                return false;
            }

            return true;
        }
    </script>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div id="container">
        <h1>Tabela Studenti</h1>
        <p>
            <a href="nou_student.jsp">Adaugă un nou student</a>
        </p>
        <form action="sterge_student.jsp" method="post" onsubmit="return validateForm();">
            <table>
                <tr>
                    <th>Mark</th>
                    <th>IdStudent</th>
                    <th>Nume</th>
                    <th>Prenume</th>
                    <th>CNP</th>
                    <th>AnStudiu</th>
                    <th>Facultate</th>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("studenti");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idstudent");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("Nume")%></td>
                    <td><%= rs.getString("Prenume")%></td>
                    <td><%= rs.getString("CNP")%></td>
                    <td><%= rs.getInt("Anstudiu")%></td>
                    <td><%= rs.getString("Facultate")%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <p>
                <input type="submit" value="Șterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <p>
            <a href="index.html">Home</a>
        </p>
    </div>
</body>
</html>
