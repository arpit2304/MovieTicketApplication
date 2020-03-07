<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Tickets...</title>
</head>
<body>
	<%
		if (request.getParameter("name") != null) {
	%>
	<center>
		<h1 style="font-family:"pristina"; >Welcome to Dario Cinema!!!</h1>
	</center>
	<%=request.setAttribute("user", "yes")%>
	<%
		}
	%>
	<form action="timings.jsp" method="get">
		<table style="width: 100px; display: block;">
			<center>
				<tr>
					<td>
						<h1
							style="text-align: center; font-family: pristina; color: powderblue">Movies</h1>
					</td>
				</tr>
			</center>
			<tr>
				<td><img
					src="C:\Users\Arpit Soni\eclipse-workspace\Assignment2_MovieTicketApplicaiont\Images\ddlj.jpg"
					height="250" width="250" alt="DDLJ" /><br> <input
					type="radio" name="movie" value="DDLJ"/ >DDLJ</td>
				<td><img
					src="C:\Users\Arpit Soni\eclipse-workspace\Assignment2_MovieTicketApplicaiont\Images\phirherapheri.jpg"
					height="250" width="250" alt="Phir hera pheri" /> <br> <input
					type="radio" name="movie" value="Phir Hera Pheri" checked />Phir
					Hera Pheri</td>
				<td><img
					src="C:\Users\Arpit Soni\eclipse-workspace\Assignment2_MovieTicketApplicaiont\Images\dhol.jpg"
					height="250" width="250" alt="Dhol" /> <br> <input
					type="radio" name="movie" value="Dhol" />Dhol</td>
			</tr>
			<tr>
				<td><input type="submit" value="Show Timings" />
			</tr>
		</table>

	</form>
	<%
		if (request.getParameter("name") == null) {
	%>
	<a href="Login.html">Log In</a> &nbsp; &nbsp;
	<a href="Registration.html">Register Here to Get Offers!!!</a>
	</td>
	<%
		}
	%>
</body>
</html>