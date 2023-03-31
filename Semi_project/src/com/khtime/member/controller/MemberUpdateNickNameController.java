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
 * Servlet implementation class MemberUpdateNickNameController
 */
@WebServlet("/updateNickName.me")
public class MemberUpdateNickNameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateNickNameController() {
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
		
		String updateNickName = request.getParameter("updateNickName");
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userPwd =request.getParameter("userPwd");

		int checkNickName = new MemberService().checkNickName(userId, updateNickName);
	
		if(checkNickName == 0) {
			Member m = new MemberService().updateNickName(updateNickName,userId,userPwd);
			
			HttpSession session = request.getSession();

			System.out.println("멤버:" + m);
			if(m != null) {
				session.setAttribute("alertMsg", "닉네임이 변경되었습니다.");
				session.setAttribute("loginUser", m);
			}else {
				session.setAttribute("alertMsg", "이메일 변경실패");
			
			}
		}
		else {			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "누군가 사용하고있는 닉네임입니다.");
		}

		response.sendRedirect(request.getContextPath() + "/myPage.me");
	}

}
