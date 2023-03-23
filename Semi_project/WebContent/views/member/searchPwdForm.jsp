<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/CSS/searchPwdform.css">
</head>
<body>
    
    <div id="searchPwd-wrap">
        <div id="searchPwd-form">
            <form action="<%= request.getContextPath() %>/searchPwd.me" method="post">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
           <p>비밀번호 찾기</p>
           <p>회원가입 시 입력한 이름과 이메일 주소를 입력하시면,<br>
            해당 이메일로 비밀번호를 전송해드립니다.
           </p>
           <input type="text" id="login-id" placeholder="아이디 입력"> <br><br>
           <input type="text" id="login-email" placeholder="이메일 입력"> <br><br>
           <button id="submit-email">메일 전송</button> <br><br>
            
        </form>
       
</div>
    </div>
    
    <script>
    
    document.getElementById("submit-email").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/searchPwd.me";
    }) // 이메일 전송 -> 비밀번호찾기서블릿 이동

    
    </script>
    <script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>