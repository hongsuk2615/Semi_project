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
       <link rel="stylesheet" href="resources/CSS/khalertmodal.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
     <div class="input-form-backgroud row">

    <div class="input-form col-md-12 mx-auto">
        <div id="searchPwd-form">
            <form id="pwdsubmit" action="<%= request.getContextPath() %>/searchPwd.me" method="post">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
           <p><b>비밀번호 찾기</b></p>
           <p class="guide">회원가입 시 입력한 이름과 이메일 주소를 입력하시면,<br>
            해당 이메일로 비밀번호를 전송해드립니다.
           </p>
           <input type="text" id="loginId" login-id" placeholder="아이디를 입력해주세요!"> <br>
           <input type="email" id="loginEmail" name="login-email" placeholder="이메일을 입력해주세요!"> <br><br>
           <button type="button" class="btn btn-primary btn-sm" onclick="isEmpty();" id="submit-email">메일 전송</button> <br>
            
        </form>
       
</div>
    </div>
     </div>
     
    <script>
    	function isEmpty(){
    		 if($("#loginId").val() == ''){
				khalert("아이디를 입력해주세요!");
				$("#loginId").focus();
				return false;
			}
    		if($("#loginEmail").val() == ''){
				khalert("이메일을 입력해주세요!");
				$("#loginEmail").focus();
				return false;
			}else{
    		document.getElementById('pwdsubmit').submit();
			}
    	}
    </script>
     <%@ include file="../common/khalertmodal.jsp" %>
    <script type="text/javascript" src="resources/JS/khalertmodal.js"></script>
    <script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>