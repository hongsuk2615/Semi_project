package com.khtime.friend.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.common.JDBCTemplate;



public class FriendDao {
	private Properties prop = new Properties();
	   
	   
	   public FriendDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( FriendDao.class.getResource("/sql/friend/friend-mapper.xml").getPath()));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
		public boolean isId(Connection conn, String loginUserId ,String userId) {
			boolean result= false;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("isId");
			ResultSet rset = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setString(2, loginUserId);
				rset = pstmt.executeQuery();
				result = rset.next();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}
		
	
}
