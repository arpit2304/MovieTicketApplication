<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
</head>
<body>
	<%
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connCus = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root",
				"Sar_s234");
		Statement stmtCus = connCus.createStatement();
		String queryCus = "Select * from users where user_id = '" + user + "' && password = '" + pwd + "'";
		ResultSet rsCus = stmtCus.executeQuery(queryCus);

		java.sql.Connection connAdm = DriverManager.getConnection("jdbc:mysql://localhost:3306/admins", "root",
				"Sar_s234");
		Statement stmtAdm = connAdm.createStatement();
		String queryAdm = "Select * from users where user_id = '" + user + "' && password = '" + pwd + "'";
		ResultSet rsAdm = stmtAdm.executeQuery(queryAdm);
		out.println("</br></br>Results");
		String userId;
		String passwd;
		String fname;
		String lname;
		String emailCus;

		if (rsCus.next()) {
			String userName = rsCus.getString("user_id");
			String firstName = rsCus.getString("fname");
			String lastName = rsCus.getString("lname");
			String email = rsCus.getString("email");
			String password = rsCus.getString("password");
			userId=userName;
			passwd=password;
			fname=firstName;
			lname=lastName;
			emailCus=email;
			out.print("UserName= " + userName);
			out.print("FirstName= " + firstName);
			out.print("LastName=" + lastName);
			out.print("email= " + email);
			request.setAttribute("userName", userName);
			request.setAttribute("lastName", lastName);
			request.setAttribute("firstName", firstName);
			request.setAttribute("email", email);

			RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
			rd.forward(request, response);
		} else if (rsAdm.next()) {
			String userName = rsAdm.getString("user_id");
			String firstName = rsAdm.getString("fname");
			String lastName = rsAdm.getString("lname");
			String email = rsAdm.getString("email");
			String password = rsAdm.getString("password");
			out.print("UserName= " + userName);
			out.print("FirstName= " + firstName);
			out.print("LastName=" + lastName);
			out.print("email= " + email);
			request.setAttribute("userName", userName);
			request.setAttribute("lastName", lastName);
			request.setAttribute("firstName", firstName);
			request.setAttribute("password", password);
			request.setAttribute("email", email);
			RequestDispatcher rd = request.getRequestDispatcher("CustomerController.java");
			rd.forward(request, response);
		} else {
			out.print("Error Please Try Again!!!");
			RequestDispatcher rd = request.getRequestDispatcher("Login.html");
			rd.forward(request, response);
		}
	%>
	<br>
	<a href="homepage.jsp">Index</a>
</body>
</html>