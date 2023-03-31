package com.khtime.todolist.model.dao;

import static com.khtime.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.todolist.model.vo.Todolist;

public class TodolistDao {
	private Properties prop = new Properties();

	public TodolistDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(TodolistDao.class.getResource("/sql/todolist/todolist-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public boolean addToDoList(Connection conn, int userNo, String content, int priority) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addToDoList");
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, content);
			pstmt.setInt(3, priority);
			result = pstmt.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Todolist> getTodolist(Connection conn,int userNo){
		ArrayList<Todolist> list = new ArrayList<Todolist>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getToDoList");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Todolist tdl = new Todolist();
				tdl.setToDoListNo(rset.getInt("TO_DO_LIST_NO"));
				tdl.setPriority(rset.getInt("PRIORITY"));
				tdl.setContent(rset.getString("CONTENT"));
				list.add(tdl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
}
