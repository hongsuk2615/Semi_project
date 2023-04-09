<%@page import="com.sun.mail.handlers.message_rfc822"%>
<%@ page import="java.util.ArrayList,com.khtime.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
%>
<%
	ArrayList<Member> list2 = (ArrayList<Member>) request.getAttribute("list2");
%>
<%
	ArrayList<Member> list3 = (ArrayList<Member>) request.getAttribute("list3");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/body.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/requestfriend.css">
<link rel="stylesheet" href="resources/CSS/base.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>KH_TIME 메인페이지</title>
</head>
<style>
    /*  {
        border: 1px solid rgba(128, 128, 128, 0.568);
    } */
div {
	display: inline-block;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: black;
}

#wrapper {
	width: 100%;
	min-width: 1180px;
}
</style>

<body>
<body>
	<div id="wrapper">
		<%@ include file="../common/header.jsp"%>
	</div>
	<div id="body">
		

		<div id="content">
			<form id="boardmake">
				<div>
					<div>
						<input placeholder="아이디로 친구요청을 보내세요!" type="text" name="userId"
							id="userId" required>
					</div>
					<button type="button" class="btn btn-primary" onclick="idCheck2();">검색</button>
					<br>
				</div>
				<br>
				<div id="keyword">

					<!-- 친구 목록-->
						<div id="friends">
						<% if(list.size() == 0){ %>
							친구를 추가해보세요!
						<%}%>
						<%
							for (Member m : list) {
						%>
						<div>
							<div><%=m.getUserName()%></div>
							<div>				
							<button type="button" class="delete" onclick="deny(this);" data-userNo=<%=m.getUserNo() %> >삭제</button>
							<button type="button" class="sendMessage" onclick="Message(this);" data-userNo=<%=m.getUserNo() %> >쪽지보내기</button>
							</div>	
						</div>
					<%
						}
					%>
					</div>

						<div id="friendsSend">
							<% if(list2.size() == 0){ %>
								친구 요청 목록이 없습니다.
							<%}%>
						<!-- 친구  요청 목록-->

						<%
							for (Member m : list2) {
						%>
						<div>
							<div style="color: rgb(71, 174, 192);"><%=m.getUserName()%></div>님에게 친구요청을 보냈습니다.
						</div>	
						

						<%
							}
						%>

					</div>
					<!-- 친구  요청 받은 목록-->

					<div id="friendsReq">
						<% if(list3.size() == 0){ %>
							요청받은 목록이 없습니다.
						<%}%>
					<%
						for (Member m : list3) {
					%>
						<div>
							<div class="sendName" style="color :rgb(71, 93, 192)" ><%=m.getUserName()%></div>님이 친구요청을 했습니다.
						</div>	
						<div>
							<button type="button" class="accept" onclick="accept(this);" data-userNo=<%=m.getUserNo() %> >수락</button>
							<button type="button" class="deny" onclick="deny(this);" data-userNo=<%=m.getUserNo() %> >거절</button>
						</div>
					
					<%
						}
					%>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="footer"></div>
	</div>
	<script>
            
				 function idCheck2(){
					 // 아이디를 입력하는 input요소 얻어오기
					 let inputId = document.getElementById("userId").value;  
				
					  $.ajax({
						 url : "<%=request.getContextPath()%>/friendReq.do",
						 data : {userId : inputId},
						 method : "post",
						 success : function(result){
				
							 if(result){
								 if(confirm("친구 요청 하시겠습니까?")){
									 location.href="<%=request.getContextPath()%>/friendReq.do?userId="+inputId;//친구요청 서블릿으로 연결
								 }
							 }else{
								 
                                alert("없는 아이디이거나 본인 아이디입니다.");
							 }
							 
						 }	 
					 });
				 }
				 
				 function accept(e){
					console.log(e);
					console.log($(e).attr('data-userNo'));
					let senderUserNo =  $(e).attr('data-userNo');
					  $.ajax({
						  
							 url : "<%=request.getContextPath()%>/friend.me",
							 data : {senderUserNo},
							 method : "post",
							 success : function(result){
							console.log(result);
								 if(result>0){
										alert("친구가 됐습니다");
										location.reload();
									 
								 }else{
										alert("친구가 안됐습니다.");
								 }
							 }
							 });	 
						 }
					
				 function deny(e){
						if(confirm("친구를 삭제하시겠습니까?")){
						console.log(e);
						console.log($(e).attr('data-userNo'));
						let senderUserNo =  $(e).attr('data-userNo');
						  $.ajax({
							  
								 url : "<%=request.getContextPath()%>/frienddeny.me",
								 data : {senderUserNo},
								 method : "post",
								 success : function(result){
								console.log(result);
									 if(result>0){
										 	if($(e).attr('class') == "deny"){
											alert("친구 신청을 거절했습니다.");
											location.reload();
										 	}
										 	else{
										 		alert("친구를 삭제했습니다.");
										 		location.reload();
										 	}
									 }else{
											alert("친구요청 거절을 실패했습니다.");
									 }
								 }
								 });	 
							 }
				 }
				 
        </script>


</body>

</html>