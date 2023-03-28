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
			prop.loadFromXML(
					new FileInputStream(MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath()));
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

			if (rset.next()) {
				m = new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
						rset.getString("USER_CLASS"), rset.getString("USER_NAME"), rset.getString("NICK_NAME"),
						rset.getString("EMAIL"), rset.getDate("ENROLL_DATE"), rset.getInt("AUTHORITY"),
						rset.getInt("REPORT_COUNT"), rset.getString("IS_BANNED"), rset.getString("IS_WHITELIST"));
				System.out.println(m);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
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
				e.printStackTrace();
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
		String userId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchId");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				userId = rset.getString("USER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return userId;
	}

	public boolean memberCheck(Connection conn, String userId, String userEmail) {
		boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memberCheck");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setString(2, userEmail);

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
	public boolean updatePwd(Connection conn, String userId, String newPwd) {
		boolean result = false;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);

			if(pstmt.executeUpdate() > 0) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
