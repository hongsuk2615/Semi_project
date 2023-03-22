package com.khtime.member.model.dao;

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


import com.khtime.common.JDBCTemplate;
import com.khtime.member.model.vo.Member;
import com.khtime.member.model.vo.UserProFileImg;
import com.khtime.member.model.dao.MemberDao;

public class MemberDao {

		private Properties prop = new Properties();

		public MemberDao() {

			String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();

			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (InvalidPropertiesFormatException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

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
				pstmt.setString(5, m.getEmail());
			

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
		
		public int insertUserProFileImgMember(Connection conn , ArrayList<UserProFileImg> list) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertUserProFileImgMember");
			try {
				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, list.getBoardTitle());
//				pstmt.setString(2, list.getBoardContent());
//				pstmt.setInt(3, Integer.parseInt(list.getBoardWriter()));
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}


}
