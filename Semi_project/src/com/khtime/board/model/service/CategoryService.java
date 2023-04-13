package com.khtime.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.CategoryDao;
import com.khtime.board.model.vo.Category;
import com.khtime.common.JDBCTemplate;

public class CategoryService {


	public String getCategoryName(int cNo) {
		Connection conn = JDBCTemplate.getConnection();

		String cName = new CategoryDao().getCategoryName(conn, cNo);

		JDBCTemplate.close(conn);

		return cName;
	}
	public ArrayList<Category> selectCagtegory(){
		
		Connection conn = JDBCTemplate.getConnection();
		
		 ArrayList<Category> list = new CategoryDao().selectCagtegory(conn);
		 
		 JDBCTemplate.close(conn);
		 
		 return list;
	}
}
