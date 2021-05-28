
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">

<%

    User user = (User) session.getAttribute("currentUser");

    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    ArrayList<Post> post = null;
    if(cid==0){
    	post = postDao.getAllPostByUserId(user.getId());
    }else{
    	post = postDao.getUserPostsByCatId(user.getId(), cid);
    }
    
    if(post.size()==0){
    	out.println("<div class='col-md-6 offset-4 mt-5'>");
    	out.println("<img src='images/nopost.jpeg' style='height: 300px;width:300px;'>");
    	out.println("<h3 class='mt-2 text-center text-white'>Post First Time &nbsp;&nbsp;<i class='fa fa-trophy'></i> </h3>");
    	out.println("</div>");			
    	return;
    }
    
    for(Post p:post){
%>
    <div class="col-md-6 mt-2">
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

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>