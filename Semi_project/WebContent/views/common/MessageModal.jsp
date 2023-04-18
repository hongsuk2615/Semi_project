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
	<div id="msgModal">
		<ul id="msgul"></ul>
	</div>
	
	
				 <script>		
               	  function messageModal(){
               		$.ajax({
               			url : "<%=request.getContextPath()%>/msgModal.do",
               			success : function(result){
               				console.log(result);
               				let msg = "";
               					for(let m of result){
               						msg = `<li><div>\${m.userName} 님의 메세지 
               						</div> <br> <div >\${m.content}<br></div></li>`;
               						
               				$('#msgul').append(msg);
               					}		     
               					setTimeout(function(){
               					 	$('#msgul').fadeOut();
               					
               					},3000)
               			}
               			});
               		} 
               	 /* setInterval(1000);	  */
               	messageModal();     
                </script>

</body>
</html>