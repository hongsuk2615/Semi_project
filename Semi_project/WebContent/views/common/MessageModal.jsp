<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/CSS/msgModal.css">
<title>Insert title here</title>
</head>
<body>
	<%if(loginUser != null){ %>
	<div id="msgModal">
		<ul id="msgul"></ul>
	</div>
	
	
				 <script>		
               	  function messageModal(){
               		  console.log('모달이에요');
               		$.ajax({
               			url : "<%=request.getContextPath()%>/msgModal.do",
               			success : function(result){
               				console.log(result);
               				let msg = "";
               				$('#msgul').html('');
               					for(let m of result){
               						msg = `<li><div style="font-weight : bold;">\${m.userName} 님의 메세지 
               						</div> <br> <div style="color : #676363; font-size : 13px" >\${m.content}<br></div></li>`;
               						
               				$('#msgul').append(msg);
               				$('#msgul').fadeIn();
               					}		     
               					setTimeout(function(){
               					  	$('#msgul').fadeOut();  
               					
               					},3000)
               			}
               			});
               		} 
                 setInterval(messageModal ,7000);  
               	messageModal()
               	    
                </script>
	<%} %>
</body>
</html>