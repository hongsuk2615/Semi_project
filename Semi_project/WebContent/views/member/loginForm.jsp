<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/CSS/loginform.css">
    <link rel="stylesheet" href="resources/CSS/base.css">
</head>
<body>
    
    <div id="login-wrap">
        <div id="login-form">
            <form action="<%= request.getContextPath() %>/login.me" method="post">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
           <p>환영합니다.</p>
           <p>커뮤니티입니다.</p>
           <input type="text" id="login-id" name="login-id" placeholder="아이디 입력"> <br><br>
           <input type="text" id="login-pwd" name="login-pwd" placeholder="비밀번호 입력"> <br><br>
           <button id="login-form-btn">로그인</button> <br>
            <div id="searchId">
            <div><a href="<%= request.getContextPath() %>/searchId.me">아이디/비밀번호 찾기</a></div>
            </div>
        </form>
            <p>아직 회원이 아니신가요  <a href="<%= request.getContextPath() %>/enroll.me">회원가입</a></p>
           
       
</div>
    </div>
    
<script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>