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
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
    <link rel="stylesheet" href="resources/CSS/my_book_detail.css">
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
            <div id="book-title">
            	<div id="btn-div">
	                <button id="delete-btn">삭제하기</button>
	                <button id="modify-btn">수정하기</button>
	                <button id="soldout-btn">판매완료</button>
                </div>
                <h1 id="bookName"><%= book.getBookName() %> </h1>            	
                <div id="book-inf">
                	<img src="<%= book.getApiImg() == null ? "resources/IMG/임시책.png" : book.getApiImg() %>" style="width: 180px; height: 280px;">
                    <p>저자 : <%= book.getAuthor() %></p>
                    <p>출판사 : <%= book.getPublisher() %></p>
                    <p>출판일 : <%= book.getPublicationDate() == null ? "판매에 대한 정보가 없습니다." : book.getPublicationDate() %></p>
                    <div class="listPrice">
	                    <p style="font-size: x-large; color: red; font-weight: 1000;">가격 : <%= book.getPrice() %> 원</p><p><strike><%= book.getListPrice() %> 원</strike></p>
                    </div>
                    <p><%= book.getContent() == null ? "판매에 대한 정보가 없습니다." : book.getContent() %></p>
                </div>
            </div>

            <hr>

            <div id="book-direct">
                <div>
                    <h1>판매 정보</h1>
                </div>
                <div>
                    <p>게시일 : <%= book.getEnrollDate() %></p>
                </div>
            </div>

            <hr>

            <div id="book-status">
                <div id="book-detail-status">
                    <h1>도서 이미지</h1>
                    <button class="detail-Img" style="background:none">
                    	<% for(int i = 0; i < bList.size(); i++ ) { %>
	                    <div class="book-status-img">
	                    	<img src="<%= request.getContextPath() + bList.get(i).getFilePath() + bList.get(i).getChangeName() %>" style="width:230px; height:230px;">
	                    </div>
                    	<% } %>
                    </button>
                    <div>
                    <h1>필기 여부</h1>
                    있음 <input type="radio" disabled <%= book.getIsNoted().equals("Y") ? "checked" : "" %>>
                    없음 <input type="radio" disabled <%= book.getIsNoted().equals("N") ? "checked" : "" %>>
                    </div>
            		
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
		
		document.getElementById("modify-btn").addEventListener("click",function(){
    		location.href = "<%= request.getContextPath() %>/bookupdateform.do?bkno=<%= book.getBookNo() %>";
		})
		
		document.getElementById("soldout-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksoldout.do?bkno=<%= book.getBookNo() %>";
   		 })
		
   		document.getElementById("delete-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookdelete.do?bkno=<%= book.getBookNo() %>";
   		 })
   		 
    </script>

</body>
</html>