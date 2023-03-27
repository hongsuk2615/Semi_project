package com.khtime.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.board.model.service.BoardService;
import com.khtime.board.model.service.CategoryService;
import com.khtime.board.model.service.ReplyService;
import com.khtime.board.model.vo.Board;
import com.khtime.board.model.vo.Reply;

/**
 * Servlet implementation class ContentDetailController
 */
@WebServlet("/contentDetail.bo")
public class ContentDetailController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int bNo = Integer.valueOf(request.getParameter("bNo"));
      
      Board b = new BoardService().selectContent(bNo);
      ArrayList<Reply> replyList = new ReplyService().selectReply(bNo);
      String cName = new CategoryService().getCategoryName(b.getCategoryNo());
      
      
      request.setAttribute("replyList", replyList);
      request.setAttribute("b", b);
      request.setAttribute("cName", cName);
      request.getRequestDispatcher("views/board/contentDetail.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}