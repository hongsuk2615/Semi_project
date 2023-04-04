package com.khtime.message.model.dao;

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
import com.khtime.member.model.vo.Member;

public class MessageDao {
	private Properties prop = new Properties();
	   
	   
	   public MessageDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( MessageDao.class.getResource("/sql/message/message-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public int sendMessage(Connection conn, int sender, int receiver,String content) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("sendMessage");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sender);
				pstmt.setInt(2, receiver);
				pstmt.setString(3, content);
	
				
				rset = pstmt.executeQuery();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return result;
	   }
	   
	   public ArrayList<Member> selectMessage(Connection conn,int userNo) {
		   ArrayList<Member> list = new ArrayList<Member>();
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
			
		   String sql = prop.getProperty("selectMessage");
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, userNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Member m = new Member();
					m.setNickName(rset.getString("NICK_NAME"));
					m.setUserNo(rset.getInt("USER_NO"));
					list.add(m);
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
