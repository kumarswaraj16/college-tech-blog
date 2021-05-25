<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="grad">
	<%@include file="normal_navbar.jsp"%>

	<main class="d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card mt-2">
						<div class="card-header text-white grad text-center">
							<span class="fa fa-user-plus fa-2x"></span>
							<h3>Register Here!</h3>
						</div>
						<div class="card-body grad text-white">
							<form id="reg-form" action="RegisterServlet" method="post">
							    <div class="form-group">
									<label for="user_name">User Name</label> 
									<input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> 
									<input name="user_email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"> <small
										id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> 
									<input name="user_password" type="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="form-group">
									<label for="gender">Gender</label>
									&nbsp;&nbsp; 
									<input type="radio" id="gender" name="gender" value="Male">Male
									&nbsp;&nbsp;
									<input type="radio" id="gender" name="gender" value="Female">Female
								</div>
								<div class="form-group">
								     <textarea class="form-control" name="about" rows="2" cols="30" placeholder="Enter something about yourself..."></textarea>
								
								</div>
								
								
								<div class="form-group form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree terms and conditions</label>
								</div>
								<div class="container text-center" id="loader" style="display: none;">
								    <span class="fa fa-refresh fa-spin fa-4x"></span>
								    <h4>Please wait...</h4>
								</div>
								<button id="submit-btn" type="submit" class="btn text-white btn-outline-dark">Submit</button>
							</form>
						</div>
						<div class="p-2 card-footer grad text-white text-center">Happy
							to see you here, Happy Learning!</div>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script>
	     $(document).ready(function(){
	    	 console.log("Loaded.....");
	    	 
	    	 $('#reg-form').on('submit',function(event){
	    		 event.preventDefault();
	    		 let form = new FormData(this);
	    		 
	    		 $('#submit-btn').hide();
	    		 $('#loader').show();
	    		 
	    		 $.ajax({
	    			 url: "RegisterServlet",
	    			 type: 'POST',
	    			 data: form,
	    			 success: function(data,textStatus,jqXHR){
	    				 console.log(data);
	    				 $('#submit-btn').show();
	    				 $('#loader').hide();
	    				 if(data.trim()=='Success'){
		    				 swal("Registered Successfully, We are Redirecting you to Login Page!")
		    				 .then((value) => {
		    				   window.location = "login_page.jsp";
		    				 });
	    				 }else{
	    					 swal(data);
	    				 }
	    			 },
	    			 error: function(jqXHR, textStatus, errorThrown){
	    				 swal("Something went wrong, Please try again!");
	    				 $('#submit-btn').show();
	    				 $('#loader').hide();
	    			 },
	    			 processData: false,
	    			 contentType: false
	    		 });
	    	 });
	     });
	
	</script>

</body>
</html>