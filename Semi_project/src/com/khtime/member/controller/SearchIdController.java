package com.khtime.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.member.model.service.MemberService;

/**
 * Servlet implementation class SearchIdController
 */
@WebServlet("/searchId.me")
public class SearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/member/searchIdForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("login-name");
		String userEmail = request.getParameter("login-email");
	
		String userId = new MemberService().searchId(userName, userEmail);
		
		/*if(!userId.equals("")) { // 아이디찾기 성공
*/			request.setAttribute("userId", userId);
			request.getRequestDispatcher("views/member/searchIdViewForm.jsp").forward(request, response);
		/*}else {  // 아이디찾기 실패
*/			
		
		//}
	}

}
