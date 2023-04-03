package com.khtime.book.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.khtime.book.model.service.BookService;
import com.khtime.book.model.vo.Book;
import com.khtime.book.model.vo.BookAttachment;
import com.khtime.common.model.vo.MyFileRenamePolicy;
import com.khtime.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BookInsertController
 */
@WebServlet("/bookinsert.do")
public class BookInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/book/bookstore.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) { 

			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/book_upfile/");

			MultipartRequest multi = new MultipartRequest(request , savePath , maxSize, "UTF-8",
			new MyFileRenamePolicy());
			

			String bookName = multi.getParameter("title");
			String author = multi.getParameter("author");
			String publisher = multi.getParameter("publisher");
			int seller = ((Member)request.getSession().getAttribute("loginUserId")).getUserNo();
			String isNoted = multi.getParameter("isNoted");
			int condition = Integer.parseInt(multi.getParameter("condition"));
			String isDirect = multi.getParameter("isDirect");
			String location = multi.getParameter("location");
			
			Book book = new Book();
			
			book.setBookName(bookName);
			book.setAuthor(author);
			book.setPublisher(publisher);
			book.setSeller(seller);
			book.setIsNoted(isNoted);
			book.setCondition(condition);
			book.setIsDirect(isDirect);
			book.setLocation(location);
			
			BookAttachment bat = null; 
			
			if(multi.getOriginalFileName("upfile") != null ) { 
				bat = new BookAttachment();
				bat.setOriginName( multi.getOriginalFileName("upfile") ); 
				bat.setChangeName( multi.getFilesystemName("upfile")); 
				bat.setFilePath("resources/book_upfiles/");
			}
			
			
			int result = new BookService().insertBook(book , bat);
			
			if(result > 0) { 
				
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath()+"/bookstore.do?currentPage=1");
			} else {
				
				if(bat != null) {
					
					new File(savePath+bat.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "전송방법이 잘못 되었습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("errorMsg", "전송방법이 잘못 되었습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}
}

