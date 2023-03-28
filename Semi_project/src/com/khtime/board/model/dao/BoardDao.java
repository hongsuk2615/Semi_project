package com.khtime.board.model.dao;
import static com.khtime.common.JDBCTemplate.*;
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
import com.khtime.common.JDBCTemplate;

import com.khtime.common.model.vo.PageInfo;



public class BoardDao {
	
	private Properties prop = new Properties();
	   
	   
	   public BoardDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public ArrayList<Board> getHotBestBoardlist(Connection conn, int recommendCount){
		   ArrayList<Board> list = new ArrayList<Board>();
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   String sql = prop.getProperty("getHotBestBoardlist");
		   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recommendCount);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
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
	   public ArrayList<Board> selectBoard(Connection conn, int cNo, PageInfo pi) {
		    
		   ArrayList <Board> boardList= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectBoard");

			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setInt(1, cNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Board b = new Board(
								rset.getInt("BOARD_NO"),
								rset.getString("TITLE"),
								rset.getString("CONTENT"),
								rset.getInt("CATEGORY_NO"),
								rset.getString("WRITER"),
								rset.getString("IS_QUESTION"),
								rset.getString("IS_ANONIMOUS"),
								rset.getInt("RECOMMEND_COUNT"),
								rset.getDate("ENROLL_DATE"),
								rset.getInt("REPLY_COUNT")
							);
					
					boardList.add(b);
				}		
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return boardList;
		}
	   
	   public int boardListCount(Connection conn, int cNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("boardListCount");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cNo);
				rset = pstmt.executeQuery();

				if(rset.next()) {
					result = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   
	   public Board selectContent(Connection conn, int bNo) {
		   
			Board b = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectContent");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bNo);
				rset = pstmt.executeQuery();

				if(rset.next()) {
					b = new Board(
							rset.getInt("BOARD_NO"),
							rset.getString("TITLE"),
							rset.getString("CONTENT"),
							rset.getString("WRITER"),
							rset.getString("IS_QUESTION"),
							rset.getString("IS_ANONIMOUS"),
							rset.getInt("RECOMMEND_COUNT"),
							rset.getInt("SCRAP_COUNT"),
							rset.getInt("REPLY_COUNT"),
							rset.getInt("CATEGORY_NO"),
							rset.getDate("ENROLL_DATE")
							);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return b;
		}
	   
	   public int insertBoard(Connection conn, Board b) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertBoard");
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getContent());
				pstmt.setInt(3, b.getCategoryNo());
				System.out.println(b.getWriter());
				pstmt.setString(4, b.getWriter());
				pstmt.setString(5, b.getIsQuestion());
				pstmt.setString(6, b.getIsAnonimous());
				
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   
	   
	   
	   public ArrayList<Board> bestList(Connection conn, int rcCount, PageInfo pi) {
		    
		   ArrayList <Board> boardList= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("bestList");

			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setInt(1, rcCount);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Board b = new Board(
								rset.getInt("BOARD_NO"),
								rset.getString("TITLE"),
								rset.getString("CONTENT"),
								rset.getInt("CATEGORY_NO"),
								rset.getString("WRITER"),
								rset.getString("IS_QUESTION"),
								rset.getString("IS_ANONIMOUS"),
								rset.getInt("RECOMMEND_COUNT"),
								rset.getDate("ENROLL_DATE"),
								rset.getInt("REPLY_COUNT")
							);
					
					boardList.add(b);
				}		
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return boardList;
		}
	   
	   public int bestListCount(Connection conn, int rcCount) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("bestListCount");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rcCount);
				rset = pstmt.executeQuery();

				if(rset.next()) {
					result = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   
	   public int deleteContent(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteContent");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int updateBoard(Connection conn, Board b) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updateBoard");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getContent());
				pstmt.setInt(3, b.getCategoryNo());
				pstmt.setString(4, b.getIsQuestion());
				pstmt.setString(5, b.getIsAnonimous());
				
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int updateRecommend(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updateRecommend");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int updateScrap(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updateScrap");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
}
