package com.khtime.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.service.ScrapService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class ContentScrapController
 */
@WebServlet("/ContentScrapController")
public class ContentScrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentScrapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.valueOf(request.getParameter("bNo"));
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		int result = new ScrapService().scrapContent(bNo, userId);
		
		if(result > 0) { //성공
			new BoardService().updateScrap(bNo);
		}else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
