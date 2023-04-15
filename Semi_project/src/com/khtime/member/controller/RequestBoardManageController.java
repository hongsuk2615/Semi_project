package com.khtime.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khtime.board.model.service.CategoryService;
import com.khtime.board.model.vo.Category;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class RequestBoardManageController
 */
@WebServlet("/reqBoard.me")
public class RequestBoardManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestBoardManageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<Category> list = new CategoryService().selectRequestBoard(loginUserNo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/member/boardReqStatus.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
