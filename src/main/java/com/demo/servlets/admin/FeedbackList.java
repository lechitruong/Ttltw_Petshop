package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.models.ReviewModel;
import com.demo.entities.Reviews;

/**
 * Servlet implementation class FeedbackList
 */
@WebServlet("/admin/feedbacklist")
public class FeedbackList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackList() {
        super();
        // TODO Auto-generated constructor stub
    }
    ReviewModel feedbackModel = new ReviewModel();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Reviews> feedbackList = feedbackModel.getAll();
		request.setAttribute("feedbacklist", feedbackList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/show-review.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
