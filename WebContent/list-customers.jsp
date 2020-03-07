<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>Dario Cinema</title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Dario Cinema</h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			
			
			<input type="button" value="Add Customer" 
				   onclick="window.location.href='add-customer-form.jsp'; return false;"
				   class="add-customer-button"
			/>
			
			<table>
			
				<tr>
					<th>UserName</th>
					<th>password</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="tempCustomer" items="${CUTOMER_LIST}">
					
			
					<c:url var="tempLink" value="CustomerController">
						<c:param name="command" value="LOAD" />
						<c:param name="CustomerId" value="${tempCustomer.userName}" />
					</c:url>

				
					<c:url var="deleteLink" value="CustomerController">
						<c:param name="command" value="DELETE" />
						<c:param name="CustomerId" value="${tempStudent.userName}" />
					</c:url>
																		
					<tr>
					<td> ${tempCustomer.userName} </td>
					<td> ${tempCustomer.password} </td>
						<td> ${tempCustomer.firstName} </td>
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.email} </td>
						<td> 
							<a href="${tempLink}">Update</a> 
							 | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this Customer?'))) return false">
							Delete</a>	
						</td>
					</tr>
				
				</c:forEach>
				
			</table>
		
		</div>
	
	</div>
</body>


</html>





