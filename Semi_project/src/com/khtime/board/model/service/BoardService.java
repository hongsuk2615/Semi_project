package com.khtime.board.model.service;

import static com.khtime.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.vo.Board;
import com.khtime.common.JDBCTemplate;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.board.model.dao.BoardDao;

public class BoardService {
	
	public int selectListCount(int cNo) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().boardListCount(conn, cNo);

		JDBCTemplate.close(conn);

		return result;
	}
	
	
	public ArrayList<Board> selectList(int cNo, String cName, PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Board> boardList = new BoardDao().selectList(conn, cNo, cName, pi);

		JDBCTemplate.close(conn);

		return boardList;
	}

	
	
	public Board selectBoard(int bNo) {
		Connection conn = JDBCTemplate.getConnection();

		Board b = new BoardDao().selectBoard(conn, bNo);

		JDBCTemplate.close(conn);

		return b;
	}

}
