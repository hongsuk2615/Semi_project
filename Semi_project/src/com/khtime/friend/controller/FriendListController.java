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
		
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		ArrayList<Member> list = new FriendService().friendlist(loginUserNo);
		request.setAttribute("list", list);//친구목록
		ArrayList<Member> list2 = new FriendService().friendlist2(loginUserNo);
		request.setAttribute("list2", list2);//친구 요청 목록
		ArrayList<Member> list3 = new FriendService().friendlist3(loginUserNo);
		request.setAttribute("list3", list3);//친구 요청 받은 목록
		request.getRequestDispatcher("views/friend/friendList.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int sendName = Integer.parseInt(request.getSession().getAttribute("sendName"));
		int result = new FriendService().friendaccept(loginUserNo,sendName);
				
}
