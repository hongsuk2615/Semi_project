package com.khtime.friend.model.service;

import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.commit;
import static com.khtime.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.common.JDBCTemplate;
import com.khtime.friend.model.dao.FriendDao;
import com.khtime.member.model.vo.Member;



public class FriendService {
	
	
	public boolean friendId(String loginUserId,String userId ) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = false;
		result = new FriendDao().friendId(conn, loginUserId, userId);
		JDBCTemplate.close(conn);
		
		return result;

		
	} 
	
	
	public int friendReq(String friendId , int loginUserNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FriendDao().friendReq(conn,  friendId, loginUserNo);
	
		if (result > 0) { // 성공
			// 커밋
			commit(conn);
		} else { // 실패
			// 롤백
			rollback(conn);
		}
		// 사용한 자원 반납. conn.close();
		close(conn);
		// 컨트롤러에게 결과값 반환
		return result;
	}
	
	public ArrayList<Member> friendlist(int loginUserNo){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new FriendDao().friendlist(conn, loginUserNo);
		
		close(conn); 
		
		return list;
	}
}
