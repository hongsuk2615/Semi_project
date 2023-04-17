package com.khtime.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {			
			for(Cookie cookie : cookies) {
				request.setAttribute(cookie.getName(), cookie.getValue());
			}
		}
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
		String keepId = request.getParameter("keepId"); // 로그인유지 유무 Y or N
		String cookieId = request.getParameter("userId"); // userId 쿠키
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		int result = (loginUser == null) ? 0 : loginUser.getStatus().equals("N") ? 4 : loginUser.getAvailable().equals("N") ? 3 : 
			loginUser.getIsBanned().equals("Y") ? 2 : 1;

		
		// 1: 로그인 성공
		// 2: 밴인 유저
		// 3: 승인되지 않은 유저
		// 4: 탈퇴한 유저
		// 0: 아이디, 비번 틀림
		
		// 로그인 & 화이트리스트
		if (result == 1) {
			request.getSession().setAttribute("loginUser", loginUser);
			if(keepId.equals("Y")) {
				Cookie c = new Cookie("userId", loginUser.getUserId());
				 response.addCookie(c);
			}else{
				if(cookieId != null){
					Cookie c = new Cookie("userId","");
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
				
			}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	}

}
