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
		String userNickName = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
		String userPwd = ((Member)request.getSession().getAttribute("loginUser")).getUserPwd();

		Member m = new MemberService().updateNickName(updateNickName,userId, userPwd);
		
		HttpSession session = request.getSession();
		
		if(m != null) {
			session.setAttribute("alertMsg", "닉네임변경 성공");
			session.setAttribute("loginUser", m); 
					
		}else {		
			session.setAttribute("alertMsg", "닉네임변경 실패");
			
			
		}
		response.sendRedirect(request.getContextPath() + "/myPage.me");
	}

}
