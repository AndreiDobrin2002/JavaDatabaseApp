<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga inscriere</title>
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
        <h1>Adauga inscriere</h1>
        <%
            int idstudent, idcurs, AnStudiu, AnRecomandat, Semestru;
            String id1, id2, NumeStudent, PrenumeStudent, CNP, Facultate, Denumire, FacultateRecomandata, Domeniu, DataInscriere;
            id1 = request.getParameter("idstudent");
            id2 = request.getParameter("idcurs");
            DataInscriere = request.getParameter("DataInscriere");
            if (id1 != null) {
                jb.connect();
                jb.adaugaInscriere(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), DataInscriere);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("studenti");
        ResultSet rs2 = jb.vedeTabela("cursuri");
        %>
        <form action="nou_inscriere.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdStudent:</td>
                    <td> 
                        Selectati Studentul:
                        <SELECT NAME="idstudent">
                            <%
                                while(rs1.next()){
                                    idstudent = rs1.getInt("idstudent");
                                    NumeStudent = rs1.getString("Nume");
                                    PrenumeStudent = rs1.getString("Prenume");
                                    CNP = rs1.getString("CNP");
                                    AnStudiu = rs1.getInt("AnStudiu");
                                    Facultate = rs1.getString("Facultate");
                            %>
                                <OPTION VALUE="<%= idstudent%>"><%= idstudent%>,<%= NumeStudent%>,<%= PrenumeStudent%>,<%= CNP%>,<%= AnStudiu%>,<%= Facultate%></OPTION>
                            <%
                                }
                            %>
                        </SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdCurs:</td>
                    <td> 
                        Selectati Cursul:
                        <SELECT NAME="idcurs">
                            <!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                            <%
                                while(rs2.next()){
                                    idcurs = rs2.getInt("idcurs");
                                    Denumire = rs2.getString("Denumire");
                                    AnRecomandat = rs2.getInt("AnRecomandat");
                                    FacultateRecomandata = rs2.getString("FacultateRecomandata");
                                    Domeniu = rs2.getString("Domeniu");
                                    Semestru = rs2.getInt("Semestru");
                            %>
                                <OPTION VALUE="<%= idcurs%>"><%= idcurs%>,<%= Denumire%>,<%= AnRecomandat%>,<%= FacultateRecomandata%>,<%= Domeniu%>,<%= Semestru%></OPTION>
                            <%
                                }
                            %>
                        </SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Data inscriere:</td>
                    <td> <input type="date" name="DataInscriere" size="30"/></td>
                </tr>
            </table>
            <input type="submit" value="Adauga inscrierea" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html">Home</a>
        <a href="tabela_inscriere.jsp">Inscrieri</a>
    </div>
</body>
</html>
