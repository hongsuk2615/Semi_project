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

import com.khtime.common.JDBCTemplate;

public class ScrapDao {
		
	private Properties prop = new Properties();
	   
	   
	   public ScrapDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/scrap-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public int scrapContent(Connection conn, int bNo, int userNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("scrapContent");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				pstmt.setInt(2, userNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int scrapDelete(Connection conn, int bNo, int userNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("scrapDelete");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bNo);
				pstmt.setInt(2, userNo);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public ArrayList<Integer> scrapCheck(Connection conn, int userNo) {
		   
		     ArrayList<Integer> result = new ArrayList<>();
			 PreparedStatement pstmt = null;
			 ResultSet rset = null;
			
			String sql = prop.getProperty("scrapCheck");

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					result.add(rset.getInt("BOARD_NO"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
	   public int scrapCheck(Connection conn, int userNo, int bNo) {
		   
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("scrapCheck");
			sql += "AND BOARD_NO = ?";
			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, userNo);
				pstmt.setInt(2, bNo);

				rset = pstmt.executeQuery();

				if(rset.next()) {
					result++;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {

				JDBCTemplate.close(pstmt);
			}
			return result;
		}
	   
}
