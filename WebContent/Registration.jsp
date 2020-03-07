<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.sql.*"%>
    <%@ page import ="javax.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registred</title>
</head>
<body>
<%
String user=request.getParameter("user");
String pwd=request.getParameter("pwd");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/customers","root","Sar_s234");
Statement stmt = conn.createStatement();
stmt.executeUpdate("insert into users values" + "('" + user + "','" + pwd + "','" + fname + "','" + lname
+ "','" + email + "')");
ResultSet rs = stmt.executeQuery("Select * from users where user_id = '" + user + "'");

if(rs.next()){
	out.println("welcome "+user);
	
}

%>
<br>
<a href ="Login.html" >LogIn</a><br><br>
<a href="Registration.html">Registration</a>
</body>
</html>