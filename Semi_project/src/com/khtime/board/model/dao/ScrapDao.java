package com.khtime.board.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.common.JDBCTemplate;

public class ScrapDao {
		
	private Properties prop = new Properties();
	   
	   
	   public ScrapDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/scrap-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public int scrapContent(Connection conn, int bNo, String userId) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("scrapContent");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				pstmt.setString(2, userId);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
}
