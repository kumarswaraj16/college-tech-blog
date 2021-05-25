<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">

<%

    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    ArrayList<Post> post = null;
    if(cid==0){
    	post = postDao.getAllPosts();
    }else{
    	post = postDao.getAllPostsByCatId(cid);
    }
    
    if(post.size()==0){
    	out.println("<h3 class='display-2 text-center'>No Post in this Category, Be the First to Post!</h3>");
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
                 <p><%= p.getpContent().substring(0,50) %>...</p>
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
				  %>>
					<a href="#!" class="btn btn-sm btn-outline-dark text-white grad"><i
						class="fa fa-thumbs-o-up">&nbsp;<span><%= ld.countLikeOnPost(p.getPid()) %></span></i></a> <a href="#!"
						class="btn btn-sm btn-outline-dark text-white grad"><i
						class="fa fa-commenting-o">&nbsp;<span>5</span></i></a>
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