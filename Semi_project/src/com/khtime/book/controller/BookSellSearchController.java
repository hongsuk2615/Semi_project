package com.khtime.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.book.model.vo.Book;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class BookSellSearchController
 */
@WebServlet("/booksellsearch.do")
public class BookSellSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSellSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
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
		
		String bookname = request.getParameter("bookname");
		request.setAttribute("bookname", bookname);
		
		request.getRequestDispatcher("views/book/bookSellSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String thumbnail = request.getParameter("thumbnail");
		String title = request.getParameter("title");
		int seller = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String datetime = request.getParameter("datetime");
		String contents = request.getParameter("contents");
		int listPrice = Integer.parseInt(request.getParameter("listPrice"));
		
		Book book = new Book();
		book.setBookName(title);
		book.setAuthor(author);
		book.setPublisher(publisher);
		book.setListPrice(listPrice); 
		
		request.setAttribute("thumbnail",thumbnail);
		request.setAttribute("title", title);
		request.setAttribute("author", author);
		request.setAttribute("publisher", publisher);
		request.setAttribute("book", book);
		request.setAttribute("datetime", datetime);
		request.setAttribute("contents", contents);
		request.setAttribute("listPrice", listPrice); 
		
		request.getRequestDispatcher("views/book/bookSell.jsp").forward(request, response);
	}

}
