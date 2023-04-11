package com.khtime.friend.model.service;

import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.commit;
import static com.khtime.common.JDBCTemplate.getConnection;
import static com.khtime.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.common.JDBCTemplate;
import com.khtime.friend.model.dao.FriendDao;
import com.khtime.member.model.vo.Member;
import com.khtime.message.model.dao.MessageDao;



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
	public ArrayList<Member> friendlist2(int loginUserNo){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list2 = new FriendDao().friendlist2(conn, loginUserNo);
		
		close(conn); 
		
		return list2;
	}
	public ArrayList<Member> friendlist3(int loginUserNo){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list3 = new FriendDao().friendlist3(conn, loginUserNo);
		
		close(conn); 
		
		return list3;
	}
	
	public int friendaccept(int loginUserNo,int senderUserNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FriendDao().friendaccept(conn, loginUserNo, senderUserNo );
	
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
	
	public int friendDeny(int loginUserNo,int senderUserNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FriendDao().friendDeny(conn, loginUserNo, senderUserNo );
	
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
	public boolean isFriend(String loginUserId,String userId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = false;
		result = new FriendDao().friendId(conn, loginUserId, userId);
		JDBCTemplate.close(conn);
		
		return result;

	}
	
	public int friendPlus( int loginUserNo ) {
		Connection conn = getConnection();
		int result = new FriendDao().friendPlus(conn, loginUserNo );
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}

