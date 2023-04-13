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

/**
 * Servlet implementation class BookUpdateFormController
 */
@WebServlet("/bookupdateform.do")
public class BookUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bkno = Integer.parseInt(request.getParameter("bkno"));
		
		Book book = (Book)new BookService().selectBook(bkno).get(1);

		ArrayList<BookAttachment> batList = new BookService().selectThumbnail(bkno);	
		
		request.setAttribute("book", book);
		request.setAttribute("batList", batList);
		request.getRequestDispatcher("views/book/bookUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
