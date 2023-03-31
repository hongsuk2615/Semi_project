package com.khtime.dday.model.service;
import java.sql.Connection;

import com.khtime.common.JDBCTemplate;
import com.khtime.dday.model.vo.Dday;

public class DdayService {
	
	public int insertDday(Dday d , int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new DdayDao().insertDday(conn, d, userNo);
		
		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result;
		
	}
	
	

}
