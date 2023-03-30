package com.khtime.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.ReplyService;

/**
 * Servlet implementation class ReplyDeleteController
 */
@WebServlet("/delete.re")
public class ReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int rNo = Integer.valueOf(request.getParameter("rNo"));
		int bNo = Integer.valueOf(request.getParameter("bNo"));
		int result = new ReplyService().deleteReply(rNo, bNo);
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "삭제성공");
		}else {
			request.getSession().setAttribute("alertMsg", "삭제실패");
		}
		response.sendRedirect(request.getContextPath()+"/contentDetail.bo?bNo="+bNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
