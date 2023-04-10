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

/**
 * Servlet implementation class BookSearchDetailController
 */
@WebServlet("/booksearchdetail.do")
public class BookSearchDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bkno = Integer.parseInt(request.getParameter("bkno"));
		
		Book book = new BookService().selectBook(bkno);
		
		response.sendRedirect(request.getContextPath() + "/booksearchdetail.do?bkno=" +bkno);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String thumbnail = request.getParameter("thumbnail");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String datetime = request.getParameter("datetime");
		String contents = request.getParameter("contents");
		
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
		 
		String bookname = request.getParameter("title");
		request.setAttribute("bookname", bookname);
		
		ArrayList<Book> bList = new BookService().selectBook(bookname);
		request.setAttribute("bList", bList);
		System.out.println(bList);
		
		System.out.println(bookname);
		request.getRequestDispatcher("views/book/bookSearchDetail.jsp").forward(request, response);
//		response.sendRedirect(request.getContextPath()+"/booksearchdetail.do?bookname="+title);
	}

}
