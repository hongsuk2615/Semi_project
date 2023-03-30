package com.khtime.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.board.model.dao.SearchDao;
import com.khtime.board.model.vo.Board;
import com.khtime.common.JDBCTemplate;
import com.khtime.common.model.vo.PageInfo;



public class SearchService {
	
	public ArrayList<Board> searchList(PageInfo pi, String keyword) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Board> searchList = new SearchDao().searchList(conn,  pi, keyword);

		JDBCTemplate.close(conn);

		return searchList;
	}

	public int boardListCount(int cNo) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().boardListCount(conn, cNo);

		JDBCTemplate.close(conn);

		return result;
	}
	
	public Board selectContent(int bNo) {
		Connection conn = JDBCTemplate.getConnection();

		Board b = new BoardDao().selectContent(conn, bNo);

		JDBCTemplate.close(conn);

		return b;
	}

	
	
	public int keywordListCount(String keyword) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new SearchDao().keywordListCount(conn, keyword);

		JDBCTemplate.close(conn);

		return result;
	}

}
