package com.khtime.board.model.dao;

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


import com.khtime.board.model.vo.Reply;
import com.khtime.common.JDBCTemplate;

public class ReplyDao {
	private Properties prop = new Properties();
	   
	   
	   public ReplyDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/reply-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public ArrayList<Reply> selectReply(Connection conn, int bNo) {
		    
		   ArrayList <Reply> replyList= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectReply");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Reply r = new Reply(
								rset.getInt("REPLY_NO"),
								rset.getString("WRITER"),
								rset.getString("CONTENT"),
								rset.getDate("ENROLL_DATE"),
								rset.getString("IS_ANONIMOUS"),
								rset.getInt("P_REPLY_NO")
							);
					
					replyList.add(r);
				}		
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return replyList;
		}
}
