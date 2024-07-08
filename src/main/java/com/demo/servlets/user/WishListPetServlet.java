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
@WebServlet("/wishlistpet")
public class WishListPetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WishListPetServlet() {
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
		} else if (action.equalsIgnoreCase("wishlist")) {
			doGet_Wishlist(request, response);
		} else if (action.equalsIgnoreCase("remove")) {
			doGet_Remove(request, response);
		}
	}

	protected void doGetIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("p", "../user/wishlist-pet.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	protected void doGet_Wishlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		PetModel petModel = new PetModel();
		Pets pet = petModel.findPetById(id);
		if (request.getSession().getAttribute("wishlistpets") == null) {
			List<Pets> pets = new ArrayList<>();
			pets.add(pet);
			request.getSession().setAttribute("wishlistpets", pets);
		} else {
			List<Pets> pets = (List<Pets>) request.getSession().getAttribute("wishlistpets");
			if (petModel.checkExist(id, pets) == -1) {
				pets.add(pet);
				request.getSession().setAttribute("wishlistpets", pets);
			}else {
				request.getSession().setAttribute("wishlistpets", pets);
			}
		}
            response.sendRedirect("wishlistpet");
	}

	protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		List<Pets> pets = (List<Pets>) request.getSession().getAttribute("wishlistpets");
		pets.remove(id);
		request.getSession().setAttribute("msg", "Đã xóa thú cưng khỏi danh sách yêu thích");
		request.getSession().setAttribute("wishlistpets", pets);
		response.sendRedirect("wishlistpet");
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
