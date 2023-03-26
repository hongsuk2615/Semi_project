package com.khtime.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.management.model.service.ManagementService;

/**
 * Servlet implementation class UserWhitelistController
 */
@WebServlet("/whiteList.do")
public class UserWhitelistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserWhitelistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		int result = new ManagementService().whitelistUser(userId);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "화이트리스트 추가 성공");
		}else {
			request.getSession().setAttribute("alertMsg", "화이트리스트 추가 실패");
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
