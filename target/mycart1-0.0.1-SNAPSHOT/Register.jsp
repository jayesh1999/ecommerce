<%@page import="mycart1.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User - MyCart</title>
<%@include file="components/common-css-js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	<div class="card">

		<div class="card-body px-5">
			
			<div class="row mt-5 ">
				<div class="col-md-4 offset-md-4 border ">
					<%@include file="message.jsp"%>
					<div class="text-center mt-3">
						<img src="images/register.png" style="height: 200px;"Responsiveimage">
					</div>

					<h3 class="text-center my-3 ">Sign up here!!</h3>
					<form action="RegisterServlet" method="POST">

						<div class="form-group">
							<label for="name" class="form-label">User Name</label> <input
								type="text" class="form-control" id="name" name="user_name"
								placeholder="Enter Here" aria-describedby="emailHelp">
						</div>


						<div class="form-group mt-2">
							<label for="email" class="form-label">User Email</label> <input
								type="email" class="form-control" id="email" name="user_email"
								placeholder="Enter Here" aria-describedby="emailHelp">
						</div>

						<div class="form-group mt-2">
							<label for="password" class="form-label">User Password</label> <input
								type="password" class="form-control" id="password"
								name="user_password" placeholder="Enter Here"
								aria-describedby="emailHelp">
						</div>

						<div class="form-group mt-2">
							<label for="phone" class="form-label">User Phone</label> <input
								type="number" class="form-control" id="phone" name="user_phone"
								placeholder="Enter Here" aria-describedby="emailHelp">
						</div>

						<div class="form-group mt-2">
							<label for="address" class="form-label">User Address</label>
							<textarea style="height: 200px;" class="form-control"
								name="user_address" id="address"
								placeholder="Enter Address Here"></textarea>
						</div>

						<div class="container mt-2 text-center mb-10">
							<button class="btn btn-outline-success">Register</button>
							<button class="btn btn-outline-warning">Reset</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>