package com.demo.servlets.admin;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Catalogs;
import com.demo.entities.Categorys;
import com.demo.entities.Pets;
import com.demo.entities.WarehouseInvoice;
import com.demo.models.CatalogModel;
import com.demo.models.CategoryModel;
import com.demo.models.PetModel;
import com.demo.models.WarehouseInvoiceModel;
import com.google.gson.Gson;

@WebServlet("/admin/editorder")
public class EditOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditOrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			doGet_Index(request, response);
		} else if (action.equalsIgnoreCase("confirm")) {
			doGet_Confirm(request, response);
		}
	}

	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("p", "../admin/editorder.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("editorder")) {
			doPost_Edit(request, response);
		} 
	}

	protected void doGet_Confirm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		WarehouseInvoiceModel warehouseInvoiceModel = new WarehouseInvoiceModel();
		WarehouseInvoice warehouseInvoice = warehouseInvoiceModel.findInvoiceByID(id);
		warehouseInvoice.setStatus(true);
		if (warehouseInvoiceModel.update(warehouseInvoice)) {
			PetModel petModel = new PetModel();
			Pets pet = petModel.findPetById(warehouseInvoice.getPetId());
			pet.setAmount(pet.getAmount() + warehouseInvoice.getQuantity());
			if (petModel.update(pet)) {
				request.getSession().setAttribute("msg-invoice", "Nhập hàng thành công");
				response.sendRedirect("quanlinhaphang");
			} else {
				request.getSession().setAttribute("msg-invoice", "Nhập hàng không thành công");
				response.sendRedirect("quanlinhaphang");
			}
		}
	}

	protected void doPost_Edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		WarehouseInvoiceModel warehouseInvoiceModel = new WarehouseInvoiceModel();
		WarehouseInvoice warehouseInvoice = warehouseInvoiceModel.findInvoiceByID(id);
		int petId = Integer.parseInt(request.getParameter("petname"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		Date tradeDate = new Date();
		warehouseInvoice.setPetId(petId);
		warehouseInvoice.setQuantity(quantity);
		warehouseInvoice.setPrice(price);
		warehouseInvoice.setTradeDate(tradeDate);
		warehouseInvoice.setStatus(false);
		if (warehouseInvoiceModel.update(warehouseInvoice)) {
			response.sendRedirect("quanlinhaphang");
		}
	}
}
