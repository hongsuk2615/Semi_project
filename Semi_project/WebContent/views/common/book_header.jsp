<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="resources/CSS/book_header.css">
</head>
<body>
	<% if( alertMsg != null && !alertMsg.equals("")) { %>
		<script> alert("<%= alertMsg %>")</script>
		<% request.getSession().setAttribute("alertMsg",""); %>
	<% } %>
  <div id="book-header">
            <div id="book-header-content">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
                <div id="book-logo" style="font-weight: 1000;">
                    <img src="resources/IMG/책방로고.png" alt="" style="height: 90px; width: 120px;">중고 책방
                </div>
                <div id="book-header-right">
                    <% if(loginUser == null){%>
                    <button id="login-btn">로그인</button>
                    <button id="enrollment-btn">회원가입</button>
               		<% } else { %>
                    <button id="message-btn"></button>
                    <button id="mypage-btn"></button>
                	<% } %>
                </div>
            </div>
        </div>
        
    <script>
    
    document.getElementById("home-logo").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/mainPage.do";
    })
    
   	<% if(loginUser == null) {%> 
        document.getElementById("login-btn").addEventListener("click",function(){
          location.href = "<%= request.getContextPath() %>/login.me";
        })

        document.getElementById("enrollment-btn").addEventListener("click",function(){
            location.href = "<%= request.getContextPath() %>/enroll.me";
        })
	<% }  else { %>
		document.getElementById("message-btn").addEventListener("click",function(){
	      	location.href = "<%= request.getContextPath() %>/msgbox.me";
	  	})
	  	
	  	document.getElementById("mypage-btn").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>/myPage.me";
	   	})
	<% } %>
   	
    </script>
    
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
    	AOS.init();
    </script>
</body>
</html>