package com.khtime.message.model.dao;

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

import com.khtime.board.model.vo.Reply;
import com.khtime.common.JDBCTemplate;
import com.khtime.member.model.vo.Member;
import com.khtime.message.model.vo.Message;

public class MessageDao {
	private Properties prop = new Properties();

	public MessageDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(MessageDao.class.getResource("/sql/message/message-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int sendMessage(Connection conn, int sender, int receiver, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sendMessage");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sender);
			pstmt.setInt(2, receiver);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> selectMessage(Connection conn, int userNo) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMessage");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Member m = new Member();
				m.setNickName(rset.getString("NICK_NAME"));
				m.setUserNo(rset.getInt("USER_NO"));
				list.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<ArrayList<String>> getContents(Connection conn, int userNo, int opponentNo) {
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getContents");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, opponentNo);
			pstmt.setInt(3, userNo);
			pstmt.setInt(4, opponentNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ArrayList<String> list = new ArrayList<String>();
				if (rset.getInt("SENDER") == userNo) {
					list.add("send");
				} else {
					list.add("recieve");
				}
				list.add(rset.getString("CONTENT"));
				list.add(rset.getString("SEND_DATE"));
				result.add(list);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int sendMsgBoard(Connection conn, int uNo, int bNo, String content) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sendMsgBoard");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNo);
			pstmt.setInt(2, bNo);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int messagePlus(Connection conn, int loginUserNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("messagePlus");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUserNo);
		
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int messageCheck(Connection conn, int loginUserNo , int sendUser) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("messageCheck");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUserNo);
			pstmt.setInt(2, sendUser);
		
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
}

