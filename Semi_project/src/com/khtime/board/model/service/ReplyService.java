package com.khtime.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.ReplyDao;
import com.khtime.board.model.vo.Reply;
import com.khtime.common.JDBCTemplate;

public class ReplyService {
	
	public ArrayList<Reply> selectReply(int bNo){
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Reply> replyList = new ReplyDao().selectReply(conn, bNo);

		JDBCTemplate.close(conn);

		return replyList;
	}
}
