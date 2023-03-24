package com.khtime.management.model.service;

import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.vo.Board;
import com.khtime.management.model.dao.ManagementDao;
import com.khtime.member.model.vo.Member;



public class ManagementService {
	
	

	public ArrayList<Member> getReportedUsers() {
		Connection conn = getConnection();
		ArrayList<Member> list = new ManagementDao().getReportedUsers(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> getReportedBoards() {
		Connection conn = getConnection();
		ArrayList<Board> list = new ManagementDao().getReportedBoards(conn);
		
		close(conn);
		
		return list;
	}
	
	
	

	
	
}
