package com.khtime.member.model.dao;

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
import com.khtime.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	   
	   
	   public MemberDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public Member loginMember(Connection conn, String userId, String userPwd) {
		   Member m = null;
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   String sql = prop.getProperty("loginMember");
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
								rset.getInt("USER_NO"),
								rset.getString("USER_ID"),
								rset.getString("USER_PWD"),
								rset.getString("USER_CLASS"),
								rset.getString("USER_NAME"),
								rset.getString("NICK_NAME"),
								rset.getString("EMAIL"),
								rset.getDate("ENROLL_DATE"),
								rset.getInt("AUTHORITY"),
								rset.getInt("REPORT_COUNT"),
								rset.getString("IS_BANNED"),
								rset.getString("IS_WHITELIST")
						);
				System.out.println(m);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		} return m;
	   }
	   
	   public String searchId(Connection conn, String userName, String userEmail) {
		   String userId = "";
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   String sql = prop.getProperty("searchId");
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString("USER_ID");			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		} return userId;
	   }
	   
	 
}
