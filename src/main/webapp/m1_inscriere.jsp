<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*, java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Inscreri</title>
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
        <h1 align="center">Tabela Inscreri</h1>
        <br/>
        <p align="center">
            <a href="nou_inscriere.jsp" class="button"><b>Adauga o noua inscriere</b></a>
        </p>
        <%
            jb.connect();
            String NumeStudent, PrenumeStudent, CNP, Facultate, Denumire, FacultateRecomandata, Domeniu;
            Date DataInscriere;
            int AnStudiu, AnRecomandat, Semestru;
            
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceInscriereId(aux);
            rs.first();
            int id1 = rs.getInt("idstudent_inscriere");
            int id2 = rs.getInt("idcurs_inscriere");

            NumeStudent = rs.getString("Nume");
            PrenumeStudent = rs.getString("Prenume");
            CNP = rs.getString("CNP");
            AnStudiu = rs.getInt("AnStudiu");
            Facultate = rs.getString("Facultate");
            Denumire = rs.getString("Denumire");
            AnRecomandat = rs.getInt("AnRecomandat");
            FacultateRecomandata = rs.getString("FacultateRecomandata");
            Domeniu = rs.getString("Domeniu");
            Semestru = rs.getInt("Semestru");
            DataInscriere = rs.getDate("Data_inscriere");

            ResultSet rs1 = jb.vedeTabela("studenti");
            ResultSet rs2 = jb.vedeTabela("cursuri");
            int idstudent, idcurs;
        %>
        <form action="m2_inscriere.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdInscriere:</td>
                    <td> <input type="text" name="idinscriere" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Student:</td>
                    <td> 
                        <select name="idstudent">
                            <%
                                while(rs1.next()){
                                    idstudent = rs1.getInt("idstudent");
                                    NumeStudent = rs1.getString("Nume");
                                    PrenumeStudent = rs1.getString("Prenume");
                                    CNP = rs1.getString("CNP");
                                    AnStudiu = rs1.getInt("AnStudiu");
                                    Facultate = rs1.getString("Facultate");
                                    if (idstudent != id1) {
                            %>
                            <option value="<%= idstudent%>"><%= idstudent%>,<%= NumeStudent%>,<%= PrenumeStudent%>,<%= CNP%>,<%= AnStudiu%>,<%= Facultate%></option>
                            <%
                                    } else {
                            %>                
                            <option selected="yes" value="<%= idstudent%>"><%= idstudent%>,<%= NumeStudent%>,<%= PrenumeStudent%>,<%= CNP%>,<%= AnStudiu%>,<%= Facultate%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">Curs:</td>
                    <td> 
                        <select name="idcurs">
                            <%
                                while(rs2.next()){
                                    idcurs = rs2.getInt("idcurs");
                                    Denumire = rs2.getString("Denumire");
                                    AnRecomandat = rs2.getInt("AnRecomandat");
                                    FacultateRecomandata = rs2.getString("FacultateRecomandata");
                                    Domeniu = rs2.getString("Domeniu");
                                    Semestru = rs2.getInt("Semestru");
                                    if (idcurs != id2) {
                            %>
                            <option value="<%= idcurs%>"><%= idcurs%>,<%= Denumire%>,<%= AnRecomandat%>,<%= FacultateRecomandata%>,<%= Domeniu%>,<%= Semestru%></option>
                            <%
                                    } else {
                            %>                
                            <option selected="yes" value="<%= idcurs%>"><%= idcurs%>,<%= Denumire%>,<%= AnRecomandat%>,<%= FacultateRecomandata%>,<%= Domeniu%>,<%= Semestru%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">DataInscriere:</td>
                    <td> <input type="date" name="Data_inscriere" size="30" value="<%= DataInscriere%>"/></td>
                </tr>
            </table>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html" class="button"><b>Home</b></a>
        </p>
    </div>
</body>
<%
    rs.close();
    rs1.close();
    rs2.close();
    jb.disconnect();
%>
</html>
