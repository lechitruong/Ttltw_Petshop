package com.demo.servlets.user;

import java.io.IOException;
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

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
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
		if (action == null) {
			doGetIndex(request, response);
		} else if (action.equalsIgnoreCase("addToCart")) {
			doGetAddToCart(request, response);
		} else if (action.equalsIgnoreCase("removeToCart")) {
			doGetRemoveToCart(request, response);
		}
	}

	protected void doGetIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("p", "../user/cart.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	protected void doGetAddToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String petId = request.getParameter("id");
		int id = Integer.parseInt(petId);
		PetModel petModel = new PetModel();
		Pets pet = petModel.findPetById(id);
		if (request.getSession().getAttribute("pets") == null) {
			List<Pets> pets = new ArrayList<>();
			pets.add(pet);
			request.getSession().setAttribute("pets", pets);
		}else {
			List<Pets> pets = (List<Pets>) request.getSession().getAttribute("pets");
			if(petModel.checkExist(id, pets)) {
				request.getSession().setAttribute("pets", pets);
			}else {
				pets.add(pet);
				request.getSession().setAttribute("pets", pets);
			}
		}
		response.sendRedirect("cart");
	}
	protected void doGetRemoveToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Pets> pets = (List<Pets>) request.getSession().getAttribute("pets");
		String petID = request.getParameter("id");
		int id = Integer.parseInt(petID);
		pets.remove(id);
		request.getSession().setAttribute("pets", pets);
		response.sendRedirect("cart");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
