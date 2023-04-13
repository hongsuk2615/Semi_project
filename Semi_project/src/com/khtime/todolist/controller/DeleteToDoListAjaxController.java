package com.khtime.todolist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.member.model.vo.Member;
import com.khtime.todolist.model.service.TodolistService;

/**
 * Servlet implementation class DeleteToDoListAjaxController
 */
@WebServlet("/deleteToDoList.me")
public class DeleteToDoListAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteToDoListAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tdlNo = Integer.parseInt(request.getParameter("toDoListNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		boolean result = new TodolistService().deleteToDoList(tdlNo,userNo);
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(result,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
