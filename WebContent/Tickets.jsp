<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket</title>
</head>
<body>
	<h1 style="font-family: pristina;">Dario Cinema!!!</h1>
	<h2>Ticket</h2>
	<table>
		<tr>
			<td>Movie:</td>
			<td><%=request.getParameter("movie")%></td>
		</tr>

		<tr>
			<td>Show:</td>
			<td><%=request.getParameter("time")%></td>
		</tr>

		<tr>
			<td>Day:</td>
			<td><%=request.getParameter("day")%></td>
		</tr>

		<tr>
			<td>Total Ticket: <%=request.getParameter("totalTicket")%>
			</td>
			<td>Adult:<%=request.getParameter("adult")%><br>
				Child/Senior:<%=request.getParameter("child")%>
			</td>
		</tr>
		<tr>
			<td>Seat:</td>
			<td><%=request.getParameter("row")%>
				<%=request.getParameter("column")%>
			</td>
		</tr>
		<tr>
			<td>Payment Type:</td>
			<td>Successfull!!<br> <%
 	String card =
 %><%=request.getParameter("card")%> <%
 	String cardNum = "";
 	char x;
 	for (int i = 0; i < 16; i++) {
 		if (i < 12) {
 			x = 'x';
 		}
 		cardNum += x;
 	}
 	out.print(cardNum);
 %>
			</td>
		</tr>
		<tr>
			<td><img
				src="C:\Users\Arpit Soni\eclipse-workspace\Assignment2_MovieTicketApplicaiont\Images\barcode.png"
				height="250" width="250" alt="code" /></td>
		</tr>
	</table>
</body>
</html>