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
 * Servlet implementation class MemberUpdateEmailController
 */
@WebServlet("/updateEmail.me")
public class MemberUpdateEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateEmailController() {
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
		String updateEmail = request.getParameter("updateEmail");
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userPwd = request.getParameter("userPwd");
		
		int checkpwd = new MemberService().checkPwd(userId, userPwd);
		
		if(checkpwd > 0) {
			Member m = new MemberService().updateEmail(updateEmail,userId, userPwd);
			HttpSession session = request.getSession();
			System.out.println("멤버:" + m);
			if(m != null) {
				session.setAttribute("alertMsg", "성공적으로 이메일이 변경되었습니다.");
				session.setAttribute("loginUser", m);
			}else {
				session.setAttribute("alertMsg", "이메일 변경실패");
			}
		}
		else {			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "가입한 비밀번호와 일치하지않습니다.");
		}

		response.sendRedirect(request.getContextPath() + "/myPage.me");
	}

}
