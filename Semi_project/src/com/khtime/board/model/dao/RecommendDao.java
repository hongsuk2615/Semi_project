package com.khtime.board.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.board.model.vo.Board;
import com.khtime.common.JDBCTemplate;

public class RecommendDao {
	
	private Properties prop = new Properties();
	   
	   
	   public RecommendDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/recommend-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public int recommendContent(Connection conn, int bNo, int userNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("recommendContent");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, bNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int recommendReply(Connection conn, int rNo, int userNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("recommendReply");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, rNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   

}
