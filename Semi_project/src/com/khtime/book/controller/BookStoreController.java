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
import com.khtime.book.model.vo.BookAttachment;
import com.khtime.common.model.vo.PageInfo;

/**
 * Servlet implementation class BookStoreController
 */
@WebServlet("/bookstore.do")
public class BookStoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookStoreController() {
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
		 System.out.println(pi);
		 
		 request.setAttribute("pi", pi);
		 
		 ArrayList<Book> bList = new BookService().selectThumbnailList();
		 
		 request.setAttribute("bList", bList);
		
		
		request.getRequestDispatcher("views/book/bookstore.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
