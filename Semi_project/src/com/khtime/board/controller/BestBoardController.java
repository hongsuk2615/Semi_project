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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
		  int rcCount = Integer.parseInt(request.getParameter("rcCount"));
	      String year = request.getParameter("year");
	      
	      int listCount; // 현재 게시판의 총 개시글 갯수
	      int currentPage; // 현제 페이지(사용자가 요청한페이지)
	      int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수
	      int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 수)
	      String boardTitle;
	      if(rcCount ==9) {
	    	  boardTitle = "HOT게시판";
	      }else {
	    	  boardTitle = "BEST게시판";
	      }
	      request.setAttribute("boardTitle", boardTitle);
	      listCount = new BoardService().bestListCount(rcCount);
	      currentPage = Integer
	            .parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
	      boardLimit = 10;
	      maxPage = (int) Math.ceil(((double) listCount / boardLimit));
	      PageInfo pi = new PageInfo(listCount, currentPage, boardLimit, maxPage);

	      ArrayList<Board> bestList = new BoardService().bestList(rcCount, pi,year);
	      
	      
	      
	      request.setAttribute("year", year);
	      request.setAttribute("pi", pi);
	      request.setAttribute("bestList", bestList);
	      request.setAttribute("rcCount", rcCount);
	      
	      request.getRequestDispatcher("views/board/bestBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
