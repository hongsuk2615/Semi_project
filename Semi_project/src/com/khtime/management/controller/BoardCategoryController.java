package com.khtime.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.management.model.service.ManagementService;

/**
 * Servlet implementation class BoardCategoryController
 */
@WebServlet("/approveMakeBoard.do")
public class BoardCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cName = request.getParameter("cName");
		String approve = request.getParameter("approve");
		int result = 0;
		if(approve.equals("Y")) {
			result = new ManagementService().approveMakeBoard(cName);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시판 카테고리 생성 승인완료");
			}else {
				request.getSession().setAttribute("alertMsg", "게시판 카테고리 생성 승인실패");
			}
		}else {
			result = new ManagementService().denyMakeBoard(cName);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시판 카테고리 생성 거부완료");
			}else {
				request.getSession().setAttribute("alertMsg", "게시판 카테고리 생성 거부실패");
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
