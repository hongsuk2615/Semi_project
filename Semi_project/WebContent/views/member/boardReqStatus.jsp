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
    	    border: 1px solid black;
    	}
    	
    	#menu{
    		display:flex;
    		justify-content: space-between;
    		border: 1px solid black;
 
    	}
    	
    	.list{
    		display:flex;
    		justify-content: space-between;
    	    border: 1px solid black;
    	}
    
    </style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../common/header.jsp"%>
		<div id="body">
			<div id="body-wrapper">
				<div id="body-left">
					<div id="board-wrapper">
						<div id="board-detail">
							<div id="category">게시판 관리</div>
							<div id="content-wrapper">
								<ul id="menu">
									<li>번호</li>
									<li>게시판이름</li>
									<li>승인상태</li>
									
									<li>&nbsp;</li>
								</ul>
								<%for(int i = 0; i < list.size(); i++) { %>
								<ul class="list">
									<li><%= i+1 %></li>
									<li><%=list.get(i).getCategoryName()%></li>
									<li><%=list.get(i).getAvailable().equals("Y")? "승인":"승인 대기중"%></li>
									<li><button>취소</button></li>
								</ul>
								<% } %>
							</div>
						</div>
						<div class="paging-area"></div>
					</div>
				</div>
				<%@ include file="../common/body_right.jsp"%>
			</div>
		</div>
		<div id="footer"></div>
	</div>

</body>
</html>