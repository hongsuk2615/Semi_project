package com.khtime.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.board.model.service.BoardService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class BoarRequestController
 */
@WebServlet("/boardreq.me")
public class BoarRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoarRequestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/board/boardRequest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loginUserNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String loginUserId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String boardTitle = request.getParameter("boardtitle");
		String reason = request.getParameter("reason");
		
		int result  = new BoardService().boardRequest(loginUserId,boardTitle,reason, loginUserNo);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		gson.toJson(result,response.getWriter());
	}

}
