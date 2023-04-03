package com.khtime.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.service.CategoryService;
import com.khtime.board.model.vo.Board;
import com.khtime.board.model.vo.BoardAttachment;
import com.khtime.member.model.vo.Member;

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
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isQuestion = request.getParameter("isQuestion") == null ? "N" : "Y";
		String isAnonimous = request.getParameter("isAnonimous")  == null ? "N" : "Y";;
		
		Board b = new Board();
		b.setWriter(String.valueOf(userNo));
		b.setBoardNo(bNo);
		b.setCategoryNo(cNo);
		b.setTitle(title);
		b.setContent(content);
		b.setIsQuestion(isQuestion);
		b.setIsAnonimous(isAnonimous);
		
		int result = new BoardService().updateBoard(b);
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "게시글 수정 성공");
			response.sendRedirect(request.getContextPath());
		}else {
			request.getSession().setAttribute("alertMsg", "게시글 수정 실패");
			response.sendRedirect(request.getContextPath());
		}
	}

}
