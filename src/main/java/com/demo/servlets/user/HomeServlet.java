package com.demo.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.entities.Pets;
import com.demo.models.PetModel;
import com.google.gson.Gson;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGetIndex(request, response);
		}else if( action.equals("filterByCategory")) {
			doGetCategory(request, response);
		}
	}
	protected void doGetIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("p", "../user/main.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGetCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String categoryId = request.getParameter("idcategory");
		List<Pets> pets = new ArrayList<>();
		PetModel petModel = new PetModel();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		int idCategory = Integer.parseInt(categoryId);
		PrintWriter printWriter = response.getWriter();
		Gson gson = new Gson();
		printWriter.print(gson.toJson(petModel.findAllByCategory(idCategory)));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
