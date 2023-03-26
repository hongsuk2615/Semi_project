package com.khtime.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.khtime.common.model.vo.MyFileRenamePolicy;
import com.khtime.member.model.service.MemberService;
import com.khtime.member.model.vo.Member;
import com.khtime.member.model.vo.UserProFileImg;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EnrollmentController
 */
@WebServlet("/enroll.me")
public class EnrollmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EnrollmentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("views/member/enrollmentForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (ServletFileUpload.isMultipartContent(request)) {

			// 1) 인코딩작업
//			// 1_1. 전송용량제한
			int maxSize = 10 * 1024 * 1024;
//			
//			// 1_2. 저장할 폴더의 물리적 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/member/userProfileImg");
//			
//			// 2. 전달된 파일명 수정작업후 서버에 업로드
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			// 2) 요청시 전달값을 뽑아서 변수, 객체에 기록해줄것
			String userId = multi.getParameter("userId"); // 필수값
			String userPwd = multi.getParameter("userPwd1"); // 필수값
			String userClass = multi.getParameter("class"); //
			String userName = multi.getParameter("userName"); // 필수값
			String nickName = multi.getParameter("nick-name"); //
			String email = multi.getParameter("email"); //
			int authority = Integer.parseInt(multi.getParameter("TeacherStudent"));

//			email = AEScryptor.encrypt(email);

			// 전달받은 파라미터를 가지고 Member클래스로 만들어 주기
			Member m = new Member(userId, userPwd, userClass, userName, nickName, email, authority);
			System.out.println(m);
			// 3) 요청 처리(서비스 메서드 호출 결과값 돌려 받기)
			int result1 = new MemberService().insertMember(m);
			
			int userNo = new MemberService().selectMember(userId);
			
			String key = "file";

			int result2 = 0;
			if (multi.getOriginalFileName(key) != null) {// 넘어온 첨부파일이 있는 경우
				// 첨부파일이 있는 경우
				// Attachment 객체 생성 + 원본명, 수정명, 저장경로 + 파일레벨 담기.
				// list에 추가
				UserProFileImg upfi = new UserProFileImg();
				upfi.setOriginName(multi.getOriginalFileName(key));
				upfi.setChangeName(multi.getFilesystemName(key));
				upfi.setFilePath("/resources/member/userProfileImg");
				result2 = new MemberService().insertUserProFileImg(userNo, upfi);

			} else {
				result2 = 1;
			}
			
			if(result1 > 0 && result2 > 0) {
				request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다.");
				response.sendRedirect(request.getContextPath());	
			} else if (result1 < 0) {
				request.getSession().setAttribute("alertMsg", "회원가입에 실패했습니다 : 개인정보기입값오류");
				response.sendRedirect(request.getContextPath()+"/enroll.me");
			} else if (result2 < 0 ) {
				request.getSession().setAttribute("alertMsg", "회원가입에 실패했습니다 : 프로필사진오류");
				response.sendRedirect(request.getContextPath()+"/enroll.me");
			}

		}
	}

}
