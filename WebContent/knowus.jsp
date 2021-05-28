<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

   body{
      background: url("images/prog1.jpg");
      background-size: cover;
      background-attachment: fixed;
   }
   
   .centerdiv{
      display: flex;
      justify-content: center;
      align-items: center;
   }
   
   .centerdiv a{
      height: 50px;
      width: 50px;
      background-color: #f5f6fa;
      border-radius: 50px;
      text-align: center;
      margin: 10px;
      line-height: 65px;
      box-shadow: 1px 3px 1px 1px #dcdde1;
   }
   
   .centerdiv a i{
     transition: all 0.3s linear;
   }
   
   .centerdiv a:hover i{
     transform: scale(1.2);
   }
   
   .fa-instagram{
     color: #e84393; 
   } 
   
   .fa-linkedin{
     color: #0097e6;
   }
   
   .fa-github{
     color: black;
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
        <a class="nav-link text-white" href="knowus.jsp"><span class="fa fa-address-book">&nbsp;&nbsp;</span>Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="login_page.jsp"><span class="fa fa-user-circle">&nbsp;&nbsp;</span>Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="register_page.jsp"><span class="fa fa-user-plus">&nbsp;&nbsp;</span>SignUp</a>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li> -->
    </ul>
		</div>
</nav>
      <div class="container">
      <div class="card text-center mt-2 text-white grad">
            <h1>Programming Club Coordinators</h1>
      </div>
          <div class="row">
              <div class="col-md-4 offset-2">
                   <div class="card mt-4 grad text-white">
                        <div class="card-header text-center">
                             <h3>Overall Coordinator</h3>
                        </div>
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/member.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Dr. Naveen Choudhary</h3>
                             <h4 class="card-subtitle text-wrap mb-2 text-muted">Head Of Department</h4>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                        </div>
                        <div class="card-footer">
                            <h4 class="text-nowrap">Contact: userctae@gmail.com</h4>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">
                        <div class="card-header text-center">
                             <h3>Overall Sub-Coordinator</h3>
                        </div>
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/member.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Miss. Diksha Goyal</h3>
                             <h4 class="card-subtitle text-wrap mb-2 text-muted">Assistant Professor</h4>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                        </div>
                        <div class="card-footer">
                            <h4 class="text-nowrap">Contact: userctae@gmail.com</h4>
                        </div>
                   </div>
              </div>
              <div class="p-2 col-sm-12 text-center card grad mt-4">
                   <h2 class="text-white grad"><span><img src="images/cp.png" style="width:50px;height:50px;"></span>&nbsp; Competitive Programming Club &nbsp;<span><img src="images/cp.png" style="width:50px;height:50px;"></span></h2>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/bhuru.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Bhuresh Kumar</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">4* Coder at CodeChef</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                       
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/me.jpeg" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Swaraj Kumar</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">3* Coder at CodeChef</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="https://www.linkedin.com/in/kumarswaraj16/" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="https://www.instagram.com/swaraj_kum16/" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="https://github.com/kumarswaraj16" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                      
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/manoj.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Manoj Yadav</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">3* Coder at CodeChef</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="p-2 col-sm-12 text-center card grad mt-4">
                   <h2 class="text-white grad"><span><img src="images/android.png" style="width:50px;height:50px;"></span>&nbsp;Android Development Club &nbsp;<span><img src="images/android.png" style="width:50px;height:50px;"></span></h2>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/himanshu.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Himanshu Pandey</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">Creator of Barbera App</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                       
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/mohit.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Mohit Vats</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">Creator of Helping Hand App</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                      
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/charu.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Charu Singh</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">Creator of Event Planner App</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="p-2 col-sm-12 text-center card grad mt-4">
                   <h2 class="text-white grad"><span><img src="images/web.png" style="width:50px;height:50px;"></span>&nbsp; Web Development Club &nbsp;<span><img src="images/web.png" style="width:50px;height:50px;"></span></h2>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/me.jpeg" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Swaraj Kumar</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">Creator of "This" WebSite</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                       
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/nikita.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Nikita Sharma</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">1 Yr+ Experience in Web Dev.</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                      
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/narpat.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Narpat Patel</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">1 Yr+ Experience in Web Dev.</h4>            
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="p-2 col-sm-12 text-center card grad mt-4">
                   <h2 class="text-white grad"><span><img src="images/ml.png" style="width:50px;height:50px;"></span>&nbsp; Machine Learning Club &nbsp;<span><img src="images/ml.png" style="width:50px;height:50px;"></span></h2>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/prikshit.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Parikshit Singh Rathore</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">2 Yr+ Experience in ML</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                       
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/priyansh.png" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Priyansh Jain</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">1 Yr+ Experience in ML</h4>
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
              <div class="col-md-4">
                   <div class="card mt-4 grad text-white">                      
                        <div class="embed-responsive embed-responsive-4by3">
                           <img class="card-img-top embed-responsive-item" src="images/ritik.jpeg" alt="card image cap">
                        </div>
                        <div class="card-body">
                             <h3 class="card-title text-nowrap">Ritik Soni</h3>
                             <h5 class="card-subtitle text-wrap mb-2 text-muted">CSE Branch, CTAE</h5>
                             <h4 class="card-subtitle overflow-auto mb-2 text-muted">1 Yr+ Experience in ML</h4>            
                        </div>
                        <div class="card-footer">
                            <div class="centerdiv">
                               <a href="#" target="_blank"><i class="fa fa-2x fa-linkedin"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-instagram"></i></a>
	                           <a href="#" target="_blank"><i class="fa fa-2x fa-github"></i></a>
                            </div>
                        </div>
                   </div>
              </div>
          </div>
      </div>
</body>
</html>