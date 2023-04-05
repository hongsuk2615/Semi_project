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
				System.out.println(book);
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
}