package com.khtime.member.model.service;

import java.sql.Connection;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
		
		
	
	}


