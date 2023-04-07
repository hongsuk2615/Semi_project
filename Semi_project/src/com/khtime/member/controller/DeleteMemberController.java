package com.khtime.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khtime.member.model.service.MemberService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberController
 */
@WebServlet("/deleteMember.me")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		int result =  new MemberService().deleteMember(userId);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "탈퇴 성공. 그 동안 이용해주셔서 감사합니다.");
		}
		else {			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "탈퇴 실패.");
		}

		response.sendRedirect(request.getContextPath() + "/logout.me");
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
