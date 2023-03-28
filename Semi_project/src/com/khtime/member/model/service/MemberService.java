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
		
		
		public void sendNewPwd(String email, int newPwd) {
			Properties props = new Properties();
		      props.put("mail.smtp.host", "smtp.gmail.com");
		      props.put("mail.smtp.port", "587");
		      props.put("mail.smtp.auth", "true");
		      props.put("mail.smtp.starttls.enable", "true");
		      props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		  
		      Session session = Session.getInstance(props, new Authenticator() {
		         @Override
		         protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication("freshbakery0823@gmail.com", "jzfiqznqlrfsxfyv");
		         }
		      });
		    
		      String receiver = "syjang0312@naver.com"; //email
		      String title = "테스트 메일입니다.";
		      String content = "<h2 style='color:blue'>안녕하세요</h2>";
		      Message message = new MimeMessage(session);
		      try {
		         message.setFrom(new InternetAddress("freshbakery0823@gmail.com", "관리자", "utf-8"));
		         message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		         message.setSubject(title);
		         message.setContent(content, "text/html; charset=utf-8");
		      
		         Transport.send(message);
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		   }
		
		
		
		// 1. 이메일이랑 아이디 맞는지 확인 select -> result=0 controller 메일확인해주세요
		// 2. 맞다 -> 새 비밀번호 생성 -> DB update -> (암호화) -> 메일발송 result = 1 -> 로그인해라

	}


