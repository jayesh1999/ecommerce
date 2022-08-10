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

<div class="container-fluid">
	<div class="row">

		<%
		
		String cat = request.getParameter("category");
		//out.println(cat);
		
		
		
		
		ProductDto productDao = new ProductDto(FactoryProvider.getFactory());
		List<Product> list = null;
		
		if(cat == null){
		list = productDao.getAllProducts();	
		}
		else if(cat.trim().equals("all")){
			list  =productDao.getAllProducts();
		}
		else{
			
			int cid = Integer.parseInt(cat.trim());
			list =  productDao.getProductByCateogryId(cid);
		}
		

		CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> catagories = categoryDao.getCategories();

		//List<Product> productByCid   = productDao.getProductByCateogryId(1);

		//	out.println("productByCid"  + productByCid.size());
		%>
		<!-- show category -->




		<div class="col-md-2 ">
			<div class="container mt-3">
				<div class="list-group">
					<a href='index.jsp?category=all' class="list-group-item list-group-item-action active">
						All Products</a>
					<%
					for (Category c : catagories) {
					%>
					<a href='index.jsp?category=<%=c.getCategoryId() %>' class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


					<%
					}
					%>
				</div>
			</div>
		</div>

		<div class="col-md-10">
			<!--show products  -->
			
			<div class="card-columns mt-3">
				<%
				for (Product p : list) {
				%>
				<div class="card product-card">
				<div class="container text-center">
				 <img class="card-img-top" src="images/products/<%=p.getpPhoto()%>" style="max-height:200px;max-width:100%;width:auto;" alt="Card image cap">
				</div>
					<div class="card-body">
						<h5 class="card-title"><%=p.getpName()%></h5>
						<p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
					</div>
					<div class="card-footer text-center">
						<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>, '<%= p.getpName()%>', <%=p.getpPrice()%>)">Add to Cart</button>
						<button class="btn btn-outline-success">&#8377;<%= p.getPriceAfterApplyingDiscount() %>/-  <span class="text-secondary discount-label"> &#8377 <%= p.getpPrice() %> , <%= p.getpDiscount() %>% off </span></button>

					</div>
				</div>
				<%
				}
				
				if(list.size() == 0){
					out.print("<h3>No item in this category</h3>");
				}
				%>
			</div>

		</div>


		<!-- end of  product -->
	<!-- 	<script>

		const add_to_cart = () => {
			console.log("pid, pname, price");
			
		}
		</script> -->
		
	</div>
	</div>
	
	<%@include file="components/common-modal.jsp"%>
</body>
</html>