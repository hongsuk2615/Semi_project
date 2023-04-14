package com.khtime.book.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
import com.khtime.common.model.vo.PageInfo;
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/book/thumb_upfiles/");

			MultipartRequest multi = new MultipartRequest(request , savePath , maxSize, "UTF-8",
					new MyFileRenamePolicy());
			

			String bookName = multi.getParameter("title");
			String author = multi.getParameter("author");
			String publisher = multi.getParameter("publisher");
			int seller = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			String isNoted = multi.getParameter("isNoted");
			int condition = Integer.parseInt(multi.getParameter("condition"));
			String isDirect = multi.getParameter("isDirect");
			String location = multi.getParameter("location");
			int price = Integer.parseInt(multi.getParameter("price"));
			int listPrice = Integer.parseInt(multi.getParameter("listPrice"));
			System.out.println(author);
			
			
			Book book = new Book();
			book.setBookName(multi.getParameter("title"));
			book.setAuthor(multi.getParameter("author"));
			book.setPublisher(multi.getParameter("publisher"));
			book.setSeller(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
			book.setIsNoted(multi.getParameter("isNoted"));
			book.setCondition(Integer.parseInt(multi.getParameter("condition")));
			book.setIsDirect(multi.getParameter("isDirect"));
			book.setLocation(multi.getParameter("location"));
			book.setPrice(Integer.parseInt(multi.getParameter("price")));
			book.setPublicationDate(multi.getParameter("publicationDate"));
			book.setApiImg(multi.getParameter("thumbnail"));
			book.setContent(multi.getParameter("content"));
			book.setListPrice(Integer.parseInt(multi.getParameter("listPrice")));
			
			BookAttachment bat = null; 
			
			
			ArrayList<BookAttachment> bList = new ArrayList<>();
			
			for(int i = 1; i <= 2; i++) {
				
				String key = "upfiles"+i; 
				
				if(multi.getOriginalFileName(key) != null) {
					
					bat = new BookAttachment();
					bat.setOriginName(multi.getOriginalFileName(key));
					bat.setChangeName(multi.getFilesystemName(key));
					bat.setFilePath("/resources/book/thumb_upfiles/");
					bat.setFileLevel(i);
					bList.add(bat);
				}
			}
			
			int result = new BookService().insertThumbnailBook(book, bList);
			
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 업로드 되었습니다.");
				response.sendRedirect(request.getContextPath()+"/bookstore.do");
			} else {
				request.setAttribute("errorMsg", "사진 게시판 업로드 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} 
		} 
	}
}

