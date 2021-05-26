<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<style>
   
   .navimg{
      object-fit: cover;
      border-radius: 50%;
      width: 30px;
      height: 30px;
   
   }

</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand my-n-1" href="https://www.ctae.ac.in/"><span class="fa fa-bank">&nbsp;&nbsp;</span>CTAE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="fa fa-desktop">&nbsp;&nbsp;</span>Programming Club <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fas fa-database">&nbsp;&nbsp;</span>Categories
        </a> 
         <%
             User user = (User) session.getAttribute("currentUser");
		 %>
		  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <%
               if(user == null){
          %>  	   
            	   <a class="dropdown-item" href="login_page.jsp">Competitive Programming</a>
            	   <a class="dropdown-item" href="login_page.jsp">Data Structure & Algorithm</a>
                   <a class="dropdown-item" href="login_page.jsp">Machine Learning</a>
                   <a class="dropdown-item" href="login_page.jsp">App Development</a>
                   <a class="dropdown-item" href="login_page.jsp">Web Development</a>
                   <a class="dropdown-item" href="login_page.jsp">Project Implementation</a>
                   <div class="dropdown-divider"></div>
                   <a class="dropdown-item" href="login_page.jsp">College Information</a>
          <%         
               }else{
          %>  
                  <a class="dropdown-item" href="profile.jsp">Competitive Programming</a>
            	   <a class="dropdown-item" href="profile.jsp">Data Structure & Algorithm</a>
                   <a class="dropdown-item" href="profile.jsp">Machine Learning</a>
                   <a class="dropdown-item" href="profile.jsp">App Development</a>
                   <a class="dropdown-item" href="profile.jsp">Web Development</a>
                   <a class="dropdown-item" href="profile.jsp">Project Implementation</a>
                   <div class="dropdown-divider"></div>
                   <a class="dropdown-item" href="profile.jsp">College Information</a>	
          <%   
               }
          %>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="contact.jsp"><span class="fa fa-address-book">&nbsp;&nbsp;</span>Contact Us</a>
      </li>
      <%
         if(user==null){
      %>
      <li class="nav-item">
        <a class="nav-link text-white" href="login_page.jsp"><span class="fa fa-user-circle">&nbsp;&nbsp;</span>Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="register_page.jsp"><span class="fa fa-user-plus">&nbsp;&nbsp;</span>SignUp</a>
      </li>
      <% }else{ %>
	        <li class="nav-item">
	           <a class="nav-link text-white" href="profile.jsp"><span><img class="navimg" src="pics/<%= user.getProfile() %>"></span>&nbsp;My Profile</a>
	        </li>
      <% } %>
      <!-- <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li> -->
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

</body>
</html>