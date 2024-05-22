package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Users;
import com.demo.models.UserModel;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/admin/edituser")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditUserServlet() {
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
		String action = request.getParameter("action");
		if (action == null) {
			int id = Integer.parseInt(request.getParameter("id"));
			UserModel userModel = new UserModel();
			Users user = userModel.findUserById(id);
			request.setAttribute("user", user);
			request.setAttribute("p", "../admin/adduser.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("edituser")) {
			doPost_EditUser(request, response);
		}
	}

	protected void doPost_EditUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		int userId = Integer.parseInt(id);
		UserModel userModel = new UserModel();
		Users user = userModel.findUserById(userId);
		String fullName = request.getParameter("fullname");
		String phoneNumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		user.setId(userId);
		user.setFullName(new String(fullName.getBytes("ISO-8859-1"), "UTF-8"));
		user.setAddress(new String(address.getBytes("ISO-8859-1"), "UTF-8"));
		user.setUserName(new String(username.getBytes("ISO-8859-1"), "UTF-8"));
		if (userModel.update(user)) {
			request.getSession().setAttribute("message", "Update thanh cong");
			response.sendRedirect("quanliuser");
		} else {
			request.getSession().setAttribute("message", "Update that bai");
			response.sendRedirect("quanliuser");
		}
	}

}
