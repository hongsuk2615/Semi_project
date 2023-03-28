package com.khtime.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;

import com.khtime.board.model.service.CategoryService;
import com.khtime.board.model.vo.Board;
import com.khtime.common.model.vo.PageInfo;




/**
 * Servlet implementation class BoardDetailController
 */

@WebServlet("/boardDetail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDetailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int cNo = Integer.valueOf(request.getParameter("cNo"));
		
		
		int listCount; // 현재 게시판의 총 개시글 갯수
		int currentPage; // 현제 페이지(사용자가 요청한페이지)
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수
		int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 수)
		listCount = new BoardService().boardListCount(cNo);
		currentPage = Integer
				.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		boardLimit = 15;
		maxPage = (int) Math.ceil(((double) listCount / boardLimit));
		PageInfo pi = new PageInfo(listCount, currentPage, boardLimit, maxPage);

		ArrayList<Board> boardList = new BoardService().selectBoard(cNo, pi);
		String cName = new CategoryService().getCategoryName(cNo);
		
		
		request.setAttribute("cNo", cNo);
		request.setAttribute("cName", cName);
		request.setAttribute("pi", pi);
		request.setAttribute("boardList", boardList);
		
		request.getRequestDispatcher("views/board/boardDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


}
	}
