package com.khtime.book.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.book.model.dao.BookDao;
import com.khtime.book.model.vo.Book;
import com.khtime.book.model.vo.BookAttachment;
import com.khtime.common.model.vo.PageInfo;

import static com.khtime.common.JDBCTemplate.*;

public class BookService {
	
	public int insertThumbnailBook(Book book, ArrayList<BookAttachment> bList) {
		Connection conn = getConnection();
		
		int result1 = new BookDao().insertThumbnailBook(conn, book);
		System.out.println(result1);
		int result2 = new BookDao().insertAttachmentList(conn, bList);
		System.out.println(result2);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public ArrayList<Book> selectThumbnailList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Book> bList = new BookDao().selectThumbnailList(conn , pi);
		
		close(conn);
		
		return bList;
		
	}
	
	public Book selectBook(int bkno) {
		
		Connection conn = getConnection();
		
		Book book = new BookDao().selectBook(conn , bkno);
		
		close(conn);
		
		return book;
	}
	
	public ArrayList<BookAttachment> selectThumbnail(int bkno) {
		
		Connection conn = getConnection();
		
		ArrayList<BookAttachment> bList = new BookDao().selectThumbnail(conn, bkno);
		
		close(conn);
		
		return bList;
	}
	
	public ArrayList<Book> selectBook(String bookname) {
		
		Connection conn = getConnection();
		
		ArrayList<Book> bList = new BookDao().selectBook(conn, bookname);
		
		close(conn);
		
		return bList;
		
	}
}
