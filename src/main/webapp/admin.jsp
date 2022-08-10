<%@page import="java.util.Map"%>
<%@page import="mycart1.helper.Helper"%>
<%@page import="mycart1.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="mycart1.helper.FactoryProvider"%>
<%@page import="mycart1.dao.CategoryDao"%>
<%@page import="mycart1.entity.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
if (user1 == null) {
	session.setAttribute("message", "you are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user1.getUserType().equals("normal")) {
		session.setAttribute("message", "you are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

	<%
						
						CategoryDao categoryDao =  new CategoryDao(FactoryProvider.getFactory());
						List<Category> list  = categoryDao.getCategories();
						
						
						//get count
						
						Map<String,Long> m  = Helper.getCounts(FactoryProvider.getFactory());	
						
						%>
						

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Pannel</title>
<%@include file="components/common-css-js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	<div class="container admin">

		<div class="container-fluid">
			<%@include file="message.jsp"%>
		</div>
		<div class="row mt-3">

			<!-- first box -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" src="images/social.png"
								style="max-width: 125px;" alt="user-icon" />
						</div>

						<h1><%= m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>

			<!-- second box -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" src="images/list.png"
								style="max-width: 125px;" alt="category-icon" />
						</div>
						<h1><%= list.size() %></h1>
						<h1 class="text-uppercase text-muted">Cartegories</h1>
					</div>
				</div>
			</div>

			<!-- third box -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" src="images/product.png"
								style="max-width: 125px;" alt="product-icon" />
						</div>
						<h1><%= m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>

		</div>

		<div class="row mt-3">

			<!-- first box -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" src="images/keys.png"
								style="max-width: 125px;" alt="addcategory-icon" />
						</div>
						<p class="mt-2">Click here to add new category</p>
						
						<h1 class="text-uppercase text-muted">Add Cartegory</h1>
					</div>
				</div>
			</div>

			<!-- second box -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" src="images/plus.png"
								style="max-width: 125px;" alt="product-icon" />
						</div>
						<p class="mt-2">Click here to add new product</p>
					
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>


		</div>

	</div>



	<!-- Add category modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServelt" method="post">

						<input type="hidden" name="operation" value="addCategory">


						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />
						</div>

						<div class="form-group">
							<textarea class="form-control" style="height: 300px;"
								name="catDesc" placeholder="Enter category description" required></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success ">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

	<!--Add product modal  -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<!-- Start form -->
					<form action="ProductOperationServelt" method="post" enctype="multipart/form-data">
						
						<input type="hidden" name="operation" value="addProduct">
						

						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter Product title" required />
						</div>

						<div class="form-group">
							<textarea  class="form-control"  style="height:300px;" name="pDesc"
								placeholder="Enter product description" required ></textarea>
						</div>
						
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Product price" required />
						</div>
						
						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter Product discount" required />
						</div>
						
						
						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter Product Quantity" required />
						</div>
						
						<!--catagory dropdown  -->
						
					
						
						<div class="form-group">
							<select name="catId" class="form-control">
							
							<% 
							
							for(Category c : list){
							%>
							<option value="<%=c.getCategoryId() %>"> <%=c.getCategoryTitle() %>
							</option>
							<%} %>
							</select>
						</div>
						
						<!--Product file  -->
							<div class="form-group">
							<label for="pPic">Select Picture of product</label><br>
							<input type="file" class="form-control" id="pPic" name="pPic"
								 required />
						</div>
						
						<div class="container text-center">
						<button class="btn btn-outline-success ">Add Product</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>

					</form>
					<!--end form  -->
				</div>
				
			</div>
		</div>
	</div>

<%@include file="components/common-css-js.jsp"%>
	<%@include file="components/common-modal.jsp"%>
</body>
</html>