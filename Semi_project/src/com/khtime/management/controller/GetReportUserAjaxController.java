package com.khtime.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.management.model.service.ManagementService;
import com.khtime.member.model.vo.Member;

/**
 * Servlet implementation class GetReportUserAjaxController
 */
@WebServlet("/manageReportUser.get")
public class GetReportUserAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReportUserAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> list = new ManagementService().getReportedUsers();
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reportedUserId = request.getParameter("reportedUser");
		Member reportedUser = new ManagementService().getReportedUser(reportedUserId);
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(reportedUser,response.getWriter());
	}

}
