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
@WebServlet("/scrap.bo")
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
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int result = new ScrapService().scrapContent(bNo, userNo);
		
		if(result > 0) { //성공
			new BoardService().scrapCountUp(bNo);
			request.getSession().setAttribute("alertMsg", "스크랩완료");
		}else {
			request.getSession().setAttribute("alertMsg", "이미 스크랩된 글입니다.");
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
