package com.khtime.board.model.service;

import static com.khtime.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.vo.Board;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.board.model.dao.BoardDao;

public class BoardService {
	
	public int selectListCount() {
	      Connection conn = getConnection();
	      
	      int listCount = new BoardDao().selectListCount(conn);
	      
	      close(conn);
	      
	      return listCount;
	   }
	
	
	public ArrayList<Board> selectList(PageInfo pi) {
	      
	      Connection conn = getConnection();
	      
	      ArrayList<Board> list = new BoardDao().selectList(conn, pi);
	      
	      close(conn);
	      
	      return list;
	   }

}
