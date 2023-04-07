<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.khtime.common.model.vo.*, com.khtime.board.model.vo.Board"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.book.model.vo.Book" %>
<%
	Book book = (Book) request.getAttribute("book");
	String thumbnail = (String)request.getAttribute("thumbnail");
	String datetime = (String)request.getAttribute("datetime");
	String contents = (String)request.getAttribute("contents");
	String title = (String)request.getParameter("title");
	String author = (String)request.getParameter("author");
	String publisher = (String)request.getParameter("publisher");
	System.out.println(book);
	
	String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bookSell</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
        * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    }
    #book-sell,
    #book-inf1,
    #book-thumbnail {
    	width: 100%;
    }
    </style>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
    <link rel="stylesheet" href="resources/CSS/book_sell.css">
    <script>
    
    
    </script>
</head>
<body>
    <div id="wrapper">
    <%@ include file="/views/common/book_header.jsp" %>
        <div id="book-navbar">
            <div id="book-btn">
                <button id="book-home-btn">
                    <img src="resources/IMG/home.png" id="book-home-btn-img">Home
                </button>
            </div>
        </div>

        <div id="book-body">
            <form action="<%= contextPath %>/bookinsert.do" id="enroll-form" method="post" enctype="multipart/form-data">
                <div id="book-sell">
                    <div id="book-sell-header">
                        <img src="resources/IMG/glass.png" id="glass">
                        <input type="text" id="book-name-search" placeholder="도서 제목을 검색하세요"  style="width: 300px;  height: 28px;" value="<%=request.getParameter("title") == null ? "" : request.getParameter("title") %>">
                        <button type="button" id="search-btn">검색</button>
                    </div>
                    <div id="book-next">
                        <button type="button" id="next">다음</button>
                    </div>
                </div>
    
                <hr>
    			
    			<div id="book-thumbnail">
    				<div id="book-inf1">
    					<img src="<%= request.getAttribute("thumbnail") %>">
    					<input type="hidden" value="<%= request.getAttribute("thumbnail") %>" name="thumbnail">
    					<h1><%= request.getParameter("title")%></h1>
    					<input type="hidden" value="<%= request.getParameter("title") %>" name="title">
    					<p>저자 : <%= request.getParameter("author") %></p>
    					<input type="hidden" value="<%= request.getParameter("author") %>" name="author">
    					<p>출판사 : <%= request.getParameter("publisher") %></p>
     					<input type="hidden" value="<%= request.getParameter("publisher") %>" name="publisher">
    					<p>출간일 : <%= request.getAttribute("datetime") %></p>
    					<input type="hidden" value="<%= request.getAttribute("datetime") %>" name="publicationDate">
    				</div>
    				<div id="book-next1">
                        <button type="button" id="next1">다음</button>
                    </div>
    			</div>
    			
    			<hr>
    			
                <div id="book-price">
                    <div id="book-price-input">
                        <input type="number" id="price" name="price" placeholder="가격을 입력하세요.">
                        <div id="book-next2">
                            <button type="button" id="next2">다음</button>
                        </div>
                    </div>
                </div>
                
                <hr>
    
                <div id="book-status">
                    <div id="book-status-check">
                        <h1>책 상태</h1>
                        <input type="radio" name="condition" value="3" checked> 상
                        <input type="radio" name="condition" value="2"> 중
                        <input type="radio" name="condition" value="1"> 하
                        <h1>필기흔적</h1>
                        <input type="radio" name="isNoted" value="Y" checked> 있음
                        <input type="radio" name="isNoted" value="N"> 없음
                    <!--     <p>밑줄 흔적 : <input type="radio" name="use" value="Y">있음 /<input type="radio" name="use" value="N">없음   &nbsp;
                                      <input type="radio" name="pencil">연필 /<input type="radio" name="pencil">샤프   &nbsp; 
                                      <input type="radio" name="pen">볼펜 /<input type="radio" name="pen">형광펜</p> <hr>
                        <p>필기 흔적 : <input type="radio" name="use2">있음 /<input type="radio" name="use2">없음   &nbsp;
                                      <input type="radio" name="pencil2">연필 /<input type="radio" name="pencil2">샤프   &nbsp; 
                                      <input type="radio" name="pen2">볼펜 /<input type="radio" name="pen2">형광펜</p> <hr>
                        <p>겉 표지 :  <input type="radio" name="clean">깨끗함 /<input type="radio" name="clean">사용감</p> <hr>
                        <p>이름 기입 : <input type="radio" name="name">있음 /<input type="radio" name="name">없음</p> -->
                    </div>
                </div>
    
                <hr>
    
                <div id="book-img-upload">
                    <input type="file" name="upfiles1">
                    <input type="file" name="upfiles2">
                    <div id="book-next3">
                        <button type="button" id="next3">다음</button>
                    </div>
                </div>
                
                <hr>
    
                <div id="book-trade">
                    <div>
                        <h1>거래 방법</h1>
                        <input type="radio" name="isDirect" value="Y"> 직거래
                        <input type="radio" name="isDirect" value="N"> 택배
                        <input type="radio" name="isDirect" value="B"> 둘다
                        <!-- <p>택배 : <input type="radio" name="delivery">가능 /<input type="radio" name="delivery">불가능</p>
                        <p>직거래 : <input type="radio" name="meet">가능 /<input type="radio" name="meet">불가능</p>-->
                        <p>지역 : <input type="text" name="location"></p> 
                    </div>
                </div>
    
                <hr>
    
                <div id="book-board-upload">
                    <button type="submit" id="upload">게시하기</button>
                </div>
            </form>
        </div>
    </div>
    <br> <br>
    
    <script>
    $(function() {
    	/* $("#search-btn").click(function(){
    		$("#book-thumbnail").css("display" , "flex");
    	}) */
    	$("#next").click(function(){
    		if( $("#book-name-search").val() !== ""){
    			$("#book-thumbnail").fadeIn(1500).css("display" , "flex");
    		} else {
    			alert("도서를 검색해 주세요.");
    		}
    	})
    	
        $("#next1").click(function(){ // 다음 버튼 누르면 페이드인 효과 발생
                $("#book-price").fadeIn(1500).css("display" , "flex");
        });
       
        $("#next2").click(function(){
            var p = $("#price").val();

            if( p !== "" ) {
                $("#book-status").fadeIn(1500).css("display" , "flex");
                $("#book-img-upload").fadeIn(1500).css("display" , "flex");
            } else {
                alert("가격을 입력해 주세요!");
            }
        });

        $("#next3").click(function(){
            $("#book-trade").fadeIn(1500).css("display" , "flex");
            $("#book-board-upload").fadeIn(1500).css("display" , "flex");
        })
    })
    </script>
    
    
    <script>
    	document.getElementById("search-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksellsearch.do?bookname="+document.getElementById("book-name-search").value;
   		 })
   		 
   		<%--  document.getElementById("upload").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookinsert.do?bookname="+document.getElementById("book-name-search").value;
   		 }) --%>
   		 
   		 document.getElementById("book-home-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookstore.do";
   		 })
    </script>
    
</body>
</html>