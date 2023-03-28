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
	   

		public int insertReply(Connection conn, Reply r) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertReply");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, r.getBoardNo());
				pstmt.setInt(2, Integer.parseInt(r.getWriter()));
				pstmt.setString(3, r.getContent());
				pstmt.setString(4, r.getIsAnonimous());
				
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public ArrayList<Reply> selectReplyList(Connection conn, int boardNo){
			ArrayList<Reply> list = new ArrayList<>();
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectReplyList");
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Reply(
							rset.getInt("REPLY_NO"),
							rset.getString("CONTENT"),
							rset.getString("NICK_NAME"),
							rset.getDate("ENROLL_DATE"),
							rset.getString("IS_ANONIMOUS")
							));				
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
}
