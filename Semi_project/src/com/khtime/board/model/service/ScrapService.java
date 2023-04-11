package com.khtime.board.model.service;

import java.sql.Connection;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.board.model.dao.ScrapDao;
import com.khtime.common.JDBCTemplate;

public class ScrapService {
	
	public int scrapContent(int bNo, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ScrapDao().scrapContent(conn, bNo, userNo); // 중복체크 -1
		if(result > 0) {
			result = new BoardDao().scrapCountUp(conn, bNo, userNo); // 본인인지 체크 0
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
	
	public int scrapDelete(int bNo, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ScrapDao().scrapDelete(conn, bNo, userNo);
		if(result > 0) {
			result = new BoardDao().scrapCountDown(conn, bNo, userNo);
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
