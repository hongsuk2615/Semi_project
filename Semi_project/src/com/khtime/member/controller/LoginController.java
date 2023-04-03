package com.khtime.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.member.model.service.MemberService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public LoginController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("views/member/loginForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("loginId");
		String userPwd = request.getParameter("loginPwd");
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		int result = (loginUser == null) ? -1 : loginUser.getAvailable().equals("N") ? 0 : 1;
		if (result == 1) request.getSession().setAttribute("loginUser", loginUser);
			
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	}

}
