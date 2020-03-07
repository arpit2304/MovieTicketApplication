<!DOCTYPE html>
<html>

<head>
	<title>Add Customer</title>

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
		<h3>Add Customer</h3>
		
		<form action="CustomerController" method="GET">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table>
				<tbody>
				<tr>
						<td><label>UserName:</label></td>
						<td><input type="text" name="userName" required pattern="[A-Za-z]" /></td>
					</tr>
					<tr>
						<td><label>password:</label></td>
						<td><input type="password" name="password" required/></td>
					</tr>
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="firstName" required pattern="[A-Za-z]{1,}" /></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="lastName" required pattern="[A-Za-z]{1,}"/></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><input type="email" name="email" required /></td>
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











