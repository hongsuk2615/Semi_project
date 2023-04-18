<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.khtime.book.model.vo.* , java.util.ArrayList"
    pageEncoding="UTF-8"%>
<% 
	Book book = (Book)request.getAttribute("book");	
	ArrayList<BookAttachment> bList = (ArrayList<BookAttachment>) request.getAttribute("bList");
	String seller = (String)request.getAttribute("seller");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bookMain</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
        /* * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    } */
    </style>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
    <link rel="stylesheet" href="resources/CSS/book_detail.css">
    <link rel="stylesheet" href="resources/CSS/sendmessagemodal.css">
</head>
<body>
    <div id="wrapper">
    	<%@ include file="/views/common/book_header.jsp" %>
        <div id="book-navbar">
            <div id="book-btn">
                <button id="book-home-btn">
                    <img src="resources/IMG/home.png" id="book-home-btn-img">Home
                </button>
                <button id="book-sell-btn">
                    <img src="resources/IMG/pencil.png" id="book-sell-btn-img">판매하기
                </button>
                <button type="button" id="book-modify-btn">
                    <img src="resources/IMG/수정하기.png" id="book-modify-btn-img">내 판매목록
                </button>
            </div>
        </div>
        <div id="book-body">
            <div id="book-title">
                <h1 style="margin-left: 40px; display: flex; align-items: center;"><% if(book.getIsSoldout().equals("Y"))  {  %>
                	<s style="text-decoration-color: gray;"><%= book.getBookName() %></s><img src="resources/IMG/soldout.png" style="width:60px; height: 60px; margin-left: 20px;">
                <% } else { %>
                	<%= book.getBookName() %>
                <% } %>
                </h1>
                <div id="book-inf">
                	<img src="<%= book.getApiImg() == null ? "resources/IMG/임시책.png" : book.getApiImg() %>" style="width: 180px; height: 280px;">
                    <p>저자 : <%= book.getAuthor() %></p>
                    <p>출판사 : <%= book.getPublisher() %></p>
                    <p>출판일 : <%= book.getPublicationDate() == null ? "책에 대한 정보가 없습니다." : book.getPublicationDate() %></p>
                    <div class="listPrice">
	                    <p style="font-size: x-large; color: red; font-weight: 1000;">가격 : <%= book.getPrice() %> 원</p> <p><strike><%= book.getListPrice() %> 원</strike></p>
                    </div>
                    <p><%= book.getContent() == null ? "책에 대한 정보가 없습니다." : book.getContent() %></p>
                </div>
            </div>

            <hr>

            <div id="book-direct">
                <div>
                    <h1>판매 정보</h1>
                </div>
                <div>
                    <p style="color: blue;">판매자 ID : <%= seller %></p>
                </div>
                <div>
                    <p>게시일 : <%= book.getEnrollDate() %></p>
                </div>
                <div>
                    <button class="send-message" data-userNo="<%=book.getSeller() %>" >판매자에게 쪽지 보내기.<img src="<%= request.getContextPath() %>/resources/IMG/쪽지.png" style="width: 27px; height: 27px;"></button>
                </div>
            </div>

            <hr>

            <div id="book-status">
                <div id="book-detail-status">
                    <h1>도서 이미지</h1>
                    <button class="d-Img" style="background:none">
                    	<% for(int i = 0; i < bList.size(); i++ ) { %>
	                    <div class="book-status-img">
	                    <img src="<%= request.getContextPath() + bList.get(i).getFilePath() + bList.get(i).getChangeName() %>" style="width:230px; height:230px;">
	                    </div>
                    	<% } %>
                    </button>
                    
                    <h1>필기 여부</h1>
                    있음 <input type="radio" disabled <%= book.getIsNoted().equals("Y") ? "checked" : "" %>>
                    없음 <input type="radio" disabled <%= book.getIsNoted().equals("N") ? "checked" : "" %>>
                    
                    <h1>책 상태</h1>
                    <input type="radio" name="condition" value="3" disabled <%= book.getCondition() == 3 ? "checked" : "" %>> 상
                    <input type="radio" name="condition" value="2" disabled <%= book.getCondition() == 2 ? "checked" : "" %>> 중
                    <input type="radio" name="condition" value="1" disabled <%= book.getCondition() == 1 ? "checked" : "" %>> 하
                </div>
            </div>

            <hr>

            <div id="book-trade">
                <div>
                    <h1>거래 방법</h1>
                    <p style="font-size: large;"><%= book.getIsDirect().equals("N") ? "택배" : book.getIsDirect().equals("Y") ? "직거래" : "직거래 , 택배"  %></p>
                    <h1>지역</h1>
                    <p style="font-size: large;"><%= book.getLocation() %></p>
                </div>
            </div>
            
            <hr>
            
            <div id="back">
            	<button id="back-btn" style="width:500px; height:50px; border: round;">돌아가기</button>
            </div>
        </div>
        
        <form action="<%= request.getContextPath() %>/sendMsg.me" method="post"> <!-- 쪽지 모달  -->
				<input type="hidden" name="opponentNo" id="sellerNo" value="">
				<div class="msg-modal hidden">
				   <div class="Msgbg"></div>
				   <div class="msg-modalBox">
					   <div class="header">
						   <h2>판매자에게 쪽지보내기</h2>
					   </div>
						   <div class="sendMsgBody">
							   <div class="inputBox">
								    <h4 class="inputLabel">쪽지보내기</h4>            
									<input onkeydown='mykeydown()' style="height: 130px; white-space: pre;" maxlength="70" type="textarea" name="content" placeholder="공백포함 최대60자" class="inputField" required /><br>
							   </div>
						   <button type="submit" class="closeBtn" id="fullBlueBtn4">보내기</button>			
						   </div>
				   </div>
			   </div>
		 </form>
		 
		 <div class="img-modal hidden">
				   <div class="Imgbg"></div>
				   <div class="img-modalBox" style="width: 850px; height: 500px;">
						   <div class="sendImgBody">
							   <div class="inputBox" style="display: flex; justify-content: space-around;">
							   		<% for(int i = 0; i < bList.size(); i++ ) { %>
					                    <div class="book-status-img">
					                    <img src="<%= request.getContextPath() + bList.get(i).getFilePath() + bList.get(i).getChangeName() %>" style="width:400px; height:460px;">
					                    </div>
				                    <% } %>
							   </div>			
						   </div>
				   </div>
			   </div>
    </div>
		
	
	
	<script> <!-- 쪽지보내기모달 textarea 엔터키 감지스크맆트 -->
		function mykeydown() { 
			if(window.event.keyCode==13) //enter 일 경우
			{
				sendServer();
			}
		 }
		</script>
		<script> <!--쪽지보내기모달 닫는 스크맆트-->
		  const openMsg = () => {
			  document.querySelector(".msg-modal").classList.remove("hidden");
			  
		  }
		  const closeMsg = () => {
			  console.log('cdlose')
			  document.querySelector(".msg-modal").classList.add("hidden");
		  }
		  
		  document.querySelector(".closeBtn").addEventListener("click", closeMsg);
		  document.querySelector(".Msgbg").addEventListener("click", closeMsg);
		  $('.send-message').click(function(){
			openMsg();
		  $('#sellerNo').val($(this).attr('data-userNo'));
		  });
		  
	  </script>
	  
	  <script> <!-- 이미지모달 스크맆트-->
		  const openImg = () => {
			  document.querySelector(".img-modal").classList.remove("hidden");
			  
		  }
		  const closeImg = () => {
			  console.log('cdlose')
			  document.querySelector(".img-modal").classList.add("hidden");
		  }
		 
		  document.querySelector(".Imgbg").addEventListener("click", closeImg);
		  $('.d-Img').click(function(){
			openImg();
			/* $('#sellerNo').val($(this).attr('data-userNo')); */
		  });
	  </script>
    
    <script>
    
    	document.getElementById("book-sell-btn").addEventListener("click",function(){
    		location.href = "<%= request.getContextPath() %>/booksell.do";
		})
		 
		document.getElementById("book-home-btn").addEventListener("click",function(){
    		location.href = "<%= request.getContextPath() %>/bookstore.do";
		})
		 
		document.getElementById("back-btn").addEventListener("click",function(){
    	location.href = "<%= request.getContextPath() %>/bookstore.do";
		}) 
		
		document.getElementById("book-modify-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookselllist.do";
   		 })
    </script>
</body>
</html>