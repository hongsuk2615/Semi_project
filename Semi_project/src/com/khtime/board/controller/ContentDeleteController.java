package com.khtime.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.vo.Board;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class ContentDeleteController
 */
@WebServlet("/delete.bo")
public class ContentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bNo = Integer.valueOf(request.getParameter("bNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int aC = Integer.valueOf(request.getParameter("aC"));
		int result = new BoardService().deleteContent(bNo, userNo, aC);
		
		response.sendRedirect(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
