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
 * Servlet implementation class BookUpdateController
 */
@WebServlet("/mybookdetail.do")
public class MyBookDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBookDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int bkno = Integer.parseInt(request.getParameter("bkno"));
		
		ArrayList<Object> book = new BookService().selectBook(bkno);
		if(book.size()>1) {
			request.setAttribute("seller", (String)book.get(0));
			request.setAttribute("book", (Book)book.get(1));
			System.out.println(book);
		}else {
			request.setAttribute("seller", "");
			request.setAttribute("book", "");
		}
		
		ArrayList<BookAttachment> bList = new BookService().selectThumbnail(bkno);
		
		request.setAttribute("bList", bList);
		
		
		request.getRequestDispatcher("views/book/myBookDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}

}
