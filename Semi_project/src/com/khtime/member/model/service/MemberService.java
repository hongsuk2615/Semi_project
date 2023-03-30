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

			int random = (int) (Math.random() * 5 + 10);
			String newPwd = CommonMethod.getRamdomPassword(random);

			result = new MemberDao().updatePwd(conn, userId, newPwd);
			CommonMethod.sendNewPwd(userEmail, newPwd);
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

}
