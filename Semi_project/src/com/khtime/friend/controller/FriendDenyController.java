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
 * Servlet implementation class FriendDenyController
 */
@WebServlet("/frienddeny.me")
public class FriendDenyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendDenyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int senderUserNo = Integer.parseInt(request.getParameter("senderUserNo"));
		int result = new FriendService().friendDeny(loginUserNo,senderUserNo);
		String msg = "";
		if(result > 0) {
			msg = "친구목록에서 삭제되었습니다.";
		}else {
			msg = "친구요청 거절에 실패하였습니다.";
		}
		request.getSession().setAttribute("alertMsg", msg);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
