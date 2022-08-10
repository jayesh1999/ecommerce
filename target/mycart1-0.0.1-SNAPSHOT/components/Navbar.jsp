<%@page import="mycart1.entity.User"%>
<%
User user =(User) session.getAttribute("current-user");



%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg text-white">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">MyCart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
      <% 
      
      if(user == null){
    	  %>
    	    <li class="nav-item active">
      <a class="nav-link" href="login.jsp" >Login</a>
      </li>
      </ul>
      
       <ul class="navbar-nav">
      <li class="nav-item active">
      <a class="nav-link" href="Register.jsp" >Register</a>
      </li>
    	   <%
      }
      else{
    	  
    	  %>
    	    <li class="nav-item active">
      <a class="nav-link" href="#!" ><%= user.getUserName() %></a>
      </li>
      </ul>
      
       <ul class="navbar-nav">
      <li class="nav-item active">
      <a class="nav-link" href="LogoutServlet" >Logout</a>
      </li>
    	  
    	  <%
      }
      
      
      %>
      
      
      
    
      </ul>
    </div>
  </div>
</nav>