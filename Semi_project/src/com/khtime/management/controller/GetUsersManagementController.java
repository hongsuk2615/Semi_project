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
 * Servlet implementation class GetUsersManagementController
 */
@WebServlet("/manageUsers.get")
public class GetUsersManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUsersManagementController() {
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
		String isWhitelist = request.getParameter("isWhitelist");
		String isBanned = request.getParameter("isBanned");
		int reported = Integer.parseInt(request.getParameter("reported"));
		int authority = Integer.parseInt(request.getParameter("authority"));
		String searchName = request.getParameter("searchName");
		Member m = new Member();
		m.setIsWhitelist(isWhitelist);
		m.setIsBanned(isBanned);
		m.setReportCount(reported);
		m.setAuthority(authority);
		m.setUserName(searchName);
		ArrayList<Member> list = new ManagementService().getFilteredUsers(m);
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		Member user = new ManagementService().getUser(userId);
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(user,response.getWriter());
	}

}
