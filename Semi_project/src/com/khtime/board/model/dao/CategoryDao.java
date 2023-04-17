package com.khtime.board.model.dao;

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

import com.khtime.board.model.vo.Category;
import static com.khtime.common.JDBCTemplate.*;
import com.khtime.member.model.vo.Member;

public class CategoryDao {
	
	private Properties prop = new Properties();
	   
	   
	   public CategoryDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/category-mapper.xml").getPath()));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public String getCategoryName(Connection conn, int cNo) {
		   
			String cName = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getCategoryName");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cNo);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					cName = rset.getString("CATEGORY_NAME");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return cName;
		}
	   
	   public ArrayList<Category> selectRequestBoard(Connection conn, int loginUserNo){
		   ArrayList<Category> list = new ArrayList<Category>();
		   
		   PreparedStatement pstmt = null;
		   
		   ResultSet rset = null;
		   
		   String sql = prop.getProperty("selectRequestBoard");
		   
		   try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, loginUserNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Category c = new Category();
				c.setCategoryName(rset.getString("CATEGORY_NAME"));
				c.setAvailable(rset.getString("AVAILABLE"));
				list.add(c);
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
	   
	   public int deleteRequestBoard(Connection conn, String categoryName){
		   int result= 0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("deleteRequestBoard");
		   
		   try {
			   pstmt = conn.prepareStatement(sql);
		         
		       pstmt.setString(1, categoryName);
		        
		       result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}
		   return result;
	   }
		public ArrayList<Category> selectCagtegory(Connection conn) {
			Category c = null;
			ArrayList<Category> list = new ArrayList<>();

			PreparedStatement pstmt = null;

			String sql = prop.getProperty("selectCagtegory");

			ResultSet rset = null;

			try {
				pstmt = conn.prepareStatement(sql);


				rset = pstmt.executeQuery();

				while (rset.next()) {
					c = new Category();
					c.setCategoryNo(rset.getInt("CATEGORY_NO"));
					c.setCategoryName(rset.getString("CATEGORY_NAME"));
					list.add(c);
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
