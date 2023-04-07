package com.khtime.board.model.service;

import java.sql.Connection;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.board.model.dao.ReplyDao;
import com.khtime.board.model.dao.ReportDao;
import com.khtime.common.JDBCTemplate;

public class ReportService {

	public int reportReply(int rNo, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReportDao().reportReply(conn, rNo, userNo);
		if(result > 0) {
			result = new ReplyDao().reportCountUp(conn, rNo, userNo);
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
	
		public int reportContent(int bNo, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReportDao().reportContent(conn, bNo, userNo);
		if(result > 0) {
			result = new BoardDao().reportCountUp(conn, bNo, userNo);
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
}
