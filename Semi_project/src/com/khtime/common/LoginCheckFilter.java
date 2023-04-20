package com.khtime.common;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter({"/myPage.me","/deleteMember.me","/updateEmail.me","/updateNickName.me","/updatePwd.me","/PrivacyPolicyController.me","/deteleReqBoard.me","/reqBoard.me","/TeenagerPolicyController.me","/TermsOfUseController.me","/msgbox.me","/sendMsg.me","/booksell.do","/bookselllist.do","/bookdelete.do","/bookinsert.do","/booksellsearch.do","/booksoldout.do","/bookupdateform.do","/mybookdetail.do","/study.me","/friend.me","/boardreq.me","/board.me","/todolist.me","/boardDetail.bo","/delete.bo","/contentDetail.bo","/insert.bo","/recommend.bo","/content.re","/report.bo","/scrap.bo","/deletescrap.bo","/update.bo","/delete.re","/insert.re","/recommend.re","/report.re","/select.re","/myComments.bo","/myScrap.bo","/myWriting.bo","/boDetail.","/best.bo","/boDetailSearch.do"})
public class LoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		if(session == null || session.getAttribute("loginUser") == null) {
			session.setAttribute("alertMsg", "로그인후 이용하실수 있습니다.");
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/login.me");
		}else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
