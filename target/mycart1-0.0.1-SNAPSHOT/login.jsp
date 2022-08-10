<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login - MyCart</title>
<%@include file="components/common-css-js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
			
				<div class="card mt-3">
				
					<div class="card-header custom-bg text-white">
						<h3>Login Here</h3>
					</div>
					<div class="card-body">
					<%@include file="message.jsp"%>
						<form action="LoginServlet" method="post">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1" name="email"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="password"
									placeholder="Password">
							</div>
							<a href="Register.jsp" class="text-center mb-2 d-block">If not registerd click here</a>
							<div class="container text-center">
							<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
							<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>