package com.khtime.dday.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.vo.Board;
import com.khtime.dday.model.service.DdayService;

/**
 * Servlet implementation class ddayController
 */
@WebServlet("/ddayController")
public class ddayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ddayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dDayNo = Integer.parseInt(request.getParameter("dDayNo"));
		String dDay = request.getParameter("dDay");
		String mainDDay = request.getParameter("mainDDay");
		String userId = request.getParameter("userId");
		
		
		
		ArrayList<Board> dDayList = new DdayService().dDaytList(dDayNo, dDay, mainDDay, userId);
	      
	      
	      
	    request.setAttribute("dDay",dDay);
	    request.setAttribute("dDayNo", dDayNo);
	    request.setAttribute("mainDDay", mainDDay);
	    request.setAttribute("userId", userId);
	    
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
