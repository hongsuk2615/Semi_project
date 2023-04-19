package com.khtime.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.book.model.service.BookService;
import com.khtime.book.model.vo.Book;

/**
 * Servlet implementation class BookSoldoutController
 */
@WebServlet("/booksoldout.do")
public class BookSoldoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSoldoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bookNo = Integer.parseInt(request.getParameter("bkno"));
		
		int book = new BookService().updateSoldout(bookNo);
		
		request.setAttribute("book", book);
		
		if(book > 0) {
			response.sendRedirect(request.getContextPath()+"/bookselllist.do");			
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
