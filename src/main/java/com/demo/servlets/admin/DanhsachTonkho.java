package com.demo.servlets.admin;

import java.io.IOException;
<<<<<<< HEAD
import java.sql.Date;
import java.util.List;
=======
import java.util.Date;
import java.util.List;

>>>>>>> 310c0d33e599b5b2aec630d97f4cd21442fb83ef
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import com.demo.entities.Pets;
import com.demo.models.PetModel;

@WebServlet("/admin/quanlitonkho")
public class DanhsachTonkho extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DanhsachTonkho() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PetModel petModel = new PetModel();

        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        List<Pets> pets;
        if (startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty()) {
            Date startDate = Date.valueOf(startDateStr);
            Date endDate = Date.valueOf(endDateStr);
            pets = petModel.findInactivePetsInRange(startDate, endDate);
        } else {
            pets = petModel.findAllWithPositiveQuantity();
        }

        request.setAttribute("petinventory", pets);
        request.setAttribute("p", "../admin/showinventory.jsp");
        request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
=======
import com.demo.entities.Log;
import com.demo.entities.Pets;
import com.demo.entities.WarehouseInvoice;
import com.demo.models.LogModel;
import com.demo.models.PetModel;
import com.demo.models.WarehouseInvoiceModel;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/admin/quanlitonkho")
public class DanhsachTonkho extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DanhsachTonkho() {
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
			List<Pets> pets = petModel.findAllWithPositiveQuantity();
			request.setAttribute("petinventory", pets);
			request.setAttribute("p", "../admin/showinventory.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
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

>>>>>>> 310c0d33e599b5b2aec630d97f4cd21442fb83ef
}
