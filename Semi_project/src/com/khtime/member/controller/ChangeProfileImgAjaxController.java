package com.khtime.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khtime.common.model.MyFileRenamePolicy;
import com.khtime.member.model.service.MemberService;
import com.khtime.member.model.vo.Member;
import com.khtime.member.model.vo.UserProFileImg;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ChangeProfileImgAjaxController
 */
@WebServlet("/changProfileImg.me")
public class ChangeProfileImgAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProfileImgAjaxController() {
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
		int maxSize = 1024 * 1024 * 10;
		String savePath = request.getSession().getServletContext().getRealPath("/resources/member/userProfileImg");
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new MyFileRenamePolicy());
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		UserProFileImg img = new UserProFileImg();
		img.setRefUserId(loginUser.getUserNo());
		img.setOriginName(multi.getOriginalFileName("profileImg"));
		img.setChangeName(multi.getFilesystemName("profileImg"));
		img.setFilePath("/resources/member/userProfileImg/");
		
		int result = new MemberService().changeProfileImg(img);
		if(result > 0 ) {
			loginUser.setUserProfile(img.getFilePath()+img.getChangeName());
			request.getSession().setAttribute("loginUser", loginUser );
		}else {
			
		}
	}

}
