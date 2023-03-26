package com.khtime.member.model.dao;

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

import com.khtime.common.JDBCTemplate;
import com.khtime.member.model.vo.Member;
import com.khtime.member.model.vo.UserProFileImg;

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
								rset.getInt("RECOMMEND_COUNT"),
								rset.getString("IS_BANNED"),
								rset.getString("IS_WHITELIST"), 
								rset.getString("STATUS")
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
	   
		public int insertMember(Connection conn, Member m) {
			int result = 0; // 처리된 행의 개수
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertMember");
			try {
				pstmt = conn.prepareStatement(sql);	
				pstmt.setString(1, m.getUserId());
				pstmt.setString(2, m.getUserPwd());
				pstmt.setString(3, m.getUserClass());
				pstmt.setString(4, m.getUserName());
				pstmt.setString(5, m.getNickName());
				pstmt.setString(6, m.getEmail());
				pstmt.setInt(7, m.getAuthority());
			

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
		
		public boolean isId(Connection conn,String userId) {
			boolean result = false;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("isId");
			ResultSet rset = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rset = pstmt.executeQuery();
				result = rset.next();
				System.out.println(result);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}
		
		public int insertUserProFileImg(Connection conn , int userNo, UserProFileImg upf) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertUserProFileImg");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setString(2,upf.getOriginName() );
				pstmt.setString(3, upf.getChangeName());
				pstmt.setString(4, upf.getFilePath());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		public int selectMember(Connection conn, String userId) {
			int userNo = 0;
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					userNo = rset.getInt("USER_NO");
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return userNo;
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
