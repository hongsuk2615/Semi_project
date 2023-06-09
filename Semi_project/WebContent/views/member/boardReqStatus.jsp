<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.ArrayList, com.khtime.board.model.vo.Category" %>

<% ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/body.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/memberBoardReq.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <title>게시판 관리</title>
    <style>
    	#content-wrapper{
    		display:flex;
    		flex-direction:column;
    		justify-content:space-evenly;
    	    border: 3px solid skyblue;
    	    border-radius: 0px 0px 20px 20px;
  	        background: aliceblue;
    	}
    	
    	#menu{
    		display:flex;
    		justify-content: space-between;
    		border: 1px solid black;
 
    	}
    	
    	.list{
    		display:flex;
    		justify-content: space-between;
    	    border-left: 3px solid #42A5F5;
   			border-bottom: 3px solid #42A5F5;
   			border-right: 3px solid #42A5F5;
    	    padding : 0px 10px;
    	}
    
    </style>
</head>
<body>
   	
	<div id="wrapper">
		<%@ include file="../common/header.jsp" %>
		<div id="body">
			<div id="body-wrapper">
				<div id="body-left">
					<div id="board-wrapper">
						<div id="board-detail">
							<div id="category" style="border-raius:12px 12px 0px 0px;">게시판 관리</div>
							<div id="content-wrapper">
								<ul class="list" style="font-size: 23px;border-radius: 5px 5px 0px 0px; background-color: #42A5F5;color: white;border: none;">
									<li style="width : 70px;">번호</li>
									<li style="width : 300px;">게시판이름</li>
									<li style="width : 100px;">승인상태</li>
									<li style="width : 100px;">&nbsp;</li>
								</ul>
								<%if(list.size()==0){ %>
									<br><div class="list" style="justify-content:center; border: none; color: #499d9f;"><h1>요청한 게시판이 없어요.</h1></div>
								<% } else{ %>
									<%for(int i = 0; i < list.size(); i++) { %>
								<ul class="list">
									<li style="width : 70px;"><%= i+1 %></li>
									<li style="width : 300px; overflow:hidden;"><%=list.get(i).getCategoryName()%></li>
									<% if(list.get(i).getAvailable().equals("Y")){%>
									<li style="width : 100px;">승인</li>
									<li style="width : 100px;"></li>
									<%} else {%>
									<li style="width : 100px;">승인대기중</li>
									<li style="width : 100px;"><button class="cancelRequest" data-categoryName = "<%=list.get(i).getCategoryName()%>">요청취소</button></li>
									<%}%>
								</ul>	
								<% } %>
								<% }%>
								
							</div>
						</div>
						<div class="paging-area"></div>
					</div>
				</div>
				<%@ include file="../common/body_right.jsp"%>
			</div>
		</div>
		<div id="footer"></div>
		
		
		<!-- 요청취소버튼 누르면 categoryName값과 함께 서블릿으로 넘김 -->
		<script>
			$(function(){
				$('.cancelRequest').each(function(index,item){
					$(item).click(function(){
						location.href = "<%=request.getContextPath()%>/deteleReqBoard.me?cName=" + $(item).attr('data-categoryName');						
					})
				})
			});
		</script>
	</div>

</body>
</html>