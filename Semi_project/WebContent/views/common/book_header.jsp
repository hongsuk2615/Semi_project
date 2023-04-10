<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="resources/CSS/book_main.css"> -->
<link rel="stylesheet" href="resources/CSS/book_header.css">
</head>
<body>
  <div id="book-header">
            <div id="book-header-content">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
                <div id="book-logo">
                    <img src="resources/IMG/book.png" alt="" style="height: 120px; width: 160px;">중고 책방
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
        location.href = "<%= request.getContextPath() %>";
    })
    
    </script>
</body>
</html>