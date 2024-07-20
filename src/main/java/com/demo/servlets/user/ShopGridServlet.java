package com.demo.servlets.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.demo.models.PetModel; // Thay thế bằng tên lớp bạn dùng để quản lý pets
import com.demo.entities.Pets;

import java.util.List;

@WebServlet("/shopgrid")
public class ShopGridServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopGridServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String priceRange = request.getParameter("price");

		PetModel petModel = new PetModel(); // Thay thế bằng cách khởi tạo hoặc lấy đối tượng PetModel của bạn
		List<Pets> pets = petModel.findPetsByFilter(category, priceRange);

		request.setAttribute("pets", pets);
		request.setAttribute("p", "../user/shop-grid.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
