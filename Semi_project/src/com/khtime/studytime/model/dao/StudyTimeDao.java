package com.khtime.studytime.model.dao;

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

import com.khtime.board.model.dao.BoardDao;
import com.khtime.common.JDBCTemplate;
import com.khtime.studytime.model.vo.StudyTime;

public class StudyTimeDao {
	private Properties prop = new Properties();
	
	
	public StudyTimeDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( StudyTimeDao.class.getResource("/sql/studytime/studytime-mapper.xml").getPath()));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	
	
	
	
	public ArrayList<StudyTime> getStudy(Connection conn,int userNo){
		ArrayList<StudyTime> list = new ArrayList<StudyTime>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getStudyTime");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				StudyTime studyTime = new StudyTime();
				studyTime.setStudyTimeNo(rset.getInt("STUDY_TIME_NO"));
				studyTime.setTargetTime(rset.getInt("TARGET_TIME"));
				studyTime.setTimeAmount(rset.getInt("TIME_AMOUNT"));
				studyTime.setStudyDate(rset.getDate("STUDY_DATE"));
				list.add(studyTime);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int sumStudy(Connection conn,int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("sumStudyTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("TIME_AMOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	public boolean insertStudy(Connection conn,  int userNo, int timeAmount, int targetTime) {
		   
		   boolean result = false;
		   PreparedStatement pstmt = null;
		   String sql = prop.getProperty("insertStudyTime");
		   try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,userNo);
				pstmt.setInt(2,timeAmount);
				pstmt.setInt(3, targetTime);
				
				result = pstmt.executeUpdate() > 0? true : false;

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			
				JDBCTemplate.close(pstmt);
			}
			return result;
	   
	   
	   }
	
	
	
	
	
	
	
}
