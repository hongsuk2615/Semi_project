<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/CSS/searchIdform.css">
</head>
<body>
    
    <div id="searchId-wrap">
        <div id="searchId-form">
            <form action="<%= request.getContextPath() %>/searchId.me" method="post">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
           <p>아이디 찾기</p>
           <p>회원가입 시 입력한 이름과 이메일 주소를 입력하시면, <br>
            아이디 조회가 가능합니다.</p>
           <input type="text" name="login-name" placeholder="이름 입력"> <br><br>
           <input type="text" name="login-email" placeholder="이메일 입력"> <br><br>
           <button id="searchIdbtn">아이디 찾기</button> <br><br>
            
        </form>
           
            <span>비밀번호가 기억나지 않으신가요?</span>
            <a href="<%= request.getContextPath() %>/searchPwd.me">비밀번호 찾기</a>
       
</div>
    </div>
    <script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>