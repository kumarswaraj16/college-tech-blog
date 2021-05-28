<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   User user = (User) session.getAttribute("currentUser");
   if(user == null){
	   response.sendRedirect("login_page.jsp");
   }
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searched Posts</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

<style>

    body{
       background: url("images/prog1.jpg");
       background-size: cover;
       background-attachment:fixed;
    }
    
    .sidebar{
       position: fixed;
       top:100px;
       width: 300px;
    }
    
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
	        <% if(user.getName().equals("Swaraj Kumar")){ %>
				<li class="nav-item">
	           <a class="nav-link text-white" href="profile.jsp"><span><img class="navimg" src="pics/<%= user.getProfile() %>"></span>&nbsp;<%= user.getName() %><img src="images/check.png" style="width:20px;height:20px;"></a>
	        </li>
			<% }else{ %>
				<li class="nav-item">
	           <a class="nav-link text-white" href="profile.jsp"><span><img class="navimg" src="pics/<%= user.getProfile() %>"></span>&nbsp;<%= user.getName() %></a>
	        </li> 
			<% } %>
      <% } %>
      <!-- <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li> -->
    </ul>
    <ul class="navbar-nav mr-right">
				<li class="nav-item">
				<a href="LogoutServlet" class="nav-link text-white"><span class="fa fa-power-off">&nbsp;&nbsp;</span>Logout</a>
				</li>
			</ul>
  </div>
</nav>
     <%
        String value = request.getParameter("lookup_posts");
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
        ArrayList<Post> posts = pd.searchedPosts(value);
     %>
     <div class="container">
         <div class="row">
				       <%
    
    if(posts.size()==0){
    	out.println("<div class='col-md-6 offset-4 mt-5'>");
    	out.println("<img src='images/nopost.jpeg' style='height: 300px;width:300px;'>");
    	out.println("<h3 class='mt-2 text-white'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You Can Post &nbsp;&nbsp;<i class='fa fa-trophy'></i> </h3>");
    	out.println("</div>");			
    	return;
    }
    
    for(Post p:posts){
%>
    <div class="col-md-4 mt-4">
          <div class="card h-100">
              <% 
                     if(p.getpPic().length() > 0){
                 %>
                     <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" style="height:200px;" alt="Image is not there!">
                 <%
                     }
                 %>
              <div class="card-body">
                 <b><%= p.getpTitle() %></b>
                 <br>
                 <p><%= p.getpContent().substring(0,20) %>...</p>
                 <% 
                     if(p.getpCode().length() > 0){
                 %>
                     <pre><%= p.getpCode() %></pre>
                 <%
                     }
                 %>
              </div>
              <div class="card-footer grad">
                  
                  <div class="float-left">
                     <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-sm btn-outline-dark text-white grad">Read More...</a>
                  </div>
				<div class="float-right">
				  <%
				     LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				  %>
					<button class="btn btn-sm btn-outline-dark text-white grad"><i
						class="fa fa-thumbs-o-up">&nbsp;<span><%= ld.countLikeOnPost(p.getPid()) %></span></i></button> 
						<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-sm btn-outline-dark text-white grad"><i
						class="fa fa-commenting-o">&nbsp;<span></span></i></a>
				</div>
                  
                 
			</div>
          </div>
    </div>

<% 	
    }
%>
				   
				   </div>
				
				</div>
</body>
</html>