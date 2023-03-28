package com.khtime.friend.model.service;

import java.sql.Connection;

import com.khtime.common.JDBCTemplate;
import com.khtime.friend.model.dao.FriendDao;



public class FriendService {
	
	
	public boolean isId(String loginUserId,String userId ) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = false;
		result = new FriendDao().friendId(conn, loginUserId, userId);
		JDBCTemplate.close(conn);
		
		return result;

		
	} 
	
	
}
