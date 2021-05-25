package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;
import com.tech.blog.helpers.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		int cid = Integer.parseInt(request.getParameter("cid"));
		String title = request.getParameter("post_title");
		String content = request.getParameter("post_content");
		String code = request.getParameter("post_code");
		Part part = request.getPart("post_pic");
		String postPicName = part.getSubmittedFileName();

		HttpSession hs = request.getSession();
		User user = (User) hs.getAttribute("currentUser");

		Post post = new Post(title, content, code, postPicName, cid, null, user.getId());

		try {
			PostDao postDao = new PostDao(ConnectionProvider.getConnection());
			if (postDao.savePost(post)) {
				String path = request.getRealPath("/") + "blog_pics" + File.separator + postPicName;
				Helper.saveFile(part.getInputStream(), path);
				out.println("Done");
			} else {
				out.println("Some Error Occured!");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
