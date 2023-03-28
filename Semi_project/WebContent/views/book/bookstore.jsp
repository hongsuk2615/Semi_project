<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bookMain</title>
    <style>
        * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    }
    </style>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
</head>
<body>
    <div id="wrapper">
       <%@ include file="/views/common/book_header.jsp" %>
        <div id="book-navbar">
            <div id="book-btn">
                <button id="book-home-btn">
                    <img src="resources/IMG/home.png" id="book-home-btn-img">
                </button>
                <button id="book-sell-btn">
                    <img src="resources/IMG/pencil.png" id="book-sell-btn-img">
                </button>
            </div>
        </div>
        <div id="book-body">
            <div id="book-search">
                <div id="book-search-input">
                    <img src="resources/IMG/glass.png" id="glass">
                    <input type="text" placeholder="도서 제목을 입력하세요" id="bookname" style="width: 300px;  height: 28px;">
                    <button id="search-btn">검색</button>
                </div>
            </div>
            <div id="book-body-content1">
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
            </div>

            <hr><hr>

            <div id="book-body-content2">
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
                <div id="book-inf">
                    <div id="book-img">
                        <img src="resources/IMG/책이미지.jfif">
                    </div>
                    <div id="book-text">
                        <div>책 제목</div>
                        <div>책 가격</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="book-footer">
            <div id="book-page">
                <button>&lt;</button>
                <button id="book-page-btn1">1</button>
                <button id="book-page-btn2">2</button>
                <button id="book-page-btn3">3</button>
                <button id="book-page-btn4">4</button>
                <button>&gt;</button>
            </div>
        </div>
        
        

    </div>
    
    <script>
    	document.getElementById("search-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksearch.do?name="+document.getElementById("bookname").value;
   		 })
    
    </script>
</body>
</html>