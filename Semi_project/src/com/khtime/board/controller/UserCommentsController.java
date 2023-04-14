package com.khtime.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.service.RecommendService;
import com.khtime.board.model.service.ReplyService;
import com.khtime.board.model.service.ScrapService;
import com.khtime.board.model.vo.Board;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class UserWritingController
 */
@WebServlet("/myComments.bo")
public class UserCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCommentsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		int bType = Integer.parseInt(request.getParameter("bType"));
		int listCount;
		int currentPage; 
		int boardLimit;
		int maxPage; 

		listCount = new BoardService().listCountReply(userNo);
		currentPage = Integer
				.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		boardLimit = 15;
		maxPage = (int) Math.ceil(((double) listCount / boardLimit));
		PageInfo pi = new PageInfo(listCount, currentPage, boardLimit, maxPage);
		
		ArrayList<Board> boardList = new BoardService().userComments(pi, userNo);
		ArrayList<Integer> recommendcheck = new RecommendService().recommendCheck(userNo);
		ArrayList<Integer> scrapcheck = new ScrapService().scrapCheck(userNo);
		
		request.setAttribute("bType", bType);
		request.setAttribute("pi", pi);
		request.setAttribute("boardList", boardList);
		request.setAttribute("recommendcheck", recommendcheck);
		request.setAttribute("scrapcheck", scrapcheck);
	
		request.getRequestDispatcher("views/board/userBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
