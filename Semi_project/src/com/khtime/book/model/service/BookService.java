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
		int result2 = new BookDao().insertAttachmentList(conn, bList);
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
	
	public ArrayList<Object> selectBook(int bkno) {
		
		Connection conn = getConnection();
		
		ArrayList<Object> book = new BookDao().selectBook(conn , bkno);
		
		close(conn);
		
		return book;
	}
	
	public ArrayList<BookAttachment> selectThumbnail(int bkno) {
		
		Connection conn = getConnection();
		
		ArrayList<BookAttachment> batList = new BookDao().selectThumbnail(conn, bkno);
		
		close(conn);
		
		return batList;
	}
	
	public ArrayList<Book> selectBook(String bookname, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Book> bList = new BookDao().selectBook(conn, bookname , pi);
		
		close(conn);
		
		return bList;	
	}
	
	public ArrayList<Book> selectBookSellList(PageInfo pi , int loginUserNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Book> bList = new BookDao().selectBookSellList(conn, pi , loginUserNo);
		
		close(conn);
		
		return bList;
		
	}
	
	public ArrayList<Book> getMainBooks(){
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().getMainBooks(conn);
		close(conn);
		
		return list;
	}
		
	public BookAttachment selectBookAttachment(int fileNo) {
		
		Connection conn = getConnection();
		
		BookAttachment orgBat = new BookDao().selectBookAttachment(conn, fileNo);
		
		close(conn);
		
		return orgBat;
	}
	
	public int updateBook(Book book , ArrayList<BookAttachment> batList) {
		
		Connection conn = getConnection();
		
		int result1 = new BookDao().updateBook(conn, book);
		
		int result2 = 1;
		
		for( BookAttachment bat : batList ) {
			if(bat.getFileNo() != 0) {
				System.out.println(bat.getFileNo());
				result2 *= new BookDao().updateBookAttachment(conn, bat);
			} else {
				result2 *= new BookDao().insertBookAttachment(conn, bat);
			}
			System.out.println(result2);
		}
		
		if( result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	public int updateSoldout(int bookNo) {
		
		Connection conn = getConnection();
		
		int book = new BookDao().updateSoldout(conn , bookNo);
		
		close(conn);
		
		return book;
	}
	
	public int bookDelete(int bookNo) {
		
		Connection conn = getConnection();
		
		int book = new BookDao().bookDelete(conn , bookNo);
		
		close(conn);
		
		return book;
	}
}
