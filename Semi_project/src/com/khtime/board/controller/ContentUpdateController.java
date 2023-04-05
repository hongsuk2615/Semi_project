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
import com.khtime.board.model.service.CategoryService;
import com.khtime.board.model.vo.Board;
import com.khtime.board.model.vo.BoardAttachment;
import com.khtime.common.model.MyFileRenamePolicy;
import com.khtime.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ContentUpdateController
 */
@WebServlet("/update.bo")
public class ContentUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		Board b = new BoardService().selectContent(bNo);
		ArrayList <BoardAttachment> attachmentList = new BoardService().selectAttachmentList(bNo);
		String cName = new CategoryService().getCategoryName(cNo);
		
		request.setAttribute("cName", cName);
		request.setAttribute("b", b);
		request.setAttribute("attachmentList", attachmentList);
		
		request.getRequestDispatcher("views/board/contentUpdate.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		int result = -1;
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board/");
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
			int bNo = Integer.parseInt(multi.getParameter("bNo"));
			int cNo = Integer.parseInt(multi.getParameter("cNo"));
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String isQuestion = multi.getParameter("isQuestion") == null ? "N" : "Y";
			String isAnonimous = multi.getParameter("isAnonimous") == null ? "N" : "Y";
			String deleteImg = multi.getParameter("deleteImg");
		
			Board b = new Board();
			b.setWriter(String.valueOf(userNo));
			b.setBoardNo(bNo);
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
				list.add(at);
				
			}
			
			result = new BoardService().updateContent(b, list, deleteImg);
			response.setContentType("text/html; charset=UTF-8");
			
			if (result <= 0 && at != null) {
				new File(savePath+at.getChangeName()).delete();
			} 
				
		} 
		response.getWriter().print(result);
	
	}

}
