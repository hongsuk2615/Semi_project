package com.khtime.studytime.model.service;

import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.commit;
import static com.khtime.common.JDBCTemplate.getConnection;
import static com.khtime.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.khtime.dday.model.dao.DdayDao;
import com.khtime.studytime.model.dao.StudyTimeDao;
import com.khtime.studytime.model.vo.StudyTime;

public class StudyTimeService {
	
	
	
	public int sumStudy(int userNo) {
		Connection conn = getConnection();
		
		
		int result = new StudyTimeDao().sumStudy(conn, userNo);

		close(conn);

		return result;
		
		
	}
	
	
	public ArrayList<StudyTime> rankingStudy() {
	      Connection conn = getConnection();
	      
	      
	      ArrayList<StudyTime> sumList = new StudyTimeDao().rankingStudy(conn);

	      close(conn);

	      return sumList;
	      
	      
	   }
	
	
	
	
	public ArrayList<StudyTime> getStudy(int userNo){
		Connection conn = getConnection();
		ArrayList<StudyTime> list = new StudyTimeDao().getStudy(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	
	
	
	public boolean insertStudy(int userNo, int timeAmount, int targetTime) {
		
		Connection conn = getConnection();
		
		boolean result = new StudyTimeDao().insertStudy(conn, userNo,timeAmount,targetTime);
		
		if(result) {
			commit(conn);
		}else {
			rollback(conn);
		} 
		close(conn);

		return result;
		
	}

}
