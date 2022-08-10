<%
User user1 = (User) session.getAttribute("current-user");
if (user1 == null) {
	session.setAttribute("message", "you are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
}
%>












<%@page import="mycart1.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-commerce</title>
<%@include file="components/common-css-js.jsp"%>

<link rel="stylesheet" href="css//style.css">

</head>
<body>
	<%@include file="components/Navbar.jsp"%>


	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">

				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your selected items</h3>

						<div class="cart-body"></div>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<!--Form details  -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your details for order</h3>
						<form>
							<div class="form-group">
								<label for="exampleInputEmail1">Your Email</label> <input
									type="email" class="form-control" id="email" value=<%= user1.getUserEmail() %>
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Your Name</label> <input
									value=<%= user1.getUserName() %> type="text" class="form-control" id="name"
									placeholder="Name">
							</div>
								<div class="form-group">
								<label for="exampleInputPassword1">Your Contact</label> <input
									value=<%= user1.getUserPhone() %> type="text" class="form-control" id="phone"
									placeholder="phone number">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Your Shipping address</label> <textarea
								value=<%= user1.getUserAddress() %>	rows="5" id="address" class="form-control"
									placeholder="Shipping address"></textarea>
							</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-success  ">Order Now</button>
							<button type="submit" class="btn btn-outline-primary ">Continue Shopping</button>
						</div>
						</form>

					</div>
				</div>



			</div>
		</div>
	</div>

</body>
</html>