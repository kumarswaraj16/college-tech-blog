package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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

		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");

		try {
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
			if (user == null) {
				Message msg = new Message("Invalid Details, try again!", "error", "alert-danger");
				HttpSession hs = request.getSession();
				hs.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");
			} else {
				HttpSession hs = request.getSession();
				hs.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
