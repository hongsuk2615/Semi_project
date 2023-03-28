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
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
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
		
			String updatePwd = request.getParameter("updatePwd");
			String userPwd =request.getParameter("userPwd");
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			Member m = new MemberService().updatePwd(updatePwd,userPwd,userId);
			
			HttpSession session = request.getSession();
			
			if(m == null) {
				session.setAttribute("alertMsg", "가입한 비밀번호와 일치하지않습니다.");		
			}else {			
				session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
				session.setAttribute("loginUser", m);
			}
			response.sendRedirect(request.getContextPath() + "/myPage.me");
	}

}
