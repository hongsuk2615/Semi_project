package com.khtime.board.model.dao;

import static com.khtime.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;


import com.khtime.board.model.vo.Reply;
import com.khtime.common.JDBCTemplate;

public class ReplyDao {
	private Properties prop = new Properties();
	   
	   
	   public ReplyDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/reply-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   

		public int insertReply(Connection conn, Reply r, int userNo) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertReply");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, r.getBoardNo());
				pstmt.setInt(2, userNo);
				pstmt.setString(3, r.getContent());
				pstmt.setString(4, r.getIsAnonimous());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public ArrayList<Reply> selectReplyList(Connection conn, int boardNo){
			ArrayList<Reply> list = new ArrayList<>();
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectReplyList");
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Reply r = new Reply(
							rset.getInt("REPLY_NO"),
							rset.getInt("BOARD_NO"),
							rset.getString("WRITER"),
							rset.getString("CONTENT"),
							rset.getInt("RECOMMEND_COUNT"),
							rset.getInt("REPORT_COUNT"),
							rset.getDate("ENROLL_DATE"),
							rset.getString("IS_ANONIMOUS"),
							rset.getInt("P_REPLY_NO"),
							rset.getString("USERPROFILE")
							);
					list.add(r);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
		public int deleteReply(Connection conn, int rNo, int userNo) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteReply");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, rNo);
				pstmt.setInt(2, userNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		   public int recommendCountUp(Connection conn, int rNo, int userNo) {
			   
				int result = 0;
				PreparedStatement pstmt = null;
				
				String sql = prop.getProperty("recommendCountUp");

				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, rNo);
					pstmt.setInt(2, userNo);
					pstmt.setInt(3, rNo);
					
					result = pstmt.executeUpdate();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
				
					JDBCTemplate.close(pstmt);
				}
				return result;
			}
		   
		   public ArrayList<String> anonimousCount(Connection conn, int bNo) {
			   
			   ArrayList<String> result = new ArrayList<>();
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				String sql = prop.getProperty("anonimousCount");

				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, bNo);
					
					rset = pstmt.executeQuery();
					while(rset.next()) {
					result.add(rset.getString("WRITER"));
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
				
					JDBCTemplate.close(pstmt);
				}
				return result;
			}
		
}
