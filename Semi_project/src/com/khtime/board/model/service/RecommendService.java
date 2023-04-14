package com.khtime.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.board.model.dao.RecommendDao;
import com.khtime.board.model.dao.ReplyDao;
import com.khtime.common.JDBCTemplate;

public class RecommendService {
	
	public int recommendContent(int bNo, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new RecommendDao().recommendContent(conn, bNo, userNo);
		if(result > 0) {
			result = new BoardDao().recommendCountUp(conn, bNo, userNo); 
		}else {
			result--;
		}
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int recommendReply(int rNo, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new RecommendDao().recommendReply(conn, rNo, userNo);
		if(result > 0) {
			result = new ReplyDao().recommendCountUp(conn, rNo, userNo);
		}else {
			result --;
		}
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public ArrayList<Integer> recommendCheck(int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Integer> result = new RecommendDao().recommendCheck(conn, userNo);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int recommendCheck(int userNo, int bNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new RecommendDao().recommendCheck(conn, userNo, bNo);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public ArrayList<Integer> replyRecommendCheck(int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Integer> result = new RecommendDao().replyRecommendCheck(conn, userNo);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
