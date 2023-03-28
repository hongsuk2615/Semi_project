package com.khtime.book.model.service;

import java.sql.Connection;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.book.model.dao.BookDao;
import com.khtime.book.model.vo.Book;
import com.khtime.book.model.vo.BookAttachment;
import static com.khtime.common.JDBCTemplate.*;

public class BookService {
	
	public int insertBook(Book book , BookAttachment bat) {
		
		Connection conn = getConnection();
		
		int result1 = new BookDao().insertBook(conn , book);
		
		int result2 = 1;
		
		if(bat != null) {
			
			result2 = new BoardDao().insertAttachment(conn, bat);
			
		}
		
		if(result1 > 0 && result2 > 0 ) {
			// 첨부파일이 없는 경우 insert가 성공했을 때 도 result2는 여전히 0이기 때문에 rollback처리가 될 수 있음.
			// 따라서 애초에 result2의 값을 1로 초기화 시켜줘야 한다.
			commit(conn);
			
		} else {
			rollback(conn);
		}
				
		close(conn);
		
		return result1*result2;
		
	}
	
}
