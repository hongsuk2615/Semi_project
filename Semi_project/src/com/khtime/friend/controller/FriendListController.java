package com.khtime.friend.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.friend.model.service.FriendService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class FreindListController
 */
@WebServlet("/friend.me")
public class FriendListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ArrayList<Member> list = new FriendService().list(list);
//		request.setAttribute("friendList", list);
		request.getRequestDispatcher("views/friend/friendList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String loginUserId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		// 2. DB에 현재 전달된 데이터가 존재하는지 확인
		System.out.println("=======");
		System.out.println(userId);
		System.out.println(loginUserId);
		System.out.println("=======");
		boolean  isId = new  FriendService().isId(loginUserId,userId); 
		// 3. 중복된 아이디가 존재하는 케이스. 않는 케이스별로 데이터 전달
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		gson.toJson(isId,response.getWriter());
	}

}
