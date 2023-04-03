package com.khtime.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

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
public class ContentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContentInsertController() {
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
		
		int result = -1;
		
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
			ArrayList<BoardAttachment> list = new ArrayList<>();
			Enumeration e = multi.getFileNames();
			
			while(e.hasMoreElements()) {
				at = new BoardAttachment();
				String fileName = (String) e.nextElement();
				at.setOriginName(multi.getOriginalFileName(fileName));
				at.setChangeName(multi.getFilesystemName(fileName));
				at.setFilePath("/resources/board/");
				at.setFileLevel(Integer.valueOf(fileName.substring(fileName.length()-1, fileName.length())));
				list.add(at);
			}
			result = new BoardService().insertBoard(b, userNo, list);
			response.setContentType("text/html; charset=UTF-8");
			
			if (result <= 0 && at != null) {
				new File(savePath+at.getChangeName()).delete();
			} 
				
		} 
	
		response.getWriter().print(result);
	}
	
	
}
