package com.khtime.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.CategoryDao;
import com.khtime.board.model.vo.Category;
import com.khtime.member.model.dao.MemberDao;

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
	
	public int deleteRequestBoard(String categoryName){
		Connection conn = getConnection();
	      
	      int result = new CategoryDao().deleteRequestBoard(conn, categoryName);
	      
	      if(result > 0) {
	         commit(conn);
	      }else {
	         rollback(conn);
	      }
	     close(conn);
	      return result;
	   }
	
	public ArrayList<Category> selectCagtegory(){
		
		Connection conn = getConnection();
		
		 ArrayList<Category> list = new CategoryDao().selectCagtegory(conn);
		 
		 close(conn); 
		 
		 return list;
	}
}
