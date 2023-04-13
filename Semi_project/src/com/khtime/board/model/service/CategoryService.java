package com.khtime.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.CategoryDao;
import com.khtime.board.model.vo.Category;
import static com.khtime.common.JDBCTemplate.*;

public class CategoryService {


	public String getCategoryName(int cNo) {
		Connection conn = getConnection();

		String cName = new CategoryDao().getCategoryName(conn, cNo);

		close(conn);

		return cName;
	}
	
	public ArrayList<Category> selectRequestBoard(int loginUserNo){
		Connection conn = getConnection();
		
		ArrayList<Category> list = new CategoryDao().selectRequestBoard(conn,loginUserNo);
		
		close(conn);
		
		return list;
		
	}
}
