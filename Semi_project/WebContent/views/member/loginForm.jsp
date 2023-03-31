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
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="input-form-backgroud row">
    <div class="input-form col-md-12 mx-auto">
    <div id="login-wrap">
        <div id="login-form">
            <form action="<%= request.getContextPath() %>/login.me" method="post">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
           <p><b>환영합니다.</b></p>
           <p class="guide">KH TIME은 KH교육원 학생을 위한 지식 공유 플랫폼입니다.</p>
           <input type="text" id="login-id" name="login-id" placeholder="아이디를 입력해주세요!" required> <br>
           <input type="password" id="login-pwd" name="login-pwd" placeholder="비밀번호를 입력해주세요!" required> <br>
           <button class="btn btn-primary btn-sm" id="login-form-btn">로그인</button>
           
            <div id="searchId"><a href="<%= request.getContextPath() %>/searchId.me">아이디/비밀번호 찾기</a></div>
           <br>
            <p class="guide">아직 회원이 아니신가요?</p>
            <a href="<%= request.getContextPath() %>/enroll.me">회원가입</a>
        </form>
           
       
</div></div></div>
    </div>
    
<script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>