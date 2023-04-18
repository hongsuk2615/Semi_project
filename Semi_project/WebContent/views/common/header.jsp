<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.member.model.vo.Member"%>
<%@ page import="com.khtime.message.model.vo.Message"%>
<% 

	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>  
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/khalertmodal.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="resources/JS/studyTime.js"></script>
	<script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <title>Document</title>
</head>
<body>
<%@ include file="khalertmodal.jsp" %>
 <script type="text/javascript" src="resources/JS/khalertmodal.js"></script>
	<% if( alertMsg != null && !alertMsg.equals("")) { %>
		<script> khalert("<%= alertMsg %>")</script>
		<% request.getSession().setAttribute("alertMsg",""); %>
	<% } %>
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="<%= request.getContextPath()%>/resources/IMG/로고이미지.png" alt="로고이미지">
            </div>
            <div id="navbar">
                <div id="boardsearch">게시판</div>
                <div id="friendlist">친구목록
                <div id="friendcount1">
                <div id="friendcount"></div>
                </div>
                </div>
                <div id="bookstore">중고책방</div>
                <div id="todolist">To Do List</div>
                <% if(loginUser != null && loginUser.getAuthority()==0) { %>
                <div id="management">관리</div>
                <% } %>
               

                
            </div>
            <div id="header-right">
                <% if(loginUser == null){%>
                    <button id="login-btn">로그인</button>
                    <button id="enrollment-btn">회원가입</button>
                <% } else { %>
                	<div id="message-btn"><!-- $('#msgcount').text(''); -->
                    	<div id="msgcount1"></div>   
                    </div>           
                   <script>
                	 function friendCount(){
               		$.ajax({
               			url : "<%= request.getContextPath()%>/friendplus.do",
               			success : function(result){
               				if(result > 0){
               					$("#friendcount1").css('display','flex');
               				
               				$('#friendcount').text("+"+result);
               				}
               			}
               			});
               		}
               	/* setInterval(,1000);	 */
               		friendCount();
              </script>
                	<script>

                	 function messageCount(){
                		$.ajax({
                			url : "<%= request.getContextPath()%>/msgplus.do",
                			success : function(result){
                				if(result > 0){
                					console.log(result);
                				$('#msgcount1').text("+"+result) .css('display','flex') ;
                				}else{
                					 $('#msgcount1').text('').css('display', 'none');
                					
                				}
                			}
                			});
                		} 
                	/* setInterval(,1000);	 */
                	messageCount();      
                	</script>
                    
                    <button id="mypage-btn"></button>
                <% } %>
            </div>
        </div>
    </div>

    <script>
   
    		
  		document.getElementById("boardsearch").addEventListener("click",function(){
      	 	location.href = "<%= request.getContextPath() %>/board.me";
  		}) 
	    document.getElementById("friendlist").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>/friend.me";
	    }) 
    
	    document.getElementById("home-logo").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>";
	    })
	  
  		
        <% if(loginUser == null) {%> 
        document.getElementById("login-btn").addEventListener("click",function(){
          
          location.href = "<%= request.getContextPath() %>/login.me"; 
         
        })

        document.getElementById("enrollment-btn").addEventListener("click",function(){
            location.href = "<%= request.getContextPath() %>/enroll.me";
        })
        <% } else if(loginUser.getAuthority() == 0) { %>
            
            document.getElementById("management").addEventListener("click",function(){
                location.href = "<%= request.getContextPath() %>/management.do";
            })
        <% }else{ %>
	        document.getElementById("mypage-btn").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath() %>/myPage.me";
	        })
		<% } %>
		document.getElementById("todolist").addEventListener("click",function(){
            location.href = "<%= request.getContextPath() %>/todolist.me";
        })
        
        document.getElementById("bookstore").addEventListener("click",function(){
            location.href = "<%= request.getContextPath() %>/bookstore.do";
        })
	
        document.getElementById("mypage-btn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/myPage.me";
   		 })
   		 
   		   document.getElementById("message-btn").addEventListener("click",function(){
      	 	location.href = "<%= request.getContextPath() %>/msgbox.me";
  		}) 
 		/* 
  		function msgcheck(){
  		$('#msgcount').text('vdvddvdvv');
		} */	   
  		</script>
  		 
  		
</body>
</html>