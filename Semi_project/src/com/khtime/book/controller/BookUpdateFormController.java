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
import com.khtime.common.model.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bkno = Integer.parseInt(request.getParameter("bkno"));

		Book book = (Book) new BookService().selectBook(bkno).get(1);

		ArrayList<BookAttachment> batList = new BookService().selectThumbnail(bkno);

		request.setAttribute("book", book);
		request.setAttribute("batList", batList);
		request.getRequestDispatcher("views/book/bookUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;

			String savePath = request.getSession().getServletContext().getRealPath("resources/book/thumb_upfiles");

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy()); 

			int bookNo = Integer.parseInt(multi.getParameter("bkno"));
			String content = multi.getParameter("content");
			int price = Integer.parseInt(multi.getParameter("price"));
			String isNoted = multi.getParameter("isNoted");
			int condition = Integer.parseInt(multi.getParameter("condition"));
			String isDirect = multi.getParameter("isDirect");

			Book book = new Book();
			book.setBookNo(bookNo);
			book.setContent(content);
			book.setPrice(price);
			book.setIsNoted(isNoted);
			book.setCondition(condition);
			book.setIsDirect(isDirect);

			ArrayList<BookAttachment> batList = new ArrayList<BookAttachment>();
			BookAttachment bat = null;

			if (multi.getOriginalFileName("upfiles1") != null) {

				bat = new BookAttachment();

				bat.setOriginName(multi.getOriginalFileName("upfiles1"));
				bat.setChangeName(multi.getFilesystemName("upfiles1"));
				bat.setFilePath("/resources/book/thumb_upfiles/");

				if (multi.getParameter("orgUpfiles0") != null) {
					
					BookAttachment orgBat = new BookService().selectBookAttachment(Integer.parseInt(multi.getParameter("orgUpfiles0")));

					bat.setFileNo(orgBat.getFileNo());
					bat.setFileLevel(orgBat.getFileLevel());
					new File(savePath + orgBat.getChangeName()).delete();

				} else {
					// 기존에 첨부파일 없는 경우
					// Attachment 테이블에 정보를 insert
					// REF_BNO에 현재 게시글 번호를 추가 시켜줌.
					bat.setBookNo(bookNo);
					bat.setFileLevel(1);
				}
				batList.add(bat);
			}

			if (multi.getOriginalFileName("upfiles2") != null) {

				bat = new BookAttachment();

				bat.setOriginName(multi.getOriginalFileName("upfiles2"));
				bat.setChangeName(multi.getFilesystemName("upfiles2"));
				bat.setFilePath("/resources/book/thumb_upfiles/");

				if (multi.getParameter("orgUpfiles1") != null) {
					
					BookAttachment orgBat = new BookService().selectBookAttachment(Integer.parseInt(multi.getParameter("orgUpfiles1")));
					
					bat.setFileNo(orgBat.getFileNo());
					bat.setFileLevel(orgBat.getFileLevel());
					new File(savePath + orgBat.getChangeName()).delete();

				} else {
					// 기존에 첨부파일 없는 경우
					// Attachment 테이블에 정보를 insert
					// REF_BNO에 현재 게시글 번호를 추가 시켜줌.
					bat.setBookNo(bookNo);
					bat.setFileLevel(2);
				}
				batList.add(bat);
			}

			// 하나의 트랜잭션으로 board에 update문과 Attachment테이블의 insert, update 동시에 처리 해 주기.
			int result = new BookService().updateBook(book, batList);
			// 항상 board에 update문은 반드시 실행 시켜줘야함.
			// case 1: 새로운 첨부파일이 애초에 없는 경우(x) -> insert (X), update (X)
			// case 2: 새로운 첨부파일이 있는 경우(o), 기존에도 첨부파일이 있던 경우 (o) -> update(o) , insert(x)
			// case 3: 새로운 첨부파일이 있는 경우(o), 기존에는 첨부파일이 없던 경우 (x) -> update(x) , insert(o)

			// 수정 성공 시 : 상세조회 페이지로 redirect
			if (result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 수정 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/mybookdetail.do?bkno=" + bookNo);
			} else { // 수정 실패 시 : errorPage
				request.setAttribute("errorMsg", "게시글 수정에 실패 했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}

		} else {
			request.setAttribute("errorMsg", "전송방식이 잘못 되었습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}

}
