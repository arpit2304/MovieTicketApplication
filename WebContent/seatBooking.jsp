<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SeatBooking</title>
</head>
<body>
	<form action="Payment.jsp" method="get">
		<table>
			<tr>
				<td>Available Seats:<Br> (Number = availavle, x = Booked)
				</td>
				<td><%=request.getParameter("seat")%>
			</tr>
			<tr>
				<td>Enter the starting point =</td>
				<td>Row:<input type="number" name="row" max="9" min="0" /><br>
					Column:<input type="number" name="column" max="9" min="0" />
			</tr>
			<%
				request.setAttribute("movie", request.getParameter("movie"));
				request.setAttribute("day", request.getParameter("day"));
				request.setAttribute("time", request.getParameter("time"));
				request.setAttribute("totalTicket", request.getParameter("totalTicket"));
				request.setAttribute("totalPrice", request.getParameter("totalPrice"));
				request.setAttribute("adult", request.getParameter("adult"));
				request.setAttribute("child", request.getParameter("child"));
			%>
			<input type="submit" />
		</table>
	</form>
</body>
</html>