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
import java.util.HashMap;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.board.model.vo.Board;
import com.khtime.common.model.vo.PageInfo;
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
				reportedUser.setRecommendCount(rset.getInt("RECOMMEND_COUNT"));
				reportedUser.setReportCount(rset.getInt("REPORT_COUNT"));
				reportedUser.setIsWhitelist(rset.getString("IS_WHITELIST"));
				System.out.println("리폿유저:" + reportedUser);
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
				reportedBoard.setWriter(rset.getString("USER_NAME"));
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
	
	public ArrayList<Member> getEnrollmentReqs(Connection conn) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getEnrollmentReqs");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member reqUser = new Member();
				reqUser.setUserNo(rset.getInt("USER_NO"));
				reqUser.setUserId(rset.getString("USER_ID"));
				reqUser.setUserName(rset.getString("USER_NAME"));
				reqUser.setAuthority(rset.getInt("AUTHORITY"));
				list.add(reqUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	public ArrayList<Board> getBoardList(Connection conn, String cName){
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getBoards");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cName);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setTitle(rset.getString("TITLE"));
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	public ArrayList<HashMap<String,Member>> getBoardMakeReq(Connection conn){
		ArrayList<HashMap<String,Member>> list = new ArrayList<HashMap<String,Member>>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getBoardMakeReq");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				HashMap<String,Member> req = new HashMap<String, Member>();
				Member m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				m.setAuthority(rset.getInt("AUTHORITY"));
				req.put(rset.getString("CATEGORY_NAME"), m);
				list.add(req);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
		
	}
	
	public Member getNoneApprovedUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getNoneApprovedUser");
		ResultSet rset = null;
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setNickName(rset.getString("NICK_NAME"));
				m.setUserClass(rset.getString("USER_CLASS"));
				m.setAuthority(rset.getInt("AUTHORITY"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	public HashMap<String, Member> getBoardMakeReq(Connection conn, String categoryName){
		HashMap<String, Member> map = new HashMap<String, Member>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getBoardMakeReqDetail");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				Member m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setUserClass(rset.getString("USER_CLASS"));
				m.setAuthority(rset.getInt("AUTHORITY"));
				String reason = rset.getString("REASON");
				map.put(reason,m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return map;
	}
	
	public Member getReportedUser(Connection conn, String reportedUserId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getReportedUser");
		ResultSet rset = null;
		Member reportedUser = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reportedUserId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				reportedUser = new Member();
				reportedUser.setUserId(rset.getString("USER_ID"));
				reportedUser.setUserName(rset.getString("USER_NAME"));
				reportedUser.setNickName(rset.getString("NICK_NAME"));
				reportedUser.setUserClass(rset.getString("USER_CLASS"));
				reportedUser.setEmail(rset.getString("EMAIL"));
				reportedUser.setIsWhitelist(rset.getString("IS_WHITELIST"));
				reportedUser.setRecommendCount(rset.getInt("RECOMMEND_COUNT"));
				reportedUser.setReportCount(rset.getInt("REPORT_COUNT"));
				reportedUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reportedUser;
	}
	
	public int approveEnroll(Connection conn, String userId) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("approveEnroll");		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;	
		
	}
	
	
	public int denyEnroll(Connection conn, String userId) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("denyEnroll");		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;	
		
	}
	
	public int banUser(Connection conn, String userId, String isBanned) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("banUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isBanned);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int whitelistUser(Connection conn, String userId, String isWhitelist) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("whitelistUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isWhitelist);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int approveMakeBoard(Connection conn,String cName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("approveMakeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cName);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int denyMakeBoard(Connection conn,String cName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("denyMakeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cName);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Member> getFilteredUsers(Connection conn, Member m){
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getFilteredUsers");
		ResultSet rset = null;
		System.out.println("%"+m.getIsWhitelist()+"%");
		System.out.println(m);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+m.getIsWhitelist()+"%");
			pstmt.setString(2, "%"+m.getIsBanned()+"%");
			pstmt.setInt(3, m.getAuthority());
			pstmt.setString(4, "%"+m.getUserName()+"%");
			pstmt.setInt(5, m.getReportCount());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member filteredUser = new Member();
				filteredUser.setUserId(rset.getString("USER_ID"));
				filteredUser.setUserName(rset.getString("USER_NAME"));
				filteredUser.setNickName(rset.getString("NICK_NAME"));
				filteredUser.setUserClass(rset.getString("USER_CLASS"));
				filteredUser.setEmail(rset.getString("EMAIL"));
				filteredUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				filteredUser.setIsWhitelist(rset.getString("IS_WHITELIST"));
				filteredUser.setIsBanned(rset.getString("IS_BANNED"));
				filteredUser.setRecommendCount(rset.getInt("RECOMMEND_COUNT"));
				filteredUser.setReportCount(rset.getInt("REPORT_COUNT"));
				filteredUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				list.add(filteredUser);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Member getUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getUser");
		ResultSet rset = null;
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setNickName(rset.getString("NICK_NAME"));
				m.setUserClass(rset.getString("USER_CLASS"));
				m.setEmail(rset.getString("EMAIL"));
				m.setIsWhitelist(rset.getString("IS_WHITELIST"));
				m.setIsBanned(rset.getString("IS_BANNED"));
				m.setRecommendCount(rset.getInt("RECOMMEND_COUNT"));
				m.setReportCount(rset.getInt("REPORT_COUNT"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	public ArrayList<HashMap<String,Member>> getBoardFilteredReq(Connection conn, String categoryName) {
		ArrayList<HashMap<String,Member>> list = new ArrayList<HashMap<String,Member>>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getBoardFilteredReq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+categoryName+"%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HashMap<String,Member> req = new HashMap<String, Member>();
				Member m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				m.setAuthority(rset.getInt("AUTHORITY"));
				req.put(rset.getString("CATEGORY_NAME"), m);
				list.add(req);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Board> getFilteredReportedBoards(Connection conn, String keyword){
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getFilteredReportedBoards");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board reportedBoard = new Board();
				reportedBoard.setBoardNo(rset.getInt("BOARD_NO"));
				reportedBoard.setTitle(rset.getString("TITLE"));
				reportedBoard.setCategoryNo(rset.getInt("CATEGORY_NO"));
				reportedBoard.setWriter(rset.getString("USER_NAME"));
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
	
	public ArrayList<Member> getFilteredEnrollmentReqs(Connection conn, String name, PageInfo pi){
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getFilteredEnrollmentReqs");
		ResultSet rset = null;
		try {
			int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member reqUser = new Member();
				reqUser.setUserNo(rset.getInt("USER_NO"));
				reqUser.setUserId(rset.getString("USER_ID"));
				reqUser.setUserName(rset.getString("USER_NAME"));
				reqUser.setAuthority(rset.getInt("AUTHORITY"));
				list.add(reqUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
		
	}
	
	public int approveBoardReq(Connection conn, String cName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("approveBoardReq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cName);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
