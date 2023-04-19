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

import com.khtime.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter({"/enrollManagement.do","/approveMakeBoard.do","/boardreq.do","/approveEnroll.do","/management.do","/reportedBoard.do","/reportedUsers.do","/banUser.do","/usermanagement.do","/whiteList.do"})
public class AdminLoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminLoginCheckFilter() {
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
		}else if(((Member)session.getAttribute("loginUser")).getAuthority() != 0){
			session.setAttribute("alertMsg", "관리자가 아닙니다.");
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/mainPage.do");
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
