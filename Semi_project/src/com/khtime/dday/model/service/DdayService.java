package com.khtime.dday.model.service;
import static com.khtime.common.JDBCTemplate.*;


import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;


import com.khtime.dday.model.dao.DdayDao;
import com.khtime.dday.model.vo.Dday;
import com.khtime.todolist.model.dao.TodolistDao;
import com.khtime.todolist.model.vo.Todolist;

public class DdayService {
	
	public boolean insertDday(int userNo, String title, Date dDay) {
		
		Connection conn = getConnection();
		
		boolean result = new DdayDao().insertDday(conn, userNo,title,dDay);
		
		if(result) {
			commit(conn);
		}else {
			rollback(conn);
		} 
		close(conn);

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
		if(result) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public boolean deleteDday(int dDayNo) {
		Connection conn = getConnection();
		boolean result = new DdayDao().deleteDday(conn,dDayNo);
		close(conn);
		return result;
	}
	
	
	

}
