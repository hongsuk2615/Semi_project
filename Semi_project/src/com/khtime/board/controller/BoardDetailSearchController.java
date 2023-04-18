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
import com.khtime.board.model.service.SearchService;
import com.khtime.board.model.vo.Board;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class BoardDetailSearchController
 */
@WebServlet("/boDetailSearch.do")
public class BoardDetailSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  
	      String keyword = request.getParameter("keyword");
	      

	      int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();

			int currentPage; // 현제 페이지(사용자가 요청한페이지)
			int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수
			currentPage = Integer
					.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
			boardLimit = 10;
			PageInfo pi = new PageInfo(currentPage, boardLimit);

			 ArrayList<Board> searchList = new SearchService().searchList( pi, keyword);
			ArrayList<Integer> recommendcheck = new RecommendService().recommendCheck(userNo);
			ArrayList<Integer> scrapcheck = new ScrapService().scrapCheck(userNo);

			 request.setAttribute("searchList", searchList);
		      request.setAttribute("keyword", keyword);
			request.setAttribute("recommendcheck", recommendcheck);
			request.setAttribute("scrapcheck", scrapcheck);

			request.getRequestDispatcher("views/board/boardDetailSearch.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyword = request.getParameter("keyword");
		
		int currentPage;
		int boardLimit;
		currentPage = Integer
				.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		boardLimit = 10;
		PageInfo pi = new PageInfo(currentPage, boardLimit);
		System.out.println(keyword);
		 ArrayList<Board> searchList = new SearchService().searchList(pi, keyword);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(searchList , response.getWriter());
	}

}
