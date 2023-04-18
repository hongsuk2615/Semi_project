<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/header.css">
     <link rel="stylesheet" href="resources/CSS/khalertmodal.css">
    <title>Document</title>
</head>
<body>
 <%@ include file="../common/khalertmodal.jsp" %>
 <script type="text/javascript" src="resources/JS/khalertmodal.js"></script>
	<% if( alertMsg != null && !alertMsg.equals("")) { %>
		<script> khalert("<%= alertMsg %>")</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="<%= request.getContextPath()%>/resources/IMG/로고이미지.png" alt="로고이미지">
            </div>
            <div id="navbar">
                <div id="approveEnroll">회원가입 승인</div>
                <div id="reportedBoards">신고게시물 관리</div>
                <div id="boardReq">게시판 생성 승인</div>
                <div id="userManagement">유저관리</div>
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
        document.getElementById("approveEnroll").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>/enrollManagement.do";
	    })
        document.getElementById("reportedBoards").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>/reportedBoard.do";
	    })
        document.getElementById("boardReq").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>/boardreq.do";
	    })
        document.getElementById("userManagement").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>/usermanagement.do";
	    })
	    document.getElementById("logout-btn").addEventListener("click",function(){
	    	location.href = "<%= request.getContextPath()%>/logout.me";
	    })
        
        

    </script>
</body>
</html>