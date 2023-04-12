package com.khtime.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.book.model.service.BookService;
import com.khtime.book.model.vo.Book;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class BookSellListController
 */
@WebServlet("/bookselllist.do")
public class BookSellListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSellListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; // 현재 게시판의 총 개시글 갯수
		int currentPage; // 현제 페이지(사용자가 요청한페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수
		int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = 50;
		
		currentPage = Integer.parseInt(  request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")  );
		pageLimit= 4;
		boardLimit = 8;
		maxPage = (int) Math.ceil(((double) listCount / boardLimit));
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		 if(endPage > maxPage) {
			 endPage = maxPage;
		 }
		
		
		 PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		 request.setAttribute("pi", pi);
		 
		 int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		 
		 ArrayList<Book> bList = new BookService().selectBookSellList(pi ,loginUserNo);
		 System.out.println(bList);
		 
		 request.setAttribute("bList", bList);
		 
		request.getRequestDispatcher("views/book/bookSellList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
