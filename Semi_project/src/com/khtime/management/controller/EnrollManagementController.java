package com.khtime.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.management.model.service.ManagementService;

/**
 * Servlet implementation class EnrollManagementController
 */
@WebServlet("/approveEnroll.do")
public class EnrollManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollManagementController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String approve = request.getParameter("approve");
		int result = 0;
		if(approve.equals("Y")) {
			result = new ManagementService().approveEnroll(userId);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "승인완료");
			}else {
				request.getSession().setAttribute("alertMsg", "승인실패");
			}
		}else {
			result = new ManagementService().denyEnroll(userId);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "거부완료");
			}else {
				request.getSession().setAttribute("alertMsg", "거부실패");
			}
		}
		response.sendRedirect(request.getContextPath()+"/management.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
