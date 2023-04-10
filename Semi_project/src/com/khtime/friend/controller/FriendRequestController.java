package com.khtime.friend.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.friend.model.service.FriendService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class FriendRequestController
 */
@WebServlet("/friendReq.do")
public class FriendRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendRequestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	    String friendId =request.getParameter("userId");
	    
		
		int result = new FriendService().friendReq(friendId,loginUserNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "친구요청을 보냈습니다.");
			response.sendRedirect(request.getContextPath());	
		} else {
			request.getSession().setAttribute("alertMsg", "친구요청을 보내지 못했습니다.");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String loginUserId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		// 2. DB에 현재 전달된 데이터가 존재하는지 확인
		boolean  isId = new  FriendService().friendId(loginUserId,userId);  // 입력한 아이디가 로그인한 아이디가 아니고 존재하는 아이디인지 판별
		// 3. 중복된 아이디가 존재하는 케이스. 않는 케이스별로 데이터 전달
		boolean isFriend = new FriendService().isFriend(loginUserId,userId);
		boolean result = isId&&!isFriend;
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		gson.toJson(result,response.getWriter());
	}

}
