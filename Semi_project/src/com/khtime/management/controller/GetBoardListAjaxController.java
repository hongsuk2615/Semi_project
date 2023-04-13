package com.khtime.management.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.khtime.board.model.vo.Board;
import com.khtime.management.model.service.ManagementService;

/**
 * Servlet implementation class GetBoardListAjaxController
 */
@WebServlet("/boardlist.get")
public class GetBoardListAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBoardListAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cName = request.getParameter("cName");
		int cNo = new ManagementService().getCnoFromName(cName);
		ArrayList<Board> list = new ManagementService().getBoardList(cName);
		HashMap<Integer, ArrayList<Board>> map = new HashMap<Integer, ArrayList<Board>>();
		map.put(cNo, list);
		response.setContentType("application/json; charset = UTF-8");
		Gson gson = new Gson();
		gson.toJson(map,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
