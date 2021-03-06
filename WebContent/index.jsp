<%@page import="com.sun.jdi.Value"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tech Blog</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
   
   body{
      background: url("images/prog1.jpg");
      background-size: cover;
      background-attachment: fixed;
   }
  
</style>
</head>

<body>
	
	<%@include file="normal_navbar.jsp" %>
	
	<div class="container-fluid m-0 p-0">
	    <div class="jumbotron bg-dark grad text-white">
	        <div class="container">
	            <h1>Welcome to Programming Club</h1>
	            <h3>College of Technology and Engineering Udaipur</h3>
	            <p>Here, We will discuss everything related to Programming and Technology</p>
	            <% 
	                User use = (User)session.getAttribute("currentUser");
	                if(use == null){
	            %>
	            <a href="register_page.jsp" class="btn btn-md btn-outline-light m-1"><span class="fa fa-lightbulb-o"></span>&nbsp;Start Learning</a>
	            <a href="login_page.jsp" class="btn btn-md btn-outline-light m-1"><span class="fa fa-paper-plane-o"></span>&nbsp;Login</a>
	            <% }else{ %>
	                  <a href="profile.jsp" class="btn btn-md btn-outline-light m-1"><span class="fa fa-lightbulb-o"></span>&nbsp;All Posts</a>
	                  <a href="my_posts.jsp" class="btn btn-md btn-outline-light m-1"><span class="fa fa-paper-plane-o"></span>&nbsp;My Posts</a>
	            <% } %>
	            <a href="#" class="btn btn-md btn-outline-light m-1"><span class="fa fa-camera"></span>&nbsp;Gallery</a>
	        </div>
	    </div>
	</div>
	
	<!-- Recent Blogs -->
	
	<div class="container">
	    <div class="text-center">
	        <div class="mb-4 badge badge-dark grad"><h3 class="py-2 px-2">Trending Posts &nbsp; <img src="images/trending.png" style="width:40px;height:40px;"></h3></div>
	    </div>
	    <div class="row mb-sm-2">
	        <%
	           PostDao pd = new PostDao(ConnectionProvider.getConnection());
	           ArrayList<Post> pList = pd.getRecentPost();
	           int count=0;
	           
	           for(Post post:pList){
	        	   count++;
	        %>
	        <div class="col-md-4">
	              <div class="card h-100">
	                <% if(post.getpPic().length()>0){ %>
	                       <div class="embed-responsive embed-responsive-4by3">
                               <img id="post-img" class="card-img-top embed-responsive-item" src="blog_pics/<%= post.getpPic() %>" alt="Image is not there!">
                           </div>
	                  <% } %>
					<div class="card-body d-flex flex-column">
						<h5 class="card-title"><%= post.getpTitle() %></h5>
						<p class="card-text"><%= post.getpContent().substring(0, 20) %>...</p>
						<%
						    User u = (User)session.getAttribute("currentUser");
						    if(u==null){
						%> 
						       <a href="login_page.jsp" class="btn btn-block grad text-white align-self-end" style="margin-top: auto;">Read More</a>
						<%
						    }else {
						%>
						       <a href="show_blog_page.jsp?post_id=<%= post.getPid() %>" class="btn btn-block grad text-white align-self-end" style="margin-top: auto;">Read More</a>
						 <%} %>      
					</div>
				</div>
			</div>
	        
	        <%
	        if(count==3){
	        	
	        %>
	        </div>
	        <div class="row mb-sm-2">
	        <%
	        }
	           }
	        %>
			
	    </div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>	
	
	<script>
	
	    $(document).ready(function(){
	    	console.log("Ready to search!");
	    	$('#search-btn').on('click',function(event){
	    		event.preventDefault();
	    		var val = document.getElementById("searchbar").value;
	    		console.log(val);
	    		window.location = "searched_posts.jsp?lookup_posts="+val;
	    	});
	    });
	
	</script>

</body>
</html>