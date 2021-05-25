<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="grad">

   <%@include file="normal_navbar.jsp" %>

	<main class="d-flex align-items-center mt-sm-5">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header text-white grad text-center">
						<span class="fa fa-user-circle fa-3x"></span>
							<h3>Login Here!</h3>
						</div>
						<%
						   Message m = (Message)session.getAttribute("msg");
						   if(m!=null){   
					    %>
					    <div class="alert <%= m.getCssClass() %> mb-0 text-center" role="alert">
					        <%= m.getContent() %>
					    </div>
					    <%
					           session.removeAttribute("msg");
						   }
						%>
						<div class="card-body grad text-white">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" required class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" required class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="text-center">
								    <button type="submit" class="btn text-white btn-outline-dark btn-lg">Submit</button>
								</div>
								
								<div class="text-center mt-4">
								    <a href="register_page.jsp">New user? Create New Account</a>
								</div>
							</form>

						</div>
						<div class="card-footer grad text-white text-center">
						      Happy to see you here again, Happy Learning!
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

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
</body>
</html>