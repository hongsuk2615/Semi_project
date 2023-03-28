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
 * Servlet implementation class InsertBoardController
 */
@WebServlet("/insert.bo")
public class InsertBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isQuestion = request.getParameter("isQuestion") == null ? "N" : "Y";
		String isAnonimous = request.getParameter("isAnonimous")  == null ? "N" : "Y";;
		
		Board b = new Board();
		b.setWriter(String.valueOf(userNo));
		b.setCategoryNo(cNo);
		b.setTitle(title);
		b.setContent(content);
		b.setIsQuestion(isQuestion);
		b.setIsAnonimous(isAnonimous);
		
		int result = new BoardService().insertBoard(b);
		System.out.println(result);
		if(result > 0 ) {
			
			request.getRequestDispatcher("views/board/boardDetail.jsp").forward(request, response);
		}else {
			System.out.println("실패");
		}
		
		
		
	}

}
