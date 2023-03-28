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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("views/member/loginForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("login-id");
		String userPwd = request.getParameter("login-pwd");
		System.out.println(userId);
		System.out.println(userPwd);
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		if(loginUser == null) {
			
			
			System.out.println("로그인실패");
			response.sendRedirect(request.getContextPath());

		}else {
			request.getSession().setAttribute("loginUser", loginUser);
			System.out.println("로그인완료");
			response.sendRedirect(request.getContextPath());
		}
		
		
	}

}
