package com.khtime.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.member.model.vo.Member;
import com.khtime.message.model.service.MessageService;


/**
 * Servlet implementation class messageController
 */
@WebServlet("/msgbox.me")
public class SelectMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMessageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		
		ArrayList<Member> list = new MessageService().selectMessage(userNo);
		HashMap<Integer,ArrayList<ArrayList<String>>> contents = new HashMap<Integer, ArrayList<ArrayList<String>>>();
		for(Member m : list) {
			contents.put(m.getUserNo(), new MessageService().getContents(userNo, m.getUserNo()));
		}
		System.out.println(contents);
		request.setAttribute("contents", contents);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/messagebox.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

}
