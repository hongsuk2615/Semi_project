<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.khtime.book.model.vo.* , java.util.ArrayList"
    pageEncoding="UTF-8"%>
<% 
	Book book = (Book)request.getAttribute("book");
	ArrayList<BookAttachment> batList = (ArrayList<BookAttachment>) request.getAttribute("batList");
	String contextPath = request.getContextPath();
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
        * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    }
    </style>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
    <link rel="stylesheet" href="resources/CSS/book_update.css">
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
            </div>
        </div>
        <div id="book-body">
        	<form action="<%= contextPath %>/bookupdatedetail.do" id="enroll-form" method="post" enctype="multipart/form-data">
            <div id="book-title">
                <h1 id="bookName"><%= book.getBookName() %></h1>            	
                <div id="book-inf">
                	<img src="<%= book.getApiImg() %>" style="width: 180px; height: 280px;">
                    <p><%= book.getAuthor() %></p>
                    <p><%= book.getPublisher() %></p>
                    <p><%= book.getPublicationDate() %></p>
                    <div class="listPrice">
                    	<input type="number" name="price" value="<%= book.getPrice() %>">
                    </div>
                    <textarea name="content" style="resize: none; width: 250px; height: 100px;">
                    	<%= book.getContent() %>
                    </textarea>
                </div>
                
            </div>

            <hr>

            <div id="book-direct">
                <div>
                    <h1>판매 정보</h1>
                </div>
                <div>
                    <p style="color: blue;">판매자 ID : <%= loginUser.getUserId() %></p>
                </div>
                <div>
                    <p>게시일 : <%= book.getEnrollDate() %></p>
                </div>
            </div>

            <hr>

            <div id="book-status">
                <div id="book-detail-status">
                    <h1>도서 이미지</h1>
                    <button class="d-Img" style="background:none">
                    	<% for(int i = 0; i < batList.size(); i++ ) { %>
	                    <div class="book-status-img">
		                    <div class="book-title-img">
			                    <img src="<%= request.getContextPath() + batList.get(i).getFilePath() + batList.get(i).getChangeName() %>" style="width:230px; height:230px;">
		                    </div>
		                    <div class="book-new-img">
			                    <input type="file" name="upfiles1" style="width: 230px;">
		                    	<input type="file" name="upfiles2" style="width: 230px;">
		                    </div>
	                    </div>
                    	<% } %>
                    </button>
                    
                    <h1>필기 여부</h1>
                    있음 <input type="radio" name="isNoted" value="Y" <%= book.getIsNoted().equals("Y") ? "checked" : "" %>>
                    없음 <input type="radio" name="isNoted" value="N" <%= book.getIsNoted().equals("N") ? "checked" : "" %>>
                    
                    <h1>책 상태</h1>
                    <input type="radio" name="condition" value="3" <%= book.getCondition() == 3 ? "checked" : "" %>> 상
                    <input type="radio" name="condition" value="2" <%= book.getCondition() == 2 ? "checked" : "" %>> 중
                    <input type="radio" name="condition" value="1" <%= book.getCondition() == 1 ? "checked" : "" %>> 하
                </div>
            </div>

            <hr>

            <div id="book-trade">
                <div>
                    <h1>거래 방법</h1>
                    <input type="radio" name="isDirect" value="Y" <%= book.getIsDirect() == "Y" ? "checked" : "" %>> 직거래
                    <input type="radio" name="isDirect" value="N" <%= book.getIsDirect() == "N" ? "checked" : "" %>> 택배
                    <input type="radio" name="isDirect" value="B" <%= book.getIsDirect() == "B" ? "checked" : "" %>> 둘다
                    <h1>지역</h1>
                    <p>지역 : <input type="text" name="location" class="location" value="<%= book.getLocation() %>"></p>
                </div>
            </div>
            
            <hr>
            
            <div id="back">
            	<button id="back-btn" style="width:500px; height:50px; border: round;">수정하기</button>
            </div>
            </form>
        </div>
    </div>
    
    <script>
    
    	document.getElementById("book-sell-btn").addEventListener("click",function(){
    		location.href = "<%= request.getContextPath() %>/booksell.do";
		})
		 
		document.getElementById("book-home-btn").addEventListener("click",function(){
    		location.href = "<%= request.getContextPath() %>/bookstore.do";
		})
		 
		document.getElementById("back-btn").addEventListener("click",function(){
    		location.href = "<%= request.getContextPath() %>/bookselllist.do";
		}) 
		
    </script>
</body>
</html>