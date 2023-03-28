package com.khtime.friend.model.service;

import java.sql.Connection;

import com.khtime.common.JDBCTemplate;
import com.khtime.member.model.dao.MemberDao;

public class FriendService {
	
	
	public boolean isId(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = false;
		result = new MemberDao().isId(conn, userId);
		JDBCTemplate.close(conn);
		
		return result;
	}
}
