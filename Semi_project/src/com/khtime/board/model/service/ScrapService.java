package com.khtime.board.model.service;

import java.sql.Connection;

import com.khtime.board.model.dao.ScrapDao;
import com.khtime.common.JDBCTemplate;

public class ScrapService {
	
	public int scrapContent(int bNo, String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ScrapDao().scrapContent(conn, bNo, userId);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
