package com.khtime.management.model.dao;

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

import com.khtime.board.model.vo.Board;
import com.khtime.member.model.vo.Member;

public class ManagementDao {
	private Properties prop = new Properties();

	public ManagementDao() {
		try {
			prop.loadFromXML(new FileInputStream(
					ManagementDao.class.getResource("/sql/management/management-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Member> getReportedUsers(Connection conn) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getReportedUsers");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member reportedUser = new Member();
				reportedUser.setUserNo(rset.getInt("USER_NO"));
				reportedUser.setUserId(rset.getString("USER_ID"));
				reportedUser.setUserClass(rset.getString("USER_CLASS"));
				reportedUser.setUserName(rset.getString("USER_NAME"));
				reportedUser.setNickName(rset.getString("NICK_NAME"));
				reportedUser.setAuthority(rset.getInt("AUTHORITY"));
				reportedUser.setReportCount(rset.getInt("REPORT_COUNT"));
				reportedUser.setIsWhitelist(rset.getString("IS_WHITELIST"));
				list.add(reportedUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	public ArrayList<Board> getReportedBoards(Connection conn) {
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getReportedBoards");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board reportedBoard = new Board();
				reportedBoard.setBoardNo(rset.getInt("BOARD_NO"));
				reportedBoard.setTitle(rset.getString("TITLE"));
				reportedBoard.setCategoryNo(rset.getInt("CATEGORY_NO"));
				reportedBoard.setWriter(rset.getInt("WRITER"));
				reportedBoard.setRecommendCount(rset.getInt("RECOMMEND_COUNT"));
				reportedBoard.setScrapCount(rset.getInt("SCRAP_COUNT"));
				reportedBoard.setReportCount(rset.getInt("REPORT_COUNT"));
				
				list.add(reportedBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

}
