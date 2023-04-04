package com.khtime.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.member.model.vo.Member;
import com.khtime.message.model.service.MessageService;

/**
 * Servlet implementation class messageController
 */
@WebServlet("/msgbox.me")
public class MessageBoxOpenController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageBoxOpenController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();

		
		ArrayList<Member> list = new MessageService().selectMessage(userNo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/messagebox.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "메세지 불러들이기 성공");
			
		} else {
			request.getSession().setAttribute("alertMsg", "실패");
			response.sendRedirect(request.getContextPath() + "/msgbox.me" );		
			}
	}
}


