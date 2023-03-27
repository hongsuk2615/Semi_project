package com.khtime.board.model.dao;
import static com.khtime.common.JDBCTemplate.*;
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

import com.khtime.board.model.vo.Board;

public class BoardDao {
	
	private Properties prop = new Properties();
	   
	   
	   public BoardDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   public ArrayList<Board> getHotBestBoardlist(Connection conn, int recommendCount){
		   ArrayList<Board> list = new ArrayList<Board>();
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   String sql = prop.getProperty("getHotBestBoardlist");
		   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recommendCount);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 return list;  
	   }
}
