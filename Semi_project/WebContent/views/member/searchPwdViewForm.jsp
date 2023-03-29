<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/CSS/searchPwdviewform.css">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
     <div class="input-form-backgroud row">

    <div class="input-form col-md-12 mx-auto">
        <div id="searchPwd-form">
      <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div><br>
                
               
                <% if((boolean)request.getAttribute("emailCheck") == true ){%>
           <p><b>메일 전송 완료</b></p>
           <button class="btn btn-primary btn-sm" id="login-form-btn">로그인</button> <br>
            <script>
    
			document.getElementById("login-form-btn").addEventListener("click",function(){
       		 location.href = "<%= request.getContextPath() %>/login.me";
   			 })
   			 </script>
   			 
           <% }else{ %>
           
           <p><b>메일 전송 실패</b></p>
           
           <button class="btn btn-primary btn-sm" id="searchPwd-form-btn">다시 비밀번호찾기 폼으로 이동</button> <br>
           
            <script>
    
   				 document.getElementById("searchPwd-form-btn").addEventListener("click",function(){
  		      location.href = "<%= request.getContextPath() %>/login.me";
  		  }) 
    
  			  </script>
    
        	<% } %>
     
       
		</div></div></div>
   
    <script type="text/javascript" src="resources/JS/homelogo.js"></script>
    
</body>
</html>