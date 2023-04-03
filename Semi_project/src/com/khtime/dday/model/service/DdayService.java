package com.khtime.dday.model.service;
import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.khtime.common.JDBCTemplate;
import com.khtime.dday.model.dao.DdayDao;
import com.khtime.dday.model.vo.Dday;
import com.khtime.todolist.model.dao.TodolistDao;
import com.khtime.todolist.model.vo.Todolist;

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
	
	
	public ArrayList<Dday> getDday(int userNo){
		Connection conn = getConnection();
		ArrayList<Dday> list = new DdayDao().getDday(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	public boolean updateDday(int dDayNo, Date dDay, String title) {
		Connection conn = getConnection();
		boolean result = new DdayDao().updateDday(conn, dDayNo, dDay, title );
		close(conn);
		return result;
	}
	
	
	
	

}
