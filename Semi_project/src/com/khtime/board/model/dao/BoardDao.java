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
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.board.model.vo.Board;
import com.khtime.board.model.vo.BoardAttachment;
import com.khtime.category.vo.Category;
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
	   
	   public ArrayList<Board> getHotBestBoardlist(Connection conn, int recommendCount, String year){
		   ArrayList<Board> list = new ArrayList<Board>();
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   String sql = prop.getProperty("getHotBestBoardlist");
		   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recommendCount);
			pstmt.setString(2, year);
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
	   
	   public ArrayList<BoardAttachment> selectAttachmentList(Connection conn, int bNo) {
		    
		   ArrayList <BoardAttachment> attachmentList= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectAttachmentList");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					BoardAttachment at = new BoardAttachment(
								rset.getInt("FILE_NO"),
								rset.getInt("REF_BNO"),
								rset.getString("ORIGIN_NAME"),
								rset.getString("CHANGE_NAME"),
								rset.getString("FILE_PATH"),
								rset.getDate("UPLOAD_DATE"),
								rset.getInt("FILE_LEVEL"),
								rset.getString("STATUS")
							);
					
					attachmentList.add(at);
				}		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return attachmentList;
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
							rset.getInt("CATEGORY_NO"),
							rset.getString("WRITER"),
							rset.getString("IS_QUESTION"),
							rset.getString("IS_ANONIMOUS"),
							rset.getInt("REPORT_COUNT"),
							rset.getInt("RECOMMEND_COUNT"),
							rset.getInt("SCRAP_COUNT"),
							rset.getDate("ENROLL_DATE"),
							rset.getString("STATUS"),
							rset.getInt("REPLY_COUNT"),
							rset.getString("USERPROFILE")
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
	   public int selectReplyCount(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectReplyCount");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
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
	   
	   
	   public int insertBoard(Connection conn, Board b, int userNo ) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertBoard");
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getContent());
				pstmt.setInt(3, b.getCategoryNo());
				pstmt.setInt(4, userNo);
				pstmt.setString(5, b.getIsQuestion());
				pstmt.setString(6, b.getIsAnonimous());
				
				
				result = pstmt.executeUpdate();
				System.out.println("boardresult:"+result);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int insertAttachment(Connection conn, ArrayList<BoardAttachment> list) {
		   
			int result = 1;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertAttachment");
			System.out.println(list);
			try {
				pstmt = conn.prepareStatement(sql);
				for(BoardAttachment at : list) {
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result *= pstmt.executeUpdate();
				}
				System.out.println("attresult:"+result);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   
	   
	   
	   public ArrayList<Board> bestList(Connection conn, int rcCount, PageInfo pi, String year) {
		    
		   ArrayList <Board> bestList= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("bestList");

			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setInt(1, rcCount);
				pstmt.setString(2, year);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
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
					
					bestList.add(b);
				}		
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return bestList;
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
	   
	   
	   public int deleteContent(Connection conn, int bNo, int userNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteContent");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				pstmt.setInt(2, userNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int deleteAttachment(Connection conn, int bNo) {
		   
			int result = 1;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteAttachment");

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
	   
	   public int recommendCountUp(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("recommendCountUp");

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
	   
	
	   
	   public int scrapCountUp(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("scrapCountUp");

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
	   
	   public int replyCountUp(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("replyCountUp");
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
	   
	   public int replyCountDown(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("replyCountDown");
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
	   
	   public ArrayList<Category> categoryTitle(Connection conn, String searchTitle){
		   Category c = null;
		   
		   ArrayList<Category> cn = new ArrayList<>();
		   
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("categoryTitle");
			System.out.println(searchTitle);
			
			ResultSet rset = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+searchTitle+"%");
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					c =new Category();
		
					c.setCategoryName(rset.getString("CATEGORY_NAME"));
					c.setCategoryNo(rset.getInt("CATEGORY_NO"));
			
					cn.add(c);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return cn;
	   }
	   
	   public int boardRequest(Connection conn,String loginUserId,String boardTitle, String reason) {
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("boardRequest");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, boardTitle);
				pstmt.setString(2, loginUserId);
				pstmt.setString(3, reason);
						
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
	   }
	   
	   public int boardCategoryreq(Connection conn,String boardTitle, int loginUserNo) {
		  
		    int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("boardCategoryreq");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, boardTitle);
				pstmt.setInt(2, loginUserNo);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
	   }
	   
	   
	   
	   
	   
	   
}
