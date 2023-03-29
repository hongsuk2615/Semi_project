package com.khtime.board.model.service;

import java.sql.Connection;

import com.khtime.board.model.dao.RecommendDao;
import com.khtime.common.JDBCTemplate;

public class RecommendService {
	
	public int recommendContent(int bNo, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new RecommendDao().recommendContent(conn, bNo, userNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}