package com.khtime.dday.model.service;
import java.sql.Connection;
import java.sql.Date;

import com.khtime.common.JDBCTemplate;
import com.khtime.dday.model.dao.DdayDao;
import com.khtime.dday.model.vo.Dday;

public class DdayService {
	
	public boolean insertDday(int userNo, String title, Date dDay) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		boolean result = new DdayDao().insertDday(conn, userNo,title,dDay);
		
		if(result) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result;
		
	}
	
	

}
