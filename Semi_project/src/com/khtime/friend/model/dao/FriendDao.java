package com.khtime.friend.model.dao;

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

public class FriendDao {
	private Properties prop = new Properties();

	public FriendDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(FriendDao.class.getResource("/sql/friend/friend-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public boolean friendId(Connection conn, String loginUserId, String userId) {
		boolean result = false;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("friendId");
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

	public int friendReq(Connection conn, String friendId, int loginUserNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("friendReq");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, loginUserNo);
			pstmt.setString(2, friendId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> friendlist(Connection conn, int loginUserNo) {
		Member m = null;
		ArrayList<Member> list = new ArrayList<>();

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("friendlist");

		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, loginUserNo);
			pstmt.setInt(2, loginUserNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				m = new Member();

				m.setUserName(rset.getString("USER_NAME"));

				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Member> friendlist2(Connection conn, int loginUserNo) {
		Member m = null;
		ArrayList<Member> list2 = new ArrayList<>();

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("friendlist2");

		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, loginUserNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				m = new Member();

				m.setUserName(rset.getString("USER_NAME"));

				list2.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list2;
	}

	public ArrayList<Member> friendlist3(Connection conn, int loginUserNo) {
		Member m = null;
		ArrayList<Member> list3 = new ArrayList<>();

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("friendlist3");

		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, loginUserNo);
			
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				m = new Member();

				m.setUserName(rset.getString("USER_NAME"));
				m.setUserNo(rset.getInt("USER_NO"));
				list3.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list3;
	}
	public int friendaccept(Connection conn,int loginUserNo,int senderUserNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("friendaccept");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, loginUserNo);
			pstmt.setInt(2, senderUserNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int friendDeny(Connection conn,int loginUserNo,int senderUserNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("friendDeny");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, loginUserNo);
			pstmt.setInt(2, senderUserNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
