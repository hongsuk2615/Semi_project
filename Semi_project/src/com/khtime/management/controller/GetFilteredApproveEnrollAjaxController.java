package com.khtime.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.management.model.service.ManagementService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class GetFilteredApproveEnrollAjaxController
 */
@WebServlet("/filteredApproveEnroll.get")
public class GetFilteredApproveEnrollAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFilteredApproveEnrollAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage; 
		int boardLimit; 
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		boardLimit = 10;
		PageInfo pi = new PageInfo(currentPage, boardLimit);
		String name = request.getParameter("userName");
		ArrayList<Member> list = new ManagementService().getFilteredEnrollmentReqs(name, pi);
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
