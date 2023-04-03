package com.khtime.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.vo.Board;
import com.khtime.board.model.vo.BoardAttachment;
import com.khtime.common.model.MyFileRenamePolicy;
import com.khtime.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertBoardController
 */
@WebServlet("/insert.bo")
public class InsertBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertBoardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board/");
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
			int cNo = Integer.parseInt(multi.getParameter("cNo"));
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String isQuestion = multi.getParameter("isQuestion") == null ? "N" : "Y";
			String isAnonimous = multi.getParameter("isAnonimous") == null ? "N" : "Y";
			

			Board b = new Board();
			b.setCategoryNo(cNo);
			b.setTitle(title);
			b.setContent(content);
			b.setIsQuestion(isQuestion);
			b.setIsAnonimous(isAnonimous);
			
			
			
			BoardAttachment at = null;
			
			if(multi.getOriginalFileName("upfile") != null) {
				 at = new BoardAttachment();
				 at.setOriginName(multi.getOriginalFileName("upfile"));
				 at.setChangeName(multi.getFilesystemName("upfile"));
				 at.setFilePath("resources/board/");
			 }
			
			int result = new BoardService().insertBoard(b, userNo, at);
			
			if (result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath() + "/boardDetail.bo?cNo=" + cNo);
			} else {
				
				if(at != null) {
					 new File(savePath+at.getChangeName()).delete();
				 }
				
				request.getSession().setAttribute("alertMsg", "게시글 작성 실패");
				response.sendRedirect(request.getContextPath() + "/boardDetail.bo?cNo=" + cNo);
			}
		}else {
			request.setAttribute("errorMsg", "전송방법이 잘못되었습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
