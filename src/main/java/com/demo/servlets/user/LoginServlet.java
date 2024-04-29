package com.demo.servlets.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Log;
import com.demo.entities.Users;
import com.demo.helpers.ConfigIP;
import com.demo.helpers.IPAddressUtil;
import com.demo.helpers.MailHelper;
import com.demo.helpers.RandomStringHelper;
import com.demo.models.LogModel;
import com.demo.models.RoleModel;
import com.demo.models.UserModel;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
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
		String action = request.getParameter("action");
		if (action == null || action.equalsIgnoreCase("login")) {
			doGet_Login(request, response);
		} else if (action.equalsIgnoreCase("logout")) {
			doGet_Logout(request, response);
		} else if (action.equalsIgnoreCase("register")) {
			doGet_Register(request, response);
		} else if (action.equalsIgnoreCase("verify")) {
			doGet_Verify(request, response);
		} else if (action.equalsIgnoreCase("message")) {
			doGet_Message(request, response);
		}

	}
//
	protected void doGet_Login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);

	}

	protected void doGet_Message(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login/message.jsp").forward(request, response);

	}

// xac thuc bang email
	protected void doGet_Verify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String securityCode = request.getParameter("securityCode");
		UserModel userModel = new UserModel();
		RoleModel roleModel = new RoleModel();
		Users user = userModel.findUserByUserName(username);
		if (user.getSecurityCode().equalsIgnoreCase(securityCode) && user.getUserName().equalsIgnoreCase(username)) {
			int newRoleId = 2;
			if(roleModel.checkRoleIDExists(2)) {
				user.setStatus(true);	
				user.setRoleId(newRoleId);
				if (userModel.update(user)) {
					response.sendRedirect("login");
				}	
			}
		} else {
			request.getSession().setAttribute("error", "xac thuc khong thanh cong");
			response.sendRedirect("login?action=message");

		}

	}

	protected void doGet_Logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("user");
		response.sendRedirect("login");

	}

	protected void doGet_Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login/register.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			doPost_Index(request, response);
		} else if (action.equalsIgnoreCase("login")) {
			doPost_Login(request, response);
		} else if (action.equalsIgnoreCase("register")) {
			doPost_Register(request, response);
		}
	}

	protected void doPost_Index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	protected void doPost_Login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserModel userModel = new UserModel();
		LogModel logModel = new LogModel();
		Users user = userModel.findUserByUserName(username);
		if (userModel.checkLogin(username, password)) {
			logModel.create(new Log(IPAddressUtil.getPublicIPAddress(),"info",ConfigIP.ipconfig(request).getCountryLong(),new Timestamp(new Date().getTime()), null, null));
			if (user.getRoleId() == 1) {
				request.getSession().setAttribute("user", userModel.findUserByUserName(username));
				response.sendRedirect("admin/home");
			} else {
				request.getSession().setAttribute("user", userModel.findUserByUserName(username));
				response.sendRedirect("home");
			}
		} else {
			request.getSession().setAttribute("msg", "Tai khoan hoac mat khau khong dung!");
			response.sendRedirect("login");
		}
	}

	protected void doPost_Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String securityCode = RandomStringHelper.generateRandomString(6);
		UserModel userModel = new UserModel();
		Users user = new Users();
		user.setUserName(username);
		user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
		user.setEmail(email);
		user.setSecurityCode(securityCode);
		user.setRoleId(2);
		user.setStatus(false);
		user.setBirthday(new java.util.Date());
		if (userModel.create(user)) {
			MailHelper.MailHelper(email, "Xác thực tài khoản của bạn",
					"Bạn hãy bấm vào " + "<a href='http://localhost:8080/PetShop/login?action=verify&username="
							+ username + "" + "&securityCode=" + securityCode
							+ "'>liên kết</a> này để xác thực tài khoản");
			response.sendRedirect("login?action=message");
		} else {
			System.out.println("Tao tai khoan khong thanh cong");
		}

	}

}
