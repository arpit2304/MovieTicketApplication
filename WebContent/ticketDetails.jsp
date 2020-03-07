<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quantity</title>
</head>
<body>
	<center>
		<h1 style="fonr-family: pristina"><%=request.getParameter("movie")%>
		</h1>
	</center>
	<form action="Price.java" method="get">
		<table>
			<tr>
				<td><label>Adult Tickets:</label>
				</th>
				<td><input type="number" name="aTicket" min="1" max="20"
					required></td>
			</tr>
			<tr>
				<td><label>Child/Senior Tickets Tickets:</label>
				</th>
				<td><input type="number" name="csTicket" min="0" max="20"
					required></td>
			</tr>
			<%
				if (request.getParameter("user") == "yes") {
			%>
			<%=request.setAttribute("user", "yes")%>
			<%
				} else {
			%>
			<%=request.setAttribute("user", "no")%>
			<%
				}
			%>
			<%=request.setAttribute("day", request.getParameter("day"))%>
			<%=request.setAttribute("time", request.getParameter("time"))%>
			<%=request.setAttribute("movie", request.getParameter("movie"))%>

			<input type="submit" value="Purchase" />
		</table>
	</form>
</body>
</html>