package com.khtime.management.model.service;

import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.commit;
import static com.khtime.common.JDBCTemplate.getConnection;
import static com.khtime.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.khtime.board.model.vo.Board;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.management.model.dao.ManagementDao;
import com.khtime.member.model.vo.Member;



public class ManagementService {
	
	

	public ArrayList<Member> getReportedUsers() {
		Connection conn = getConnection();
		ArrayList<Member> list = new ManagementDao().getReportedUsers(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> getReportedBoards(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Board> list = new ManagementDao().getReportedBoards(conn, pi);
		
		close(conn);
		
		return list;
	}
	public ArrayList<Member> getEnrollmentReqs() {
		Connection conn = getConnection();
		ArrayList<Member> list = new ManagementDao().getEnrollmentReqs(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> getBoardList(String cName){
		Connection conn = getConnection();
		ArrayList<Board> list = new ManagementDao().getBoardList(conn, cName);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<HashMap<String,Member>> getBoardMakeReq(){
		Connection conn = getConnection();
		ArrayList<HashMap<String,Member>> list = new ManagementDao().getBoardMakeReq(conn);
		
		close(conn);
		
		return list;
	}
	
	public Member getNoneApprovedUser(String userId){
		
		Connection conn = getConnection();
		Member m = new ManagementDao().getNoneApprovedUser(conn, userId);
		
		close(conn);
		
		return m;
		
		
	}
	
	public HashMap<String, Member> getBoardMakeReq(String categoryName){
		Connection conn = getConnection();
		HashMap<String, Member> map = new ManagementDao().getBoardMakeReq(conn, categoryName);
		
		close(conn);
		
		return map;
	}
	
	public Member getReportedUser(String reportedUserId) {
		Connection conn = getConnection();
		Member reportedUser = new ManagementDao().getReportedUser(conn, reportedUserId);
		close(conn);
		
		return reportedUser;
	}
	
	public int approveEnroll(String userId) {
		Connection conn = getConnection();
		int result = 0 ;
		result = new ManagementDao().approveEnroll(conn, userId);
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int denyEnroll(String userId) {
		Connection conn = getConnection();
		int result = 0 ;
		result = new ManagementDao().denyEnroll(conn, userId);
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int banUser(String userId, String isBanned) {
		Connection conn = getConnection();
		int result = 0;
		result = new ManagementDao().banUser(conn,userId, isBanned);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;	
	}
	
	public int whitelistUser(String userId, String isWhitelist) {
		Connection conn = getConnection();
		int result = 0;
		result = new ManagementDao().whitelistUser(conn,userId,isWhitelist);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;	
	}
	
	public int approveMakeBoard(String cName) {
		Connection conn = getConnection();
		int result = 0;
		result = new ManagementDao().approveMakeBoard(conn, cName)*new ManagementDao().approveBoardReq(conn, cName);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;	
	}
	
	public int denyMakeBoard(String cName) {
		Connection conn = getConnection();
		int result = 0;
		result = new ManagementDao().denyMakeBoard(conn, cName);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;	
	}
	
	public ArrayList<Member> getFilteredUsers(Member m){
		Connection conn = getConnection();
		ArrayList<Member> list = new ManagementDao().getFilteredUsers(conn, m);
		close(conn);
		return list;
	}
	
	public Member getUser(String userId) {
		Connection conn = getConnection();
		Member m = new ManagementDao().getUser(conn, userId);
		close(conn);
		return m;
	}
	
	public ArrayList<HashMap<String,Member>> getBoardFilteredReq(String categoryName, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<HashMap<String,Member>> list = new ManagementDao().getBoardFilteredReq(conn, categoryName, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Board> getFilteredReportedBoards(String keyword, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Board> list = new ManagementDao().getFilteredReportedBoards(conn, keyword, pi);
		close(conn);	
		return list;
	}
	
	public ArrayList<Member> getFilteredEnrollmentReqs(String name, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new ManagementDao().getFilteredEnrollmentReqs(conn, name, pi);
		close(conn);
		return list;
	}
	
	public int getCnoFromName(String cName) {
		Connection conn = getConnection();
		int result = new ManagementDao().getCnoFromName(conn, cName);
		close(conn);
		return result;
	}
	
	
	
	

	
	
}
