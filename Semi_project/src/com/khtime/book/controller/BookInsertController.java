package com.khtime.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.khtime.book.model.vo.Book;
import com.khtime.book.model.vo.BookAttachment;
import com.khtime.common.model.vo.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BookInsertController
 */
@WebServlet("/BookInsertController")
public class BookInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) { 
//			System.out.println("잘 실행 됩니까?");
			
			// 파일 업로드를 위한 라이브러리 cos.jar
			
			// 1. 전송되는 파일을 처리 할 작업 내용(전송되는 파일의 용량제한 , 전달된 파일을 저장 할 경로)
			// 1-1. 전송파일 용량제한(int maxSize => byte단위로 값을 기술 해야함.) 우리는 10Mbyte로 제한 할 예정
			/*
			 * 단위정리
			 * byte -> kbyte -> mbyte -> gbyte -> tbyte -> ...
			 * 1kbyte -> 1024byte (2의 10승)
			 * 1mbyte -> 1024kbyte -> 1024byte * 1024byte -> (2의 20승)
			 */
			int maxSize = 1024 * 1024 * 10;
			
			// 1-2. 전달된 파일을 저장할 서버의 폴더경로 알아내기(String savePath)
			/*
			 * 세션객체에서 제공하는 getRealPath메소드를 통해 알아낼 예정.
			 * 다만 WebContents 폴더로부터 board_upfiles 폴더까지의 경로는 매개변수로 제시 해 줘야한다.
			 * 그리고 결론적으로는 board_upfiles 폴더 내부에 파일들이 저장 될 것이기 때문에 /를 마지막에 붙여줘야 한다.
			 */
			String savePath = request.getSession().getServletContext().getRealPath("/resources/book_upfile/");
//			System.out.println(savePath);
			
			
			/*
			 * 2. 전달 된 파일명 수정 및 서버에 업로드 작업.
			 * - HttpServletRequest request => MultipartRequest multi 로 변환
			 * 
			 * 매개변수 생성자로 생성(cos.jar에서 제공하는 객체)
			 * MultipartRequest multi = new MultipartRequest(request 객체, 저장 할 폴더 경로, 용량제한, 인코딩값
			 * 	파일명을 수정시켜 주는 객체);
			 * 
			 * 위 구문 한 줄 실행만으로 넘어온 첨부파일들이 해당 폴더에 업로드 됨.
			 * 그리고 사용자가 올린 파일명은 그대로 해당 폴더에 업로드 하지 않는게 관례
			 * - 같은 파일명이 있을 경우 덮어 씌워지거나 에러가 날 수 있고, 한글/ 특수문자/ 띄어쓰기가 포함된 파일명일 경우 사용하는
			 * 서버에 따라 에러가 발생할 수 있기 때문. 따라서 파일명은 반드시 변환 시켜줘서 업로드 할 예정
			 * 
			 * 기본적으로 파일명 수정작업을 해주는 객체
			 * - DefaultFilenamePolicy 객체(cos.jar에서 제공)
			 * - 내부적으로 rename() 이라는 메소드가 실행이 되면서 파일명이 수정됨.
			 * - 기본적으로 동일한 파일명이 존재 할 경우 파일명 뒤에 카운팅된 숫자를 붙여서 유니크한 파일명을 만듦.
			 * 	 ex) aaa.jpg, aaa1.jpg, aaa2.jpg	.... 
			 * 
			 * 	- 절대 파일명이 안겹치게끔 rename 해볼 예정.
			 * 	- 즉, DefaultFilenmaePolicy객체는 사용하지 않음.
			 * 내 입맛대로 나만의 파일명 생성 규칙을 만들어서 파일 이름을 바꿔주는 객체를 만들어 보기.
			 * 
			 */
			MultipartRequest multi = new MultipartRequest(request , savePath , maxSize, "UTF-8",
			new MyFileRenamePolicy());
			
			// 3. DB에 기록 할 데이터들을 뽑아서 Attachment객체에 담기, Board객체에 각각 담아주기
			// - 카테고리 번호 , 제목, 내용, 작성자 번호를 뽑아서 Board에 Insert
			// - 넘어온 첨부파일이 있다면, 원본명, 수정명, 폴더의 경로를 뽑아서 Attachment 테이블에 Insert
			String category = multi.getParameter("category");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			
			String boardWriter = ((Book) request.getSession().getAttribute("seller")).getBookNo()+"";
			
			Board b = new Board();
			
			b.setCategory(category);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setBoardWriter(boardWriter);
			
			BookAttachment at = null; // 처음에는 null값으로 초기화 시키고 , 실제로 사용자가 첨부파일을 업로드 했을때만 객체 생성
			
			// 첨부파일이 있을 경우 원본명을 반환해주고, 없을경우 null을 반환해줌
			if(multi.getOriginalFileName("upfile") != null ) { 
				at = new BookAttachment();
				at.setOriginName( multi.getOriginalFileName("upfile") ); // 원본명
				at.setChangeName( multi.getFilesystemName("upfile")); // 수정명(실제 서버에 업로드 된 파일명)
				at.setFilePath("resources/board_upfiles/");
			}
			
			// 4. 서비스 요청
			int result = new BookService().insertBoard(b , at);
			
			if(result > 0) { // 성공적으로 작성 => 최신 글 목록으로 이동
				
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath()+"/list.bo?currentPage=1");
			} else { // 실패 시 에는 -> 첨부파일이 있었을 경우 이미 업로드된 첨부파일을 삭제해 주기(용량만 차지함)
				
				if(at != null) {
					// 삭제시키고자 하는 파일객체 생성 후 delete 메소드 호출 시 파일이 삭제된다.
					new File(savePath+at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "전송방법이 잘못 되었습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("errorMsg", "전송방법이 잘못 되었습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}
	}

}