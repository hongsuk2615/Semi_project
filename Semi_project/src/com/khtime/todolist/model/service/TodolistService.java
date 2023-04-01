package com.khtime.todolist.model.service;

import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.commit;
import static com.khtime.common.JDBCTemplate.getConnection;
import static com.khtime.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.todolist.model.dao.TodolistDao;
import com.khtime.todolist.model.vo.Todolist;

public class TodolistService {
	public boolean addToDoList(int userNo, String content, int priority) {
		Connection conn = getConnection();
		boolean result = new TodolistDao().addToDoList(conn, userNo, content, priority);
		if (result) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public ArrayList<Todolist> getTodolist(int userNo){
		Connection conn = getConnection();
		ArrayList<Todolist> list = new TodolistDao().getTodolist(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	public boolean deleteToDoList(int tdlNo, int userNo) {
		Connection conn = getConnection();
		boolean result = new TodolistDao().deleteToDoList(conn, tdlNo, userNo);
		close(conn);
		return result;
	}
	public boolean changePriority(int priority, int tdlNo , int userNo) {
		Connection conn = getConnection();
		boolean result = new TodolistDao().changePriority(conn, priority, tdlNo, userNo);
		close(conn);
		return result;
	}
}
