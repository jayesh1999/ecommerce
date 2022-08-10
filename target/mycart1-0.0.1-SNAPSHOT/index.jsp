<%@page import="mycart1.helper.Helper"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="mycart1.entity.Category"%>
<%@page import="mycart1.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="mycart1.dao.ProductDto"%>
<%@page import="mycart1.helper.FactoryProvider"%>
<%@page import="mycart1.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart - Home</title>
<%@include file="components/common-css-js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>

	<div class="row">

		<%
		ProductDto productDao = new ProductDto(FactoryProvider.getFactory());
		List<Product> list = productDao.getAllProducts();

		CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> catagories = categoryDao.getCategories();

		//List<Product> productByCid   = productDao.getProductByCateogryId(1);

		//	out.println("productByCid"  + productByCid.size());
		%>
		<!-- show category -->




		<div class="col-md-2 ">
			<div class="container mt-3">
				<div class="list-group">
					<a href='#' class="list-group-item list-group-item-action active">
						All Products</a>
					<%
					for (Category c : catagories) {
					%>
					<a href='#' class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


					<%
					}
					%>
				</div>
			</div>
		</div>

		<div class="col-md-8">
			<!--show products  -->
			<div class="card-columns">
				<%
				for (Product p : list) {
				%>
				<div class="card">
				 <img class="card-img-top" src="images/products"+<%=p.getpPhoto() %> alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getpName()%></h5>
						<p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
					</div>
					<div class="card-footer">
						<button class="btn custom-bg text-white">Add to Cart</button>
						<button class="btn btn-outline-primary">&#8377;<%= p.getpPrice() %></button>

					</div>
				</div>
				<%
				}
				%>
			</div>

		</div>


		<!-- end of  product -->
	</div>
</body>
</html>