package com.khtime.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.ReplyDao;
import com.khtime.board.model.vo.Reply;
import com.khtime.common.JDBCTemplate;

public class ReplyService {
	
	public int insertReply(Reply r, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReplyDao().insertReply(conn, r, userNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(int bNo){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reply> list = new ReplyDao().selectReplyList(conn, bNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public int deleteReply(int rNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReplyDao().deleteReply(conn, rNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}
}
