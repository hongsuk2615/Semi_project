package com.khtime.dday.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
	   
	   
	   public boolean insertDday(Connection conn,  int userNo,  String title, Date dDay) {
		   
		   boolean result = false;
		   PreparedStatement pstmt = null;
		   String sql = prop.getProperty("insertDday");
		   try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,userNo);
				pstmt.setDate(2,dDay);
				pstmt.setString(3, title);
				
				result = pstmt.executeUpdate() > 0? true : false;

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
	   
	   
	   }
	   
}
