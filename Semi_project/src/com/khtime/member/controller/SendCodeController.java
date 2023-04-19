package com.khtime.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.common.CommonMethod;

/**
 * Servlet implementation class SendCodeController
 */
@WebServlet("/SendCode.do")
public class SendCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendCodeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail =request.getParameter("email");
		int random = (int) (Math.random() * 5 + 7);
		String code = CommonMethod.getRamdomPassword(random);
		CommonMethod.sendNewCode(userEmail, code);
		int result = 0;
		
		response.setContentType("text/html charset=UTF-8");
	    response.getWriter().print(code);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}

}
