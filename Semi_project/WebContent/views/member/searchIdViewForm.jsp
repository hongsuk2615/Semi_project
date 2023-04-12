<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userId = (String)request.getAttribute("userId"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/CSS/searchIdviewform.css">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
       <div class="input-form-backgroud row">
    <div class="input-form col-md-12 mx-auto">
    <div id="searchId-wrap">
        <div id="searchId-form">
            <form action="<%= request.getContextPath() %>/login.me">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
                <br><br>
           <p class="guide">고객님의 아이디는</p>
           <p ><b><%= userId %></b></p>
           <p class="guide">입니다.</p>

           
          <div id="btn"> 
          	<button class="btn btn-primary btn-sm" id="login-form-btn">로그인</button>
            <button class="btn btn-primary btn-sm" type="button" id="goto-searchPwd">비밀번호 찾기</button>
           </div>
           <br><br>
        
            
            <p class="guide">아직 회원이 아니신가요?</p>
             <a href="<%= request.getContextPath() %>/enroll.me">회원가입</a>
 
        
        </form>
             
         
       
</div>
    </div>
    </div></div>
     <script>
    
	    document.getElementById("goto-searchPwd").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath()%>/searchPwd.me";
	    })
	    
     </script>
     <script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>