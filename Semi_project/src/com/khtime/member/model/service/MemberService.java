package com.khtime.member.model.service;

import java.sql.Connection;

import com.khtime.common.JDBCTemplate;
import com.khtime.member.model.dao.MemberDao;
import com.khtime.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();

		Member m = new MemberDao().loginMember(conn, userId, userPwd);

		JDBCTemplate.close(conn);

		return m;
	}

	public String searchId(String userName, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();

		String userId = new MemberDao().searchId(conn, userName, userEmail);

		JDBCTemplate.close(conn);
		System.out.println(userId);
		return userId;
	}

	public Member updatePwd(String updatePwd, String userPwd, String userId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = null;

		int result = new MemberDao().checkPwd(conn, userPwd, userId);

		if (result > 0) {
			result = new MemberDao().updatePwd(conn, updatePwd, userId);
			if (result > 0) {
				JDBCTemplate.commit(conn);
				m = new MemberDao().loginMember(conn, userId, updatePwd);
			} else {

				JDBCTemplate.rollback(conn);
			}
		}
		JDBCTemplate.close(conn);
		return m;
	}

	public Member updateEmail(String updateEmail, String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = null;
		int result = 0;
		System.out.println(updateEmail);
		
		result = new MemberDao().updateEmail(conn, updateEmail, userId);
		System.out.println(result);
		
		if (result > 0) {

			JDBCTemplate.commit(conn);
	
			m =new MemberDao().loginMember(conn, userId, userPwd);
		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		System.out.println("업데이트이메일 멤버" + m);
		return m;
	}

	public int checkPwd(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new MemberDao().checkPwdForEmail(conn, userPwd, userId);
		JDBCTemplate.close(conn);
		return result;
	}

//	public Member updateNickName(String updateNickName, String userId, String userNickName) {
//		
//		Connection conn = JDBCTemplate.getConnection();
//		
//		Member m = null;
//		
//		int result = new MemberDao().checkNickName(conn,userId,userNickName);
//		
//		if(result>0) {
//			result = new MemberDao().updateNickName(conn,updateNickName,userId);
//			if(result>0) {
//				JDBCTemplate.commit(conn);
//				m =new MemberDao().loginMember(conn, userId, updateNickName);
//			} else {
//				
//				JDBCTemplate.rollback(conn);
//			}
//		}
//		JDBCTemplate.close(conn);
//		return m;
//	}
}
