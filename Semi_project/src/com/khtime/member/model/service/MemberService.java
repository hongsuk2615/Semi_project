package com.khtime.member.model.service;

import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.commit;
import static com.khtime.common.JDBCTemplate.getConnection;
import static com.khtime.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import com.khtime.common.JDBCTemplate;
import com.khtime.member.model.dao.MemberDao;
import com.khtime.member.model.vo.Member;
import com.khtime.member.model.vo.UserProFileImg;



public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	

	public int insertMember(Member m) {
		// 반환형 int : 처리된 행의 개수
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMember(conn,m);
		
		if(result > 0 ) { // 성공 
			// 커밋
			JDBCTemplate.commit(conn);
		}else { //실패
			// 롤백
			JDBCTemplate.rollback(conn);
		}
		//사용한 자원 반납. conn.close();
			JDBCTemplate.close(conn);
		//컨트롤러에게 결과값 반환
		return result;
	}

	public String searchId(String userName, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();
		
		String userId = new MemberDao().searchId(conn, userName, userEmail);
		
		JDBCTemplate.close(conn);
		System.out.println(userId);
		return userId;
	}
	
	

	
	public boolean isId(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = false;
		result = new MemberDao().isId(conn, userId);
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int insertUserProFileImg( int userNo, UserProFileImg upf) {
		Connection conn = getConnection();		
		int result1 = new MemberDao().insertUserProFileImg(conn, userNo, upf);
		if(result1 > 0 ) {
			commit(conn);			
		}else {			
			rollback(conn);
		}
		close(conn);
		return result1;
	}
	
	public int selectMember(String userId) {
		Connection conn = getConnection();	
		
		int userNo = new MemberDao().selectMember(conn,userId);
		
		close(conn);
		
		return userNo;
	}
	
}
