package com.khtime.board.model.service;
import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.commit;
import static com.khtime.common.JDBCTemplate.getConnection;
import static com.khtime.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.board.model.vo.Board;
import com.khtime.common.JDBCTemplate;
import com.khtime.common.model.vo.PageInfo;



public class BoardService {
	
	public ArrayList<Board> selectBoard(int cNo, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Board> boardList = new BoardDao().selectBoard(conn, cNo, pi);

		close(conn);

		return boardList;
	}

	public int boardListCount(int cNo) {
		Connection conn = getConnection();

		int result = new BoardDao().boardListCount(conn, cNo);

		close(conn);

		return result;
	}
	
	public Board selectContent(int bNo) {
		Connection conn = getConnection();

		Board b = new BoardDao().selectContent(conn, bNo);

		close(conn);

		return b;
	}

	
	public ArrayList<Board> bestList(int rcCount, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Board> bestList = new BoardDao().bestList(conn, rcCount, pi);

		close(conn);

		return bestList;
	}

	public int bestListCount(int rcCount) {
		Connection conn = getConnection();

		int result = new BoardDao().bestListCount(conn, rcCount);

		close(conn);

		return result;
	}
	public ArrayList<Board> getHotBestBoardlist(int recommendCount) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().getHotBestBoardlist(conn, recommendCount);
		close(conn);
		return list;
	}
	public int insertBoard(Board b) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().insertBoard(conn, b);

		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result;
	}
	
	public int deleteContent(int bNo) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().deleteContent(conn, bNo);

		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result;
	}
	
	public int updateBoard(Board b) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().updateBoard(conn, b);

		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result;
	}
	
	public int updateRecommend(int bNo) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().updateRecommend(conn, bNo);

		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result;
	}
	
	public int updateScrap(int bNo) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().updateScrap(conn, bNo);

		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result;
	}
	

}
