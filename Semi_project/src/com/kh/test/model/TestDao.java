package com.kh.test.model;

import static com.khtime.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import com.khtime.book.model.vo.Book;

public class TestDao {
	
	private Properties prop = new Properties();
	
	public List<Test> selectList(Connection conn) {
		
		List<Test> l = new List<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Test test = new Test();
				test.setSeq(rset.getInt("SEQ"));
				test.setWriter(rset.getString("WRITER"));
				test.setTitle(rset.getString("TITLE"));
				test.setContent(rset.getString("CONTENT"));
				l.add(test);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		  return l;
	  }
		
		
		
	}
	
}
