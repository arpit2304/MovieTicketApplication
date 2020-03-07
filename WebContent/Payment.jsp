<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
</head>
<body>
	<h2>Information:</h2>
	Adult Ticket =
	<%=request.getParameter("adult")%>
	Child/Senior Tickets =
	<%=request.getParameter("child")%>
	Total Tickets =
	<%=request.getParameter("totalTicket")%>

	<%
		String promo;
		String day =
	%><%=request.getParameter("day")%>
	<%
		String user =
	%><%=request.getParameter("user")%>
	<%
		if (day.equals("Tuesday")) {
			promo += "Tuesday Offer!!!!($5 per Ticket Only!!! ";
		}
		if (user.equals("yes")) {
			promo += "\n Dario Cinema Member Discount!!! 20*OFF";
		}
		out.print(promo);
	%>

	Total Price =
	$ <%=request.getParameter("totalPrice")%>
	<br>
	<hr>
	<br>
	<form action="Tickets.jsp">
		<table>
			<tr>
				<td>Card Type:</td>
				<td><label> <input type="radio" name="payment"
						value="visa" />Visa<br> <input type="radio" name="payment"
						value="mastercard" />Master Card<br> <input type="radio"
						name="payment" value="discover" />Discover<br> <input
						type="radio" name="payment" value="Dario Cinema Gift Card" />Dario
						Cinema Gift Card<br>
				</label></td>
			</tr>
			<tr>
				<td>Card Number:</td>
				<td><input type="number" max="16" name="card" min="16" /></td>
			</tr>
			<tr>
				<td>Expiry Date:</td>
				<td><input type="date" /></td>
			</tr>
			<tr>
				<td>CVV:</td>
				<td><input type="number" max="3" min="3" /></td>
			</tr>
		</table>
		<input type="submit" value="purchase" />

		<%
			request.setAttribute("movie", request.getParameter("movie"));
			request.setAttribute("day", request.getParameter("day"));
			request.setAttribute("time", request.getParameter("time"));
			request.setAttribute("totalTicket", request.getParameter("totalTicket"));
			request.setAttribute("totalPrice", request.getParameter("totalPrice"));
			request.setAttribute("adult", request.getParameter("adult"));
			request.setAttribute("child", request.getParameter("child"));
			request.setAttribute("row", request.getParameter("row"));
			request.setAttribute("column", request.getParameter("column"));
		%>
	</form>
</body>
</html>