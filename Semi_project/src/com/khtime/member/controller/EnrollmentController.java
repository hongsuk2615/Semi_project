package com.khtime.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.khtime.common.model.MyFileRenamePolicy;
import com.khtime.common.model.AEScryptor;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("views/member/enrollmentForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1_1. 전송용량제한
			int maxSize = 10*1024*1024;
			
			// 1_2. 저장할 폴더의 물리적 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumb_upfiles/");
			
			// 2. 전달된 파일명 수정작업후 서버에 업로드
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
					
			// 3. db에 저장
			// Board에 들어갈 값들 뽑아오기
			
			
			//Attachment 테이블에 여러번 insert할 데이터를 뽑기
			// 단, 여러개의 첨부파일이 있을 것이기 때문에 attachment 객체들을 ArrayList에 담을 예정 => 반드시 1개이상은 담김(대표이미지)
			ArrayList<UserProFileImg> list = new ArrayList(); 
			
				String key = "file" ;
				
				if(multi.getOriginalFileName(key) != null) {// 넘어온 첨부파일이 있는 경우
					//첨부파일이 있는 경우
					// Attachment 객체 생성 + 원본명, 수정명, 저장경로 + 파일레벨 담기.
					// list에 추가
					UserProFileImg upfi = new UserProFileImg();
					upfi.setOriginName(multi.getOriginalFileName(key));
					upfi.setChangeName(multi.getFilesystemName(key));
					upfi.setFilePath("/resources/thumb_upfiles/");
//					upfi.setFileLevel(i);
					
					list.add(upfi);					
				}
				
		
			int result = new MemberService().insertThumbnailMember(list);
			
			
			
		// 1) 인코딩작업
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청시 전달값을 뽑아서 변수, 객체에 기록해줄것
		String userId = request.getParameter("userId"); // 필수값
		String userPwd = request.getParameter("userPwd"); // 필수값
		String userClass = request.getParameter("userClass"); // 
		String userName = request.getParameter("userName"); // 필수값
		String nickName = request.getParameter("nickName"); // 
		String email = request.getParameter("email"); // 
	
		
		email = AEScryptor.encrypt(email);
	
		
		// 전달받은 파라미터를 가지고 Member클래스로 만들어 주기
		Member m = new Member(userId, userPwd, userClass, userName, nickName, email);
		
		// 3) 요청 처리(서비스 메서드 호출 결과값 돌려 받기)
		int result2 = new MemberService().insertMember(m);
		
		// 4) 처리 결과를 가지고 사용자가 보게될 응답화면을 지정
		if(result > 0) { // 성공 => /jspproject (url 재요청방식)
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다.");
			response.sendRedirect(request.getContextPath());
		}else { // 실패 => 에러페이지(포워딩 방식)
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}
}
	
}
