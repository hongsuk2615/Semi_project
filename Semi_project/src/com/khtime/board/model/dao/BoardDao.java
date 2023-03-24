package com.khtime.board.model.dao;

import static com.khtime.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class BoardDao {
	
	private Properties prop = new Properties();
	   
	   
	   public BoardDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   
	   public int selectListCount(Connection conn) {
		      
		      int listCount = 0;
		      
		      PreparedStatement pstmt = null;
		      
		      ResultSet rset = null;
		      
		      String sql = prop.getProperty("selectListCount");
		      
		      try {
		         pstmt = conn.prepareStatement(sql);
		         rset = pstmt.executeQuery();
		         
		         if(rset.next()) {
		            listCount = rset.getInt("COUNT");
		         }
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      return listCount;
		   }
	   
	   
	   
	   
}
