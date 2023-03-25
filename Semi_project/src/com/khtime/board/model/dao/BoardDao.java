package com.khtime.board.model.dao;

import static com.khtime.common.JDBCTemplate.close;

import java.io.FileInputStream;

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
	   
	   
	   public int selectListCount(Connection conn) {
		      
		      int listCount = 0;
		      
		      PreparedStatement pstmt = null;
		      
		      ResultSet rset = null;
		      
		      String sql = prop.getProperty("selectListCount");
		      /*
		       * SELECT COUNT(*) AS COUNT
		       * FROM BOARD
		       * WHERE STATUS = 'Y'
		       *   AND BOARD_TYPE = 1
		       * 
		       */
		      
		      try {
		         pstmt = conn.prepareStatement(sql);
		         rset = pstmt.executeQuery();
		         
		         if(rset.next()) {
		            listCount = rset.getInt("COUNT");
		         }
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      return listCount;
		   }
	   
	   
	   
	   
	   
	   
	   
	   public ArrayList<Board> selectList(Connection conn, int cNo, String cName, PageInfo pi) {
		    
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
								rset.getInt("WRITER"),
								rset.getString("IS_QUESTION"),
								rset.getString("IS_ANONIMOUS"),
								rset.getInt("RECOMMEND_COUNT"),
								rset.getDate(" R.ENROLL_DATE")								
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
	   
	   
	   public Board selectBoard(Connection conn, int bNo) {
		   
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
							rset.getString("TITLE"),
							rset.getString("CONTENT"),
							rset.getInt("WRITER"),
							rset.getString("IS_QUESTION"),
							rset.getString("IS_ANONIMOUS"),
							rset.getInt("RECOMMEND_COUNT"),
							rset.getInt("SCRAP_COUNT"),
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
	   
	   
	   
	   
	   
}
