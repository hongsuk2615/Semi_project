package com.khtime.dday.model.dao;

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
import com.khtime.dday.model.vo.Dday;

public class DdayDao {
	private Properties prop = new Properties();
	   
	   
	   public DdayDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( DdayDao.class.getResource("/sql/dday/dday-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   
	   public int insertDday(Connection conn, Dday d, int userNo) {
		   
		   int result = 0;
		   PreparedStatement pstmt = null;
		   String sql = prop.getProperty("insertDday");
		   try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,userNo);
				pstmt.setDate(2, d.getdDay());
				pstmt.setString(3, d.getTitle());
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
	   
	   
	   }
	   
}
