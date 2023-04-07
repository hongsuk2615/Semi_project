<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.khtime.book.model.vo.* , java.util.ArrayList"
    pageEncoding="UTF-8"%>
<% 
	Book book = (Book)request.getAttribute("book");	
	ArrayList<BookAttachment> bList = (ArrayList<BookAttachment>)request.getAttribute("bList");
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
    <link rel="stylesheet" href="resources/CSS/book_detail.css">
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
                <h1><%= book.getBookName() %></h1>
                <div id="book-inf">
                	<img src="<%= book.getApiImg() %>" style="width: 180px; height: 280px;">
                    <p><%= book.getAuthor() %></p>
                    <p><%= book.getPublisher() %></p>
                    <p><%= book.getPublicationDate() %></p>
                    <p style="font-size: x-large; color: red; font-weight: 1000;"><%= book.getPrice() %></p>
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
                <div>
                    <button id="send-message">판매자에게 쪽지 보내기.<img src="<%= request.getContextPath() %>/resources/IMG/쪽지함.png" style="width: 25px; height: 25px;"></button>
                </div>
            </div>

            <div class="modal hidden">
                <div class="bg"></div>
                <div class="modalBox">
                    <div class="header">
                        <h2>판매자 ID</h2>
                    </div>
                    <div class="addDdayBody">
                        <div class="inputBox">
                            <textarea rows="16" cols="53" style="resize: none;" placeholder="내용을 적어주세요."></textarea>
                        </div>
                    </div>
                    <div class="closeBtn" id="fullBlueBtn1">
                        쪽지 보내기
                    </div>
                </div>
            </div>

            <hr>

            <div id="book-status">
                <div id="book-status">
                    <h1>도서 이미지</h1>
                    <% for(int i = 0; i < bList.size(); i++ ) { %>
                    <div class="book-status-img">
                    <img src="<%= request.getContextPath() + bList.get(i).getFilePath() + bList.get(i).getChangeName() %>">
                    </div>
                    <% } %>
                    <h1>필기 여부</h1>
                    있음 <input type="radio" disabled <%= book.getIsNoted().equals("Y") ? "checked" : "" %>>
                    없음 <input type="radio" disabled <%= book.getIsNoted().equals("N") ? "checked" : "" %>>
                </div>
            </div>

            <hr>

            <div id="book-trade">
                <div>
                    <h1>거래 방법</h1>
                    <p><%= book.getIsDirect().equals("N") ? "택배" : book.getIsDirect().equals("Y") ? "직거래" : "직거래 , 택배"  %></p>
                    <h2>지역</h2>
                    <p><%= book.getLocation() %></p>
                </div>
                <button id="back-btn">돌아가기</button>
            </div>
        </div> 
    </div>

    <script> 
            const open1 = () => { // 쪽지 모달창 오픈
                document.querySelector(".modal").classList.remove("hidden");
            }
            const close = () => {
                document.querySelector(".modal").classList.add("hidden");
            }
            document.querySelector("#send-mesage").addEventListener("click", open1);
            document.querySelector(".closeBtn").addEventListener("click", close);
            document.querySelector(".bg").addEventListener("click", close);

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
		
    </script>
</body>
</html>