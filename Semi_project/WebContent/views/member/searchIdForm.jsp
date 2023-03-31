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
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="input-form-backgroud row">

    <div class="input-form col-md-12 mx-auto">
        <div id="searchId-form">
            <form action="<%= request.getContextPath() %>/searchId.me" method="post">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
	           <p><b>아이디 찾기</b></p>
	           <p class="guide">회원가입 시 입력한 이름과 이메일 주소를 입력하시면, <br>
	            아이디 조회가 가능합니다.</p>
	           <input type="text" name="login-name" placeholder="이름을 입력해주세요!" required> <br>
	           <input type="email" name="login-email" placeholder="이메일을 입력해주세요!" required> <br>
	           <button class="btn btn-primary btn-sm" id="searchIdbtn">아이디 찾기</button> <br><br>
	            
	            <p class="guide">비밀번호가 기억나지 않으신가요?</p>
	            <a href="<%= request.getContextPath() %>/searchPwd.me">비밀번호 찾기</a>
      	  </form>
           
       
</div></div>
    </div>  
   
    <script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>