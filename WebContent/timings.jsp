<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Times</title>
</head>
<body>
	<form action="ticketDetails.jsp" method="get">
		<center>
		<h1 style="fonr-family:pristina">
			<%=request.getParameter("movie")%>
			</h1>
		</center>
		<table>

			<tr>
				<th><label>Available Shows:</label></th>
				<th><select name="time">
						<option value="12:00 PM">12:00 PM</option>
						<option value="3:00 PM">3:00 PM</option>
						<option value="6:00 PM">6:00 PM</option>
						<option value="9:00 PM">9:00 PM</option>
				</select></th>
			</tr>
			<tr>
				<th><label>Day :</label></th>
				<th><select name="day">
						<option value="Friday">Friday</option>
						<option value="Saturday">Saturday</option>
						<option value="Sunday">Sunday</option>
						<option value="Monday">Monday</option>
						<option value="Tuesday">Tuesday</option>
						<option value="Wednesday">Wednesday</option>
						<option value="Thursday">Thursday</option>
				</select></th>
			</tr>
		</table>
		<input type="submit" />
	</form>
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
	<%=request.setAttribute("movie", request.getParameter("movie"))%>
</body>
</html>