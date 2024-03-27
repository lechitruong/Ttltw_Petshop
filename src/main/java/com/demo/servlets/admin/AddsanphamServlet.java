package com.demo.servlets.admin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Pets;
import com.demo.entities.Users;
import com.demo.models.PetModel;
import com.demo.models.UserModel;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/admin/addsanpham")
public class AddsanphamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddsanphamServlet() {
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
			PetModel petModel = new PetModel();
			List<Pets> pets = petModel.findAll();
			request.setAttribute("p", "../admin/addpet.jsp");
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
		if (action.equalsIgnoreCase("addpet")) {
			doPost_AddPet(request, response);
		}
	}
	protected void doPost_AddPet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PetModel petModel = new PetModel();
		Pets pet = new Pets();
		String petName = request.getParameter("petName");
		String petType = request.getParameter("petType");
		String petGender = request.getParameter("petGender");
		String description = request.getParameter("description");
		String detail = request.getParameter("detail");
		String made = request.getParameter("made");
		String amount = request.getParameter("amount");
		String money = request.getParameter("money");
		System.out.println(money);
		String createDate = request.getParameter("createDate");
		String image = request.getParameter("image");
		String categoryname = request.getParameter("categoryname");
		String catalogname = request.getParameter("catalogname");
		pet.setPetName(new String(petName.getBytes("ISO-8859-1"), "UTF-8"));
		pet.setPetType(new String(petType.getBytes("ISO-8859-1"), "UTF-8"));
		pet.setPetGender(new String(petGender.getBytes("ISO-8859-1"), "UTF-8"));
		pet.setDescription(new String(description.getBytes("ISO-8859-1"), "UTF-8"));
		pet.setDetail(new String(detail.getBytes("ISO-8859-1"), "UTF-8"));
		pet.setMade(new String(made.getBytes("ISO-8859-1"), "UTF-8"));
		pet.setAmount(Integer.parseInt(amount));
		pet.setMoney(new String(money.getBytes("ISO-8859-1"), "UTF-8") +" triệu đồng");
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			pet.setCreateDate(dateformat.parse(createDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pet.setImage(new String(image.getBytes("ISO-8859-1"), "UTF-8"));
		pet.setCategoryPetId(Integer.parseInt(categoryname));
		pet.setCatalogId(Integer.parseInt(catalogname));
		if (petModel.create(pet)) {
			request.getSession().setAttribute("message", "Tao thanh cong");
			response.sendRedirect("danhsachsanpham");
		} else {
			request.getSession().setAttribute("message", "Tao that bai");
			response.sendRedirect("danhsachsanpham");
		}
	}

}
