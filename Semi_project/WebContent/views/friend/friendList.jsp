<%@ page import = "java.util.ArrayList,com.khtime.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); %>

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
     <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
        <%@ include file="../common/header.jsp" %>
        </div>
        <div id="body">
            <div id="main-banner">
            </div>

            <div id="content">
                <form id="boardmake">
                    <div>
                        <div> <input placeholder="아이디로 친구요청을 보내세요!" type="text" name="userId" id="userId"
                            required></div>
                        <button type="button" class="btn btn-primary" onclick="idCheck2();" >검색</button>
                        <br>
                    </div>
                    <br>
                    <div id="keyword"   style="display: flex; width: 500px;  ">
              <%--     <% if(list != null) {%> --%>
                   <div><% for(Member m : list){ %>		
					
							<%=m.getUserName() %>			
					<% } %></div>
				 	<%-- <%}else {%>
					<div><% for(Member m : list){ %>		
					
							<%=m.getUserName() %>			
					</div>
					<div>님의 친구 요청</div> <div><button type="button" id="admit" onclick="admit();">수락</button></div>
						<div><button type='button' onclick='deleteDiv()'>거절</button>
					</div>
					<%} %>  --%>
					
				
                </form>
            </div>
        </div>
        <div id="footer">
        </div>
    </div>
        <script>
            
				 function idCheck2(){
					 // 아이디를 입력하는 input요소 얻어오기
					 let inputId = document.getElementById("userId").value;  
				
					  $.ajax({
						 url : "<%= request.getContextPath()%>/friendReq.do",
						 data : {userId : inputId},
						 method : "post",
						 success : function(result){
				       
							 if(result){
								 if(confirm("친구 요청 하시겠습니까?")){
									 location.href="<%=request.getContextPath() %>/friendReq.do?userId="+inputId;//친구요청 서블릿으로 연결
								 }
							 }else{
								 
                                alert("없는 아이디이거나 본인 아이디입니다.");
							 }
							 
						 }	 
					 });
				 }
				 
				 function admit(){
		
					  $.ajax({
						 url : "<%= request.getContextPath()%>/friend.me",
						 method : "post",
						 success : function(result){
							 if(result){
								 alert("친구가 됬습니다.");
							 }else{ 
								 alert("친구가 안됬습니다.");
							 }
							 
						 }	 
					 });
				 }
				 
				    function deleteDiv() {
  						const div = document.getElementById('keyword');
  
  							div.remove();
						} 
				
        </script>


</body>

</html>