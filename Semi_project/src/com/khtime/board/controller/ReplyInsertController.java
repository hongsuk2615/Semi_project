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
@WebServlet("/insert.re")
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
		int userNo =  ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		String content = request.getParameter("content");
		System.out.println("content: "+content);
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String isAnonimous = request.getParameter("isAnonimous")=="Y" ? "Y":"N";
		
		Reply r = new Reply();
		r.setContent(content);
		r.setBoardNo(bNo);
		r.setIsAnonimous(isAnonimous);
		
		int result = new ReplyService().insertReply(r, userNo, bNo);
		
		response.setContentType("text/html charset=UTF-8");
		
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
