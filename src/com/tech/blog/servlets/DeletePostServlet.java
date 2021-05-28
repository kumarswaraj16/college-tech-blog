package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.PostDao;
import com.tech.blog.helpers.ConnectionProvider;

/**
 * Servlet implementation class DeletePostServlet
 */
@WebServlet("/DeletePostServlet")
@MultipartConfig
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeletePostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		boolean flag = false;
		String pid = request.getParameter("postId");
		String operation = request.getParameter("operation");
		try {
			if (pid != null) {
				int postId = Integer.parseInt(pid);
				if (operation.equals("delete")) {
					PostDao pDao = new PostDao(ConnectionProvider.getConnection());
					pDao.deletePost(postId);
					flag = true;
					out.println(flag);
				} else {
					out.println(flag);
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
