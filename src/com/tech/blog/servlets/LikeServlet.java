package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helpers.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
@MultipartConfig
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeServlet() {
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

		String operation = request.getParameter("operation");
		int pid = Integer.parseInt(request.getParameter("pid"));
		int uid = Integer.parseInt(request.getParameter("uid"));

//		out.println(pid + "," + operation + "," + uid);

		try {
			LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
			boolean isLiked = likeDao.isLikedByUser(pid, uid);
			if (operation.equals("like") && isLiked == false) {
				boolean flag = likeDao.insertLike(pid, uid);
				out.println(flag);
			} else {
				likeDao.deleteLike(pid, uid);
				out.println(!isLiked);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
