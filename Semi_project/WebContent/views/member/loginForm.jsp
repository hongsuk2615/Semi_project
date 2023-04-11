<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
	String userId = (String)request.getAttribute("userId") == null ? "" : (String)request.getAttribute("userId");
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/CSS/loginform.css">
    <link rel="stylesheet" href="resources/CSS/base.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<% if( alertMsg != null && !alertMsg.equals("")) { %>
			<script> alert("<%= alertMsg %>")</script>
			<% request.getSession().setAttribute("alertMsg",""); %>
		<% } %>
	
    <div class="input-form-backgroud row">
    <div class="input-form col-md-12 mx-auto">
    <div id="login-wrap">
        <div id="login-form">
    	   <form> 
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
           <p><b>환영합니다.</b></p>
           <p class="guide">KH TIME은 KH교육원 학생을 위한 지식 공유 플랫폼입니다.</p>
           <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력해주세요!" value="<%=userId%>" required> <br>
           <input type="password" id="loginPwd" name="loginPwd" placeholder="비밀번호를 입력해주세요!" onkeyup="checkCapsLock(event)" required>
           <div style="visibility : hidden" id='message'><span style="color:red">Caps Lock이 켜져 있습니다!</span></div>
           <button type="button" onclick="login()" class="btn btn-primary btn-sm" id="login-form-btn">로그인</button>
           <% if(userId.isEmpty()) { %>
           <input type="checkbox" id="keepId">로그인 유지
           <% }else{ %>
            <input type="checkbox" id="keepId" checked="checked">로그인 유지
            <% } %>
            <div id="searchId"><a href="<%= request.getContextPath() %>/searchId.me">아이디/비밀번호 찾기</a></div>
           <br>
            <p class="guide">아직 회원이 아니신가요?</p>
            <a href="<%= request.getContextPath() %>/enroll.me">회원가입</a>
      	  </form>  
           
       
</div></div></div>
    </div>
  
    <script>
    	function login(){
    		$.ajax({
				url : "<%=request.getContextPath()%>/login.me",
				type : "post",
				data :{
					loginId :  $("#loginId").val(),
					loginPwd :  $("#loginPwd").val(),
					keepId : $("#keepId").prop('checked') ? 'Y' : 'N',
					userId : "<%=userId%>"
				}, 
				success : function(result){
					switch(result){
					case '0' : alert("아이디나 비번이 맞지 않습니다!");  $("#loginId").val(""); $("#loginPwd").val("");break;
					case '1' : location.href="<%= request.getContextPath()%>"; break;
					case '2' : alert("밴된 유저입니다!"); location.href="<%= request.getContextPath()%>"; break;
					case '3' : alert("승인되지않은 아이디입니다!"); location.href="<%= request.getContextPath()%>"; break;
					case '4' : alert("탈퇴한 유저입니다!"); location.href="<%= request.getContextPath()%>"; break;
					
					}
				}, error : function(){
					console.log("ajax통신실패")
				}
			})
    	}
    	
    	function checkCapsLock(event)  {
	   		if (event.getModifierState("CapsLock")) {
	   			$("#message").attr("style", "visibility : visible");
	   		 }else {
   				 $("#message").attr("style", "visibility : hidden");
	    		}
    		}
    
    </script>
<script type="text/javascript" src="resources/JS/homelogo.js"></script>
</body>
</html>