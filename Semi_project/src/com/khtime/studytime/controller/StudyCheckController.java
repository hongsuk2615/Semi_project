package com.khtime.studytime.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.member.model.vo.Member;
import com.khtime.studytime.model.service.StudyTimeService;
import com.khtime.studytime.model.vo.StudyTime;
import static com.khtime.common.StringToDate.transformDate;

/**
 * Servlet implementation class StudyCheckController
 */
@WebServlet("/study.me")
public class StudyCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int timeAmount = new StudyTimeService().sumStudy(userNo);
		ArrayList<StudyTime> sumList = new StudyTimeService().rankingStudy();
		
		
		
		ArrayList<StudyTime> list = new StudyTimeService().getStudy(userNo);
		
		
		
		
		
		
		request.setAttribute("timeAmount", timeAmount);
		request.setAttribute("list", list);
		request.setAttribute("sumList", sumList);
		
		
		
		request.getRequestDispatcher("views/member/studyCheck.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
