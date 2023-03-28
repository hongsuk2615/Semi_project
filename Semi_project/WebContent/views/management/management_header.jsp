<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.member.model.vo.Member"%>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");

%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <title>Document</title>
</head>
<body>
	<% if(alertMsg != null && !alertMsg.equals("")){ %>
			<script>
				alert('<%=alertMsg%>');
			</script>
				
	<% } %>
	<% session.setAttribute("alertMsg", ""); %>
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="<%= request.getContextPath()%>/resources/IMG/로고이미지.png" alt="로고이미지">
            </div>
            <div id="navbar">
                <div>회원가입 승인</div>
                <div>신고게시물 관리</div>
                <div>게시판 생성 승인</div>
                <div>유저관리</div>
            </div>
            <div id="header-right">
                <button id="logout-btn">로그아웃</button>
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