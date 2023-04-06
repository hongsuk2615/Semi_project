package com.khtime.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.board.model.service.ReplyService;
import com.khtime.board.model.vo.Reply;

/**
 * Servlet implementation class ReplySelectController
 */
@WebServlet("/select.re")
public class ReplySelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplySelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		
		ArrayList<Reply> replyList = new ReplyService().selectReplyList(bNo);
		ArrayList<String> writer = new ReplyService().anonimousCount(bNo);
		System.out.println(writer);
		System.out.println(writer.size());
		HashMap<String, Integer> anonimous = new HashMap<>();
		
		for(int i = 1; i < writer.size()+1; i++) {
			anonimous.put(writer.get(i-1), i);
		}
		
		ArrayList<Object> list = new ArrayList<>();
		list.add(replyList);
		list.add(anonimous);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list , response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
