package com.khtime.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.member.model.vo.Member;
import com.khtime.message.model.service.MessageService;

/**
 * Servlet implementation class BoardSendMessageAjaxController
 */
@WebServlet("/sendMsgBoard.do")
public class BoardSendMessageAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSendMessageAjaxController() {
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
		int uNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int bNo = Integer.parseInt(request.getParameter("boardNo"));
		String content = request.getParameter("content");
		int result = new MessageService().sendMsgBoard(uNo,bNo, content);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "쪽지전송완료");
			response.sendRedirect(request.getContextPath()+"/msgbox.me");
		}else {
			request.getSession().setAttribute("alertMsg", "쪽지전송실패");
			response.sendRedirect(request.getContextPath()+"/contentDetail.bo?bNo"+bNo);
		}
	}

}
