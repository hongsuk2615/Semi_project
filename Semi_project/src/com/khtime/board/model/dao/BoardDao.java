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
import com.khtime.board.model.vo.Category;
import com.khtime.common.CommonMethod;
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
								rset.getInt("REPLY_COUNT"),
								rset.getString("ENROLL_DATE")
							);
					b.setUserProfile(rset.getString("USERPROFILE"));
					b.setScrapCount(rset.getInt("SCRAP_COUNT"));
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
					b.setStringDate(rset.getString("STRING_DATE"));
					b.setUserNo(rset.getInt("USER_NO"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return b;
		}
	   public int replyCount(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCount");
			sql = sql.replace("$", "REPLY_COUNT");

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
	   
	   public int recommendCount(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCount");
			sql = sql.replace("$", "RECOMMEND_COUNT");
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
	   
	   public int scrapCount(Connection conn, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCount");
			sql = sql.replace("$", "SCRAP_COUNT");
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
			sql = sql.replace("$","SEQ_BONO.NEXTVAL");
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getContent());
				pstmt.setInt(3, b.getCategoryNo());
				pstmt.setInt(4, userNo);
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
	   
	   
	   public int insertAttachment(Connection conn, ArrayList<BoardAttachment> list) {
		   
			int result = 1;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertAttachment");
			sql = sql.replace("$","SEQ_BONO.CURRVAL");
			sql = sql.replace("^","?");
			try {
				pstmt = conn.prepareStatement(sql);
				for(BoardAttachment at : list) {
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result *= pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int insertAttachment(Connection conn, ArrayList<BoardAttachment> list, Board b) {
		   
			int result = 1;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertAttachment");
			String nextFileLevel = prop.getProperty("nextFileLevel");
			
			sql = sql.replace("$", "?");
			sql = sql.replace("^", nextFileLevel);
			try {
				pstmt = conn.prepareStatement(sql);
				for(BoardAttachment at : list) {
				pstmt.setInt(1, b.getBoardNo());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());
				pstmt.setInt(5, b.getBoardNo());
				
				result *= pstmt.executeUpdate();
				}
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
	   
	   
	   public int deleteContent(Connection conn, int bNo,int authority, int userNo, String isQuestion) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteContent");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				pstmt.setInt(2, userNo);
				pstmt.setString(3, isQuestion);
				pstmt.setInt(4, authority);
				pstmt.setInt(5, userNo);
				pstmt.setInt(6, bNo);
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
			
			String sql = prop.getProperty("updateAttachment");
			sql = sql.replace("$","REF_BNO");
			sql = sql.replace("^","=");
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
	   
	   
	   
	   public int recommendCountUp(Connection conn, int bNo, int userNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("recommendCountUp");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				pstmt.setInt(2, userNo);
				pstmt.setInt(3, bNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	
	   
	   public int scrapCountUp(Connection conn, int bNo, int userNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("scrapCountUp");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				pstmt.setInt(2, userNo);
				pstmt.setInt(3, bNo);
				
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
	   
	   public int updateContent(Connection conn, Board b) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateContent");
			try {
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getContent());
				pstmt.setInt(3, b.getCategoryNo());
				pstmt.setString(4, b.getIsQuestion());
				pstmt.setString(5, b.getIsAnonimous());
				pstmt.setInt(6, b.getBoardNo());
				pstmt.setInt(7,Integer.valueOf(b.getWriter()));
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   
	   public int updateAttachment(Connection conn, String deleteImg) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateAttachment");
			sql = sql.replace("$","FILE_NO");
			sql = sql.replace("^","");
			sql = sql.replace("?", "IN ("+deleteImg+")");
			try {
				pstmt = conn.prepareStatement(sql);
				
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

	    public int reportCountUp(Connection conn, int bNo, int userNo) {
         
         int result = 0;
         PreparedStatement pstmt = null;
         
         String sql = prop.getProperty("reportCountUp");
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bNo);
            pstmt.setInt(2, userNo);
            pstmt.setInt(3, bNo);
            result = pstmt.executeUpdate();

         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
         
            JDBCTemplate.close(pstmt);
         }
         return result;
	    }
	    
	   
	    public int listCount(Connection conn, int userNo) {
	         
	         int result = 0;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         String sql = prop.getProperty("listCount");

	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userNo);
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
	    
	    public ArrayList<Board> userWriting(Connection conn, PageInfo pi, int userNo) {
		    
			   ArrayList <Board> boardList= new ArrayList<>();
			   PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("userWriting");
				try {
					pstmt = conn.prepareStatement(sql);
					
					int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
					int endRow = startRow + pi.getBoardLimit() - 1;
					
					pstmt.setInt(1, userNo);
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
						b.setStringDate(rset.getString("STRING_DATE"));
						b.setUserProfile(rset.getString("USERPROFILE"));
						b.setScrapCount(rset.getInt("SCRAP_COUNT"));
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
	    
	    public int listCountReply(Connection conn, int userNo) {
	         
	         int result = 0;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         String sql = prop.getProperty("listCountReply");

	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userNo);
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
	    
	    public ArrayList<Board> userComments(Connection conn, PageInfo pi, int userNo) {
		    
			   ArrayList <Board> boardList= new ArrayList<>();
			   PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("userComments");
				try {
					pstmt = conn.prepareStatement(sql);
					
					int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
					int endRow = startRow + pi.getBoardLimit() - 1;
					
					pstmt.setInt(1, userNo);
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
						b.setStringDate(rset.getString("STRING_DATE"));
						b.setUserProfile(rset.getString("USERPROFILE"));
						b.setScrapCount(rset.getInt("SCRAP_COUNT"));
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
	    
	    
	    public int listCountScrap(Connection conn, int userNo) {
	         
	         int result = 0;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         String sql = prop.getProperty("listCountScrap");

	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userNo);
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
	    
	    public ArrayList<Board> userScrap(Connection conn, PageInfo pi, int userNo) {
		    
			   ArrayList <Board> boardList= new ArrayList<>();
			   PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("userScrap");
				try {
					pstmt = conn.prepareStatement(sql);
					
					int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
					int endRow = startRow + pi.getBoardLimit() - 1;
					
					pstmt.setInt(1, userNo);
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
						b.setStringDate(rset.getString("STRING_DATE"));
						b.setUserProfile(rset.getString("USERPROFILE"));
						b.setScrapCount(rset.getInt("SCRAP_COUNT"));
						
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
	    
	    public int scrapCountDown(Connection conn, int bNo, int userNo) {
			   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("scrapCountDown");

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
