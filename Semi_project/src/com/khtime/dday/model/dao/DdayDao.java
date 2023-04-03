package com.khtime.dday.model.dao;

import static com.khtime.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.khtime.board.model.vo.Board;
import com.khtime.common.JDBCTemplate;
import com.khtime.dday.model.vo.Dday;
import com.khtime.todolist.model.vo.Todolist;

public class DdayDao {
	private Properties prop = new Properties();
	   
	   
	   public DdayDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( DdayDao.class.getResource("/sql/dday/dday-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   
	   public boolean insertDday(Connection conn,  int userNo,  String title, Date dDay) {
		   
		   boolean result = false;
		   PreparedStatement pstmt = null;
		   String sql = prop.getProperty("insertDday");
		   try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,userNo);
				pstmt.setDate(2,dDay);
				pstmt.setString(3, title);
				
				result = pstmt.executeUpdate() > 0? true : false;

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
	   
	   
	   }
	   
	   
	   public ArrayList<Dday> getDday(Connection conn,int userNo, Date Dday, String title){
			ArrayList<Dday> list = new ArrayList<Dday>();
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("selectDday");
			ResultSet rset = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Dday dday = new Dday();
					dday.setdDayNo(rset.getInt("D_DAY_NO"));
					dday.setdDay(rset.getDate("D_DAY"));
					dday.setTitle(rset.getString("TITLE"));
					list.add(dday);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
			
		}
	   
	   public boolean updateDday(Connection conn, int dDayNo, Date dDay, String title) {
			boolean result = false;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateDday");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setDate(1, dDay);
				pstmt.setString(2, title);
				pstmt.setInt(3, dDayNo);
				result = pstmt.executeUpdate() > 0 ? true : false;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
}
