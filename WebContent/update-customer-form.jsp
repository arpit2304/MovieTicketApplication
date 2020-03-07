<!DOCTYPE html>
<html>

<head>
	<title>Update Customer</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-student-style.css">	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Dario Cinema</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Update Customer</h3>
		
		<form action="CustomerController" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="customerId" value="${THE_CUSTOMER.userName}" />
			
			<table>
				<tbody>
				<tr>
						<td><label>First name:</label></td>
						<td><lable>${THE_CUSTOMER.userName}</lable></td>
					</tr>
				<tr>
						<td><label>First name:</label></td>
						<td><lable>${THE_CUSTOMER.password}</lable></td>
					</tr>
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="firstName" 
								   value="${THE_CUSTOMER.firstName}" required pattern="[A-Za-z]{1,}"/></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="lastName" 
								   value="${THE_CUSTOMER.lastName}"required pattern="[A-Za-z]{1,}" /></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><input type="email" name="email" 
								   value="${THE_CUSTOMER.email}" required /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="CustomerController">Back to List</a>
		</p>
	</div>
</body>

</html>











