package com.khtime.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.management.model.service.ManagementService;

/**
 * Servlet implementation class UserBanManagementController
 */
@WebServlet("/banUser.do")
public class UserBanManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBanManagementController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String isBanned = request.getParameter("isBanned");
		int result = new ManagementService().banUser(userId, isBanned);
		if(result > 0) {
			if(isBanned.equals("Y")) {
				request.getSession().setAttribute("alertMsg", "계정정지성공");
			}else {
				request.getSession().setAttribute("alertMsg", "정지해제성공");
			}
		}else {
			request.getSession().setAttribute("alertMsg", "계정정지/정지해제 실패");
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
