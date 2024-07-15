package com.demo.servlets.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Bills;
import com.demo.models.BillModel;

/**
 * Servlet implementation class ShowBillServlet
 */
@WebServlet("/showbill")
public class ShowBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            doGetIndex(request, response);
        }
    }

    protected void doGetIndex(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String billIdParam = request.getParameter("billId");
        if (billIdParam != null) {
            int billId = Integer.parseInt(billIdParam);
            BillModel billModel = new BillModel();
            Bills bill = billModel.findBillById(billId);
            request.setAttribute("bill", bill);
            request.getRequestDispatcher("/WEB-INF/views/user/showbill.jsp").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
