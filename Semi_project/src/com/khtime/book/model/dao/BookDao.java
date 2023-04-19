package com.khtime.book.model.dao;

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

import com.khtime.book.model.vo.Book;
import com.khtime.book.model.vo.BookAttachment;
import com.khtime.common.model.vo.PageInfo;

public class BookDao {
	
	private Properties prop = new Properties();
	   
	   public BookDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BookDao.class.getResource("/sql/book/book-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	  
	  public int insertThumbnailBook(Connection conn, Book book) {
		  
		  int result = 0;
		  
		  PreparedStatement pstmt = null;
		  
		  String sql = prop.getProperty("insertThumbnailBook");
		  
		  try {
			  
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, book.getSeller());
			pstmt.setString(2, book.getBookName());
			pstmt.setInt(3, book.getPrice());
			pstmt.setString(4, book.getAuthor());
			pstmt.setString(5, book.getPublisher());
			pstmt.setString(6, book.getIsNoted());
			pstmt.setInt(7, book.getCondition());
			pstmt.setString(8, book.getIsDirect());
			pstmt.setString(9, book.getLocation());
			pstmt.setString(10, book.getPublicationDate());
			pstmt.setString(11, book.getApiImg());
			pstmt.setString(12, book.getContent());
			pstmt.setInt(13, book.getListPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		  return result;
	  }
	  
	  public int insertAttachmentList(Connection conn, ArrayList<BookAttachment> bList) {
		  
		  int result = 1;
		  
		  PreparedStatement pstmt = null;
		  
		  String sql = prop.getProperty("insertAttachmentList");
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			
			for(BookAttachment bat : bList) {
				pstmt.setString(1, bat.getOriginName());
				pstmt.setString(2, bat.getChangeName());
				pstmt.setString(3, bat.getFilePath());
				pstmt.setInt(4, bat.getFileLevel());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		 return result;
	  }
	  
	  public ArrayList<Book> selectThumbnailList(Connection conn , PageInfo pi) {
		  
		  ArrayList<Book> bList = new ArrayList<>();
		  
		  PreparedStatement pstmt = null;
		  
		  ResultSet rset = null;
		  
		  String sql = prop.getProperty("selectThumbnailList");
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				book.setBookNo(rset.getInt("BOOK_NO"));
				book.setTitleImg(rset.getString("TITLEIMG"));
				book.setBookName(rset.getString("BOOK_NAME"));
				book.setPrice(rset.getInt("PRICE"));
				book.setIsSoldout(rset.getString("IS_SOLDOUT"));
				
				bList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		  return bList;
	  }
	  
	  public ArrayList<Object> selectBook(Connection conn ,int bkno) {
		  
		  ArrayList<Object> book = new ArrayList<Object>();
		  
		  PreparedStatement pstmt = null;
		  
		  String sql = prop.getProperty("selectBook");
		  
		  ResultSet rset = null;
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bkno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				Book b = new Book();
				b.setBookNo(rset.getInt("BOOK_NO"));
				b.setSeller(rset.getInt("SELLER"));
				b.setBookName(rset.getString("BOOK_NAME"));
				b.setAuthor(rset.getString("AUTHOR"));
				b.setPublisher(rset.getString("PUBLISHER"));
				b.setPublicationDate(rset.getString("PUBLICATION_DATE"));
				b.setEnrollDate(rset.getDate("ENROLL_DATE"));
				b.setIsNoted(rset.getString("IS_NOTED"));
				b.setIsDirect(rset.getString("IS_DIRECT"));
				b.setLocation(rset.getString("LOCATION"));
				b.setApiImg(rset.getString("API_IMG"));
				b.setPrice(rset.getInt("PRICE"));
				b.setContent(rset.getString("CONTENT"));
				b.setListPrice(rset.getInt("LIST_PRICE"));
				b.setCondition(rset.getInt("CONDITION"));
				b.setIsSoldout(rset.getString("IS_SOLDOUT"));
				book.add(rset.getString("USER_ID"));
				book.add(b);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		  return book;
	  }
	  
	  public ArrayList<BookAttachment> selectThumbnail(Connection conn , int bkno){
		  
		  PreparedStatement pstmt = null;
		  
		  ArrayList<BookAttachment> bList = new ArrayList<BookAttachment>();
		  
		  String sql = prop.getProperty("selectThumbnail");
		  
		  ResultSet rset = null;
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bkno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BookAttachment bat = new BookAttachment();
				bat.setOriginName(rset.getString("ORIGIN_NAME"));
				bat.setChangeName(rset.getString("CHANGE_NAME"));
				bat.setFilePath(rset.getString("FILE_PATH"));
				bat.setFileNo(rset.getInt("FILE_NO"));
				bList.add(bat);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 return bList;
	  }
	  
	  public ArrayList<Book> selectBook(Connection conn , String bookname , PageInfo pi) {
		  
		  PreparedStatement pstmt = null;
		  
		  ArrayList<Book> bList = new ArrayList<Book>();
		  
		  String sql = prop.getProperty("selectBookList");
		  
		  ResultSet rset = null;
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, bookname);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				book.setTitleImg(rset.getString("TITLEIMG"));
				book.setBookName(rset.getString("BOOK_NAME"));
				book.setPrice(rset.getInt("PRICE"));
				book.setBookNo(rset.getInt("BOOK_NO"));
				book.setIsSoldout(rset.getString("IS_SOLDOUT"));
				
				bList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		  return bList;
	  }

	public ArrayList<Book> selectBookSellList(Connection conn , PageInfo pi , int loginUserNo) {
		
		PreparedStatement pstmt = null;
		
		ArrayList<Book> bList = new ArrayList<Book>();
		
		String sql = prop.getProperty("selectBookSellList");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, loginUserNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				book.setTitleImg(rset.getString("TITLEIMG"));
				book.setPrice(rset.getInt("PRICE"));
				book.setBookName(rset.getString("BOOK_NAME"));
				book.setBookNo(rset.getInt("BOOK_NO"));
				book.setIsSoldout(rset.getString("IS_SOLDOUT"));
				
				bList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return bList;
	}

	public ArrayList<Book> getMainBooks(Connection conn){
		
		ArrayList<Book> list = new ArrayList<Book>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 4);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book book = new Book();
				book.setBookName(rset.getString("BOOK_NAME"));
				book.setBookNo(rset.getInt("BOOK_NO"));
				book.setPrice(rset.getInt("PRICE"));
				book.setTitleImg(rset.getString("TITLEIMG"));
				list.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public BookAttachment selectBookAttachment(Connection conn, int fileNo) {
		
		PreparedStatement pstmt = null;
		
		BookAttachment orgBat = new BookAttachment();
		
		String sql = prop.getProperty("selectBookAttachment");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fileNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				orgBat.setOriginName(rset.getString("ORIGIN_NAME"));
				orgBat.setChangeName(rset.getString("CHANGE_NAME"));
				orgBat.setFilePath(rset.getString("FILE_PATH"));
				orgBat.setFileNo(rset.getInt("FILE_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return orgBat;
	}
	
	public int updateBook(Connection conn, Book book) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, book.getContent());
			pstmt.setInt(2, book.getPrice());
			pstmt.setString(3, book.getIsNoted());
			pstmt.setInt(4, book.getCondition());
			pstmt.setString(5, book.getIsDirect());
			pstmt.setInt(6, book.getBookNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateBookAttachment(Connection conn , BookAttachment bat) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBookAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bat.getOriginName());
			pstmt.setString(2, bat.getChangeName());
			pstmt.setString(3, bat.getFilePath());
			pstmt.setInt(4, bat.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertBookAttachment(Connection conn, BookAttachment bat) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBookAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bat.getBookNo());
			pstmt.setString(2, bat.getOriginName());
			pstmt.setString(3, bat.getChangeName());
			pstmt.setString(4, bat.getFilePath());
			pstmt.setInt(5, bat.getFileLevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateSoldout(Connection conn , int bookNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSoldout");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		return result;
	}
	
	public int bookDelete(Connection conn , int bookNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("bookDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}