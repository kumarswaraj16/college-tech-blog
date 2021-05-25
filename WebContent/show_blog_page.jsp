
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%

User user = (User)session.getAttribute("currentUser");

if(user==null){
	response.sendRedirect("login_page.jsp");
}

%>

<%

  int post_id = Integer.parseInt(request.getParameter("post_id"));

  PostDao postDao = new PostDao(ConnectionProvider.getConnection());
  
  Post post = postDao.getPostByPostId(post_id);
  
  

%>







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Posts</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

<style>

    .post-title{
         font-weight:bold;
         font-size: 30px;
    }
    
    .post-content{
         font-weight: 400;
         font-size: 25px;
    }
    
    .post-date{
         font-style: italic;
         font-weight: bold;
    }
    
    .post-user-info{
         font-weight: bold;
         font-size: 20px;
    }
    
    .author{
         font-weight: 100;
         color: black;
         font-style: italic;
    }
    
    body{
       background: url("images/prog1.jpg");
       background-size: cover;
       background-attachment: fixed;
    }
    
    #post-img{
       height: 300px;
    }

</style>

</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#"><span class="fa fa-bank">&nbsp;&nbsp;</span>CTAE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-desktop">&nbsp;&nbsp;</span>Programming
						Club <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link text-white" href="#"><span
						class="fa fa-address-book">&nbsp;&nbsp;</span>Contact Us</a></li>
				<li class="nav-item">
        <a class="nav-link text-white" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-paint-brush">&nbsp;&nbsp;</span>Write Blog</a>
      </li>		
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link text-white"
					href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle">&nbsp;&nbsp;</span><%= user.getName() %></a>
				</li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item">
				<a href="LogoutServlet" class="nav-link text-white"><span class="fa fa-user-plus">&nbsp;&nbsp;</span>Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	
	<!-- End of Navbar -->
	
	<!-- Main Content of body -->
	
	<div class="container">
	    <div class="row my-4">
	        <div class="col-md-8 offset-2">
	           <div class="card h">
	              <div class="card-header grad text-white text-center">
	                  <h4 class="post-title mt-2"><%= post.getpTitle() %></h4>
	              </div>
	              
	              <div class="card-body">
	                  
	                  <img id="post-img" class="card-img-top" src="blog_pics/<%= post.getpPic() %>" alt="Image is not there!">
	              
	                  <div class="my-2">
	                       <div class="float-left">
	                       <%
	                            UserDao ud = new UserDao(ConnectionProvider.getConnection());
	                            User u = ud.getUserByUserId(post.getUserId());
	                       
	                       %>
	                            <p class="post-user-info"><a class="text-decoration-none" href="#!"><span class="author">author:</span><%= u.getName() %></a></p>
	                       </div>
	                       
	                       <div class="float-right">
	                            <p class="post-date"><%= DateFormat.getDateTimeInstance().format(post.getpDate()) %></p>
	                       </div>
	                  </div>
	                  <br><br>
	                  <div>
	                     <p class="post-content"><%= post.getpContent() %></p>
	                  </div>
	                  
	                  <br>
	                  
	                  <div class="post-code">
	                     <pre><%= post.getpCode() %></pre>
	                  </div>
	                 
	              </div>

					<div class="card-footer grad">
						<div class="float-right">
						<%
						
						LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
						
						%>
							<button onclick="doLike(<%= post_id %>,<%= user.getId() %>)" class="mx-4 btn btn-sm btn-outline-dark text-white grad"><i
								class="like-btn fa fa-thumbs-o-up">&nbsp;<span class="like-counter"><%= ldao.countLikeOnPost(post_id) %></span></i></button>
							<button class="btn btn-sm btn-outline-dark text-white grad">
							<i class="fa fa-commenting-o">&nbsp;<span>5</span></i></button>
						</div>
					</div>
					
					<!-- start of designing comment section -->
					<!-- <div class="card-footer bg-white">
					
					
					
					</div> -->
				</div>
	        </div>
	    </div>
	</div>
	
	<!-- End of Main Content of Body -->
	
	<!-- Profile Modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header grad text-white">
					<h5 class="modal-title" id="exampleModalLabel">Programming Club, CTAE</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				     <div class="text-center">
				         <img id="propic" src="pics/<%= user.getProfile() %>" class="img-fluid rounded-circle" style="border-radius:2rem;max-width:200px;max-height:100px;">
				         <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>

						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">About:</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Joined On:</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<!-- Edit Profile -->
						
						<div id="profile-edit" style="display:none;">
						     <h3 class="mt-2">Please Edit Carefully!</h3>
						     <form action="EditServlet" method="post" enctype="multipart/form-data">
						     
						            <table class="table">
						                <tr>
						                     <td class="align-middle">ID:</td>
						                     <td><%=user.getId()%></td>
						                </tr>
						                <tr>
						                     <td class="align-middle">Name:</td>
						                     <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
						                </tr>
						                 <tr>
						                     <td class="align-middle">Email:</td>
						                     <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
						                </tr>
						                <tr>
						                     <td class="align-middle">Password:</td>
						                     <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
						                </tr>
						                <tr>
						                     <td class="align-middle">About:</td>
						                     <td>
						                         <textarea class="form-control" rows="2" cols="20" name="user_about"><%= user.getAbout() %></textarea>
						                     </td>
						                </tr>
						                <tr>
						                     <td class="text-nowrap align-middle">New Profile Pic:</td>
						                     <td><input type="file" class="form-control" name="new_profile_pic"></td>
						                </tr>
						            </table>
						            
						            <div class="container">
						                <button type="submit" class="btn text-white grad">Save Changes</button>
						            </div>
						     
						     </form>
						</div>
						
					</div>
				</div>
				<div class="modal-footer grad">
					<button type="button" class="btn btn-outline-dark text-white"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-outline-dark text-white">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End of Profile Modal -->
	
	
	<!-- Start Post Modal -->

	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header grad text-white">
					<h5 class="modal-title" id="exampleModalLabel">Write Blog!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
				
				       <div class="form-group">
				            <select class="form-control" name="cid">
				              <option selected disabled>---Select Category---</option>
				              <%
				                 PostDao pd = new PostDao(ConnectionProvider.getConnection());
				                 ArrayList<Category> list = pd.getAllCategories();
				                 
				                 for(Category c:list){
				              %> 
				              
				              <option value="<%= c.getCid() %>"><%= c.getName() %></option>
				              
				              <% 	 
				                 }
				              %>
				            </select>
				       </div>
				
				       <div class="form-group">
				           <input type="text" class="form-control" placeholder="Enter Title" name="post_title">
				       </div>
				       <div class="form-group">
				           <textarea class="form-control" rows="6" cols="10" placeholder="Start Writing..." name="post_content"></textarea>
				       </div>
				       <div class="form-group">
				           <textarea class="form-control" rows="4" cols="10" placeholder="Write Code (if any)" name="post_code"></textarea>
				       </div>
				       <div class="form-group">
				           <label>Select Photo: &nbsp;</label> 
				           <input type="file" name="post_pic">
				       </div>
				       <div class="container text-center">
				           <button id="post-btn" type="submit" class="btn btn-outline-dark grad text-white">Post</button>
				       </div>
				</form>
				
				</div>
			</div>
		</div>
	</div>

	<!-- End Post Modal -->
	
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script>
	
	     $(document).ready(function(){
	    	 let editStatus = false;
	    	 $('#edit-profile-btn').click(function(){
	    		 /* alert("btn clicked"); */
	    		 if(editStatus==false){
	    			 $('#profile-details').hide();
		    		 $('#profile-edit').show();
		    		 editStatus = true;
		    		 $(this).text("Back");
	    		 }else{
	    			 $('#profile-details').show();
		    		 $('#profile-edit').hide();
		    		 editStatus = false;
		    		 $(this).text("Edit");
	    		 }
	    	 });
	    	 
	     });   
	
	</script>
	
	<!-- Add post logic -->
	
	<script>
	      
	      $(document).ready(function(){
	    	  console.log("You have clicked on Submit!");
	    	 $('#add-post-form').on('submit',function(event){
	    		 event.preventDefault();
	    		 
	    		 let form = new FormData(this);
	    		 
	    		 $.ajax({
	    			 url: "AddPostServlet",
	    			 type: 'POST',
	    			 data: form,
	    			 success: function(data, textStatus, jqXHR){
	    				 console.log(data);
	    				 if(data.trim()=='Done'){
	    					 swal("Good job!", "You Posted Successfully!", "success", {
	    						  button: "Aww yiss!",
	    					 });
	    				 }else{
	    					 swal("Error!", "Something went wrong, try again..", "error", {
	    						  button: "Ohh Noo!",
	    					 });
	    				 }
	    			 },
	    			 error: function(jqXHR, textStatus, errorThrown){
	    				 swal("Error!", "Something went wrong, try again..", "error", {
   						      button: "Ohh Noo!",
   					     });
	    			 },
	    			 processData: false,
	    			 contentType: false
	    		 });
	    	 });
	      });
	
	
	</script>
	
</body>
</html>