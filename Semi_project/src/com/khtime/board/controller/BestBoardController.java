package com.khtime.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.service.CategoryService;
import com.khtime.board.model.service.RecommendService;
import com.khtime.board.model.service.ScrapService;
import com.khtime.board.model.vo.Board;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class BestBoardController
 */
@WebServlet("/best.bo")
public class BestBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int rcCount = Integer.parseInt(request.getParameter("rcCount"));
		String year = request.getParameter("year");
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();

		int currentPage; // 현제 페이지(사용자가 요청한페이지)
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수
		currentPage = Integer
				.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		boardLimit = 10;
		PageInfo pi = new PageInfo(currentPage, boardLimit);

		ArrayList<Board> bestList = new BoardService().bestList(rcCount, pi, year);
		ArrayList<Integer> recommendcheck = new RecommendService().recommendCheck(userNo);
		ArrayList<Integer> scrapcheck = new ScrapService().scrapCheck(userNo);

		request.setAttribute("year", year);
		request.setAttribute("bestList", bestList);
		request.setAttribute("rcCount", rcCount);
		request.setAttribute("recommendcheck", recommendcheck);
		request.setAttribute("scrapcheck", scrapcheck);

		request.getRequestDispatcher("views/board/bestBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int rcCount = Integer.parseInt(request.getParameter("rcCount"));
		String year = request.getParameter("year");
		
		int currentPage;
		int boardLimit;
		currentPage = Integer
				.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		boardLimit = 10;
		PageInfo pi = new PageInfo(currentPage, boardLimit);

		ArrayList<Board> bestList =  new BoardService().bestList(rcCount, pi, year);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(bestList , response.getWriter());
	}

}
