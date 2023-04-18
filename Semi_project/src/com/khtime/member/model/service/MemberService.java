package com.khtime.member.model.service;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.khtime.common.CommonMethod;
import static com.khtime.common.JDBCTemplate.*;
import com.khtime.friend.model.dao.FriendDao;
import com.khtime.member.model.dao.MemberDao;
import com.khtime.member.model.vo.Member;
import com.khtime.member.model.vo.UserProFileImg;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();

		Member m = new MemberDao().loginMember(conn, userId, userPwd);

		close(conn);

		return m;
	}

	public int insertMember(Member m) {
		// 반환형 int : 처리된 행의 개수
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);

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

	public String searchId(String userName, String userEmail) {
		Connection conn = getConnection();

		String userId = new MemberDao().searchId(conn, userName, userEmail);

		close(conn);

		return userId;
	}

	public boolean searchPwd(String userId, String userEmail) {
		Connection conn = getConnection();

		boolean result = new MemberDao().memberCheck(conn, userId, userEmail);

		if (result) {

			int random = (int) (Math.random() * 5 + 10); // 10~15
			String newPwd = CommonMethod.getRamdomPassword(random); // 랜덤 임시비밀번호 생성
			String encPwd = CommonMethod.getSHA512(newPwd); // 임시비밀번호 암호화
			result = new MemberDao().updatePwd(conn, userId, encPwd); // 임시비밀번호 DB commit
			CommonMethod.sendNewPwd(userEmail, newPwd); // 임시번호 이메일 보내기
			close(conn);
			return result;

		} else {
			close(conn);
			return result;
		}
	}

	public int insertUserProFileImg(int userNo, UserProFileImg upf) {
		Connection conn = getConnection();
		int result1 = new MemberDao().insertUserProFileImg(conn, userNo, upf);
		if (result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1;
	}

	public boolean isId(String userId) {
		Connection conn = getConnection();
		boolean result = false;
		result = new MemberDao().isId(conn, userId);
		close(conn);

		return result;

	}

	public int selectMember(String userId) {
		Connection conn = getConnection();

		int userNo = new MemberDao().selectMember(conn, userId);

		close(conn);

		return userNo;
	}
	
	public Member updateMyPwd(String updatePwd, String userPwd, String userId) {
		Connection conn = getConnection();
		Member m = null;

		int result = new MemberDao().checkPwd(conn, userPwd, userId);

		if (result > 0) {
			result = new MemberDao().updateMyPwd(conn, updatePwd, userId);
			if (result > 0) {
				commit(conn);
				m = new MemberDao().loginMember(conn, userId, updatePwd);
			} else {

				rollback(conn);
			}
		}
		close(conn);
		return m;
	}

	public Member updateEmail(String updateEmail, String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = null;
		int result = 0;
		
		result = new MemberDao().updateEmail(conn, updateEmail, userId);
		
		if (result > 0) {

			commit(conn);
	
			m =new MemberDao().loginMember(conn, userId, userPwd);
		} else {

			rollback(conn);
		}

		close(conn);
		return m;
	}

	public int checkPwd(String userId, String userPwd) {
		Connection conn = getConnection();
		int result = 0;
		result = new MemberDao().checkPwdForEmail(conn, userPwd, userId);
		close(conn);
		return result;
	}

	public Member updateNickName(String updateNickName,  String userId) {
		Connection conn = getConnection();
		Member m = null;
		int result = new MemberDao().updateNickName(conn, updateNickName, userId);
		
		if (result > 0) {
		commit(conn);
		m = new MemberDao().loginMember(conn, userId, updateNickName);
		}else {
			rollback(conn);
			}
		close(conn);
		return m;
		}
	
	public int deleteMember(String userId) {
	      
	      Connection conn = getConnection();
	      
	      int result = new MemberDao().deleteMember(conn, userId);
	      
	      if(result > 0) {
	         commit(conn);
	      }else {
	         rollback(conn);
	      }
	     close(conn);
	      return result;
	   }
	
	public int changeProfileImg(UserProFileImg img) {
		int result = 0;
		Connection conn = getConnection();
		result = new MemberDao().changeProfileImg(conn, img);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public void recommendContentUp(int bNo) {
		Connection conn = getConnection();
		new MemberDao().recommendContentUp(conn, bNo);
		close(conn);
	}
	public void recommendReplyUp(int rNo) {
		Connection conn = getConnection();
		new MemberDao().recommendReplyUp(conn, rNo);
		close(conn);
	}
	public void reportReplyUp(int rNo) {
		Connection conn = getConnection();
		new MemberDao().reportReplyUp(conn, rNo);
		close(conn);
	}
	public void reportContentUp(int bNo) {
		Connection conn = getConnection();
		new MemberDao().reportContentUp(conn, bNo);
		close(conn);
	}
	
	public int insertNoImgProfile(int userNo) {
		int result = 0;
		Connection conn = getConnection();
		result = new MemberDao().insertNoImgProfile(conn,userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public boolean isEmail(String emailcheck) {
		Connection conn = getConnection();
		boolean result = false;
		result = new MemberDao().isEmail(conn, emailcheck);
		close(conn);

		return result;

	}

}
