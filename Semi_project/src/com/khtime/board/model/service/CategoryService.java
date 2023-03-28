package com.khtime.board.model.service;

import java.sql.Connection;

import com.khtime.board.model.dao.CategoryDao;
import com.khtime.common.JDBCTemplate;

public class CategoryService {


	public String getCategoryName(int cNo) {
		Connection conn = JDBCTemplate.getConnection();

		String cName = new CategoryDao().getCategoryName(conn, cNo);

		JDBCTemplate.close(conn);

		return cName;
	}
}
