package com.khtime.dday.controller;

import static com.khtime.common.StringToDate.transformDate;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.dday.model.service.DdayService;
import com.khtime.dday.model.vo.Dday;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class ddayInsertController
 */
@WebServlet("/ddayInsert.bo")
public class ddayInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ddayInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		Date dDay = transformDate(request.getParameter("dDay"));
		String title = request.getParameter("title");
		
		boolean result = new DdayService().insertDday(userNo,title,dDay);
		
		
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
