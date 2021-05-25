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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;
import com.tech.blog.helpers.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
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

		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		Part part = request.getPart("new_profile_pic");

		String newProfilePic = part.getSubmittedFileName();

		HttpSession hs = request.getSession();
		User user = (User) hs.getAttribute("currentUser");

		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);

		String oldFile = user.getProfile();

		user.setProfile(newProfilePic);

		try {
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			boolean flag = dao.updateUser(user);
			if (flag) {
				String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
				String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;
				if (!oldFile.equals("default.png")) {
					Helper.deleteFile(pathOldFile);
				}
				if (Helper.saveFile(part.getInputStream(), path)) {
					Message msg = new Message("Profile Updated Successfully!!", "success", "alert-success");
					hs.setAttribute("msg", msg);
				} else {
					Message msg = new Message("Some Error Occured!", "error", "alert-danger");
					hs.setAttribute("msg", msg);
				}
			} else {
				Message msg = new Message("Some Error Occured!", "error", "alert-danger");
				hs.setAttribute("msg", msg);
			}
			response.sendRedirect("profile.jsp");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
