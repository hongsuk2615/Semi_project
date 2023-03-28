package com.khtime.book.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.book.model.vo.Book;

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
	   
	   public int insertBook(Connection conn , Book book) {
		   
		   int result = 0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("insertBook");
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, book.getSeller());
			pstmt.setString(2, book.getBookName());
			pstmt.setInt(3, book.getPrice());
			pstmt.setString(4, book.getAuthor());
			pstmt.set
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   
	   }
	   
	   
}