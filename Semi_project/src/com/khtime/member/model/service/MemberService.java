package com.khtime.member.model.service;

import java.sql.Connection;

import com.khtime.common.CommonMethod;
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

		return userId;
	}

	public boolean searchPwd(String userId, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();

		boolean result = new MemberDao().memberCheck(conn, userId, userEmail);
	
		if(result) {
			
			// 새비밀번호 생성, 
			  int random = (int)(Math.random()*5 + 10);
			  String newPwd = CommonMethod.getRamdomPassword(random);
			
			
			result = new MemberDao().updatePwd(conn, userId, newPwd );
			CommonMethod.sendNewPwd(userEmail, newPwd);
			JDBCTemplate.close(conn);
			return result;
			
			
		}else {
			JDBCTemplate.close(conn);
			return result;
		}
	}
		

		
		
		// 1. 이메일이랑 아이디 맞는지 확인 select -> result=0 controller 메일확인해주세요
		// 2. 맞다 -> 새 비밀번호 생성 -> DB update -> (암호화) -> 메일발송 result = 1 -> 로그인해라

	}


