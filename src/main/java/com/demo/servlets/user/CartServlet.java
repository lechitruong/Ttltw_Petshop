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

import com.demo.entities.Item;
import com.demo.entities.Pets;
import com.demo.models.ItemModel;
import com.demo.models.PetModel;
import com.google.gson.Gson;

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
		} else if (action.equalsIgnoreCase("minus")) {
			doGet_Minus(request, response);
		} else if (action.equalsIgnoreCase("plus")) {
			doGet_Plus(request, response);
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
	    if (request.getSession().getAttribute("cart") == null) {
	        List<Item> cart = new ArrayList<>();
	        cart.add(new Item(pet,1));
	        request.getSession().setAttribute("cart", cart);
	    } else {
	        List<Item> cart = (List<Item>) request.getSession().getAttribute("cart");
	        int index = ItemModel.exist(cart, id);
	        if(index == -1) {
	            cart.add(new Item(pet, 1));
	        } else {
	            int quantity = cart.get(index).getQuantity()+1;
	            cart.get(index).setQuantity(quantity);
	        }
	        request.getSession().setAttribute("cart", cart); 
	    }
	    response.sendRedirect("cart");
	}
	protected void doGetRemoveToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Item> cart = (List<Item>) request.getSession().getAttribute("cart");
		String petID = request.getParameter("index");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(petID);
		cart.remove(id);
		request.getSession().setAttribute("cart", cart);
		response.sendRedirect("cart");
		
	}
	protected void doGet_Plus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int index = Integer.parseInt(request.getParameter("index"));
	    List<Item> cart = (List<Item>) request.getSession().getAttribute("cart");
	    
	    if (cart != null && index >= 0 && index < cart.size()) {
	        int quantity = cart.get(index).getQuantity() + 1;
	        cart.get(index).setQuantity(quantity);
	        
	        request.getSession().setAttribute("cart", cart);
	        
	        // Prepare JSON response
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print(new Gson().toJson(cart));
	    }
	}

	protected void doGet_Minus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int index = Integer.parseInt(request.getParameter("index"));
	    List<Item> cart = (List<Item>) request.getSession().getAttribute("cart");
	    
	    if (cart != null && index >= 0 && index < cart.size()) {
	        if (cart.get(index).getQuantity() > 1) {
	            int quantity = cart.get(index).getQuantity() - 1;
	            cart.get(index).setQuantity(quantity);
	        } else {
	            cart.remove(index);
	        }
	        
	        request.getSession().setAttribute("cart", cart);
	        
	        // Prepare JSON response
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print(new Gson().toJson(cart));

	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
