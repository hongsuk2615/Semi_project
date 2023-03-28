package com.khtime.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.ReplyService;
import com.khtime.board.model.vo.Reply;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class ReplyInsertController
 */
@WebServlet("/rInsert.bo")
public class ReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int userNo =  ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		String isAnonimous = request.getParameter("isAnonimous");
	
		Reply r = new Reply();
		r.setContent(content);
		r.setReplyNo(bNo);
		r.setWriter(userNo+"");
		r.setIsAnonimous(isAnonimous);
		
		int result = new ReplyService().insertReply(r);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
