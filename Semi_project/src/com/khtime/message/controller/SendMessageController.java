package com.khtime.message.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;
import com.khtime.member.model.vo.Member;
import com.khtime.message.model.service.MessageService;
import com.khtime.message.model.vo.Message;

/**
 * Servlet implementation class SendMessageController
 */
@WebServlet("/sendMsg.me")
public class SendMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String content = request.getParameter("content");
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		System.out.println(userNo);
		int receiver = Integer.parseInt(request.getParameter("opponentNo"));
	
		
		int result = new MessageService().sendMessage(userNo,receiver,content);
		
		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "쪽지보내기 성공");
			response.sendRedirect(request.getContextPath() + "/msgbox.me" );
		} else {
			request.getSession().setAttribute("alertMsg", "실패");
			response.sendRedirect(request.getContextPath() + "/msgbox.me" );		
			}
	}

		
}
