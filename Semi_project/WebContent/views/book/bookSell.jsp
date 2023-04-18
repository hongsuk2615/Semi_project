<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.khtime.common.model.vo.*, com.khtime.board.model.vo.Board"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.book.model.vo.Book" %>
<%
	Book book = (Book) request.getAttribute("book");
	String thumbnail = (String)request.getAttribute("thumbnail");
	String datetime = (String)request.getAttribute("datetime");
	String contents = (String)request.getAttribute("contents");
	String title = (String)request.getAttribute("title");
	String author = (String)request.getAttribute("author");
	String publisher = (String)request.getAttribute("publisher");
	int listPrice = (Integer)request.getAttribute("listPrice") == null ? 0 :(Integer)request.getAttribute("listPrice") ;
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
        /* * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    } */
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
                <button type="button" id="book-modify-btn">
                    <img src="resources/IMG/수정하기.png" id="book-modify-btn-img">내 판매목록
                </button>
            </div>
        </div>

        <div id="book-body">
            <form action="<%= contextPath %>/bookinsert.do" id="enroll-form" method="post" enctype="multipart/form-data">
                <div id="book-sell">
                    <div id="book-sell-header">
                        <img src="resources/IMG/glass.png" id="glass">
                        <input type="hidden">
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
    					<img src="<%= thumbnail %>">
    					<input type="hidden" value="<%= request.getAttribute("thumbnail") %>" name="thumbnail">
    					<h1><%= title %></h1>
    					<input type="hidden" value="<%= request.getAttribute("title") %>" name="title">
    					<p>저자 : <%= author %></p>
    					<input type="hidden" value="<%= request.getAttribute("author") %>" name="author">
    					<p>출판사 : <%= publisher %></p>
     					<input type="hidden" value="<%= request.getAttribute("publisher") %>" name="publisher">
    					<p>출간일 : <%= datetime %></p>
    					<input type="hidden" value="<%= request.getAttribute("datetime") %>" name="publicationDate">
    					<p style="font-size: large; color: red;"> 정가 : <%= listPrice %> 원</p>
    					<input type="hidden" value="<%= request.getAttribute("listPrice") %>" name="listPrice">
    				</div>
    				<div id="book-next1">
                        <button type="button" id="next1">다음</button>
                    </div>
    			</div>
    			
    			<hr>
    			
                <div id="book-price" style="flex-direction: column;">
                    <div id="book-price-input">
                        <input type="number" id="price" name="price" placeholder="가격을 입력하세요." >
                    </div>
                    <div id="book-next2">
                            <button type="button" id="next2">다음</button>
                    </div>
                </div>
                
                <hr>
    			
    			<div id="book-content">
    				<div id="book-content-input">
	    				<textarea rows="10" cols="30" maxLength="1200" placeholder="판매 정보를 입력해 주세요." class="textarea" name="content"></textarea>    				
    				</div>
    				<div id="book-next3">
                        <button type="button" id="next3">다음</button>
                    </div>
    			</div>
    			
    			<hr>
    			
                <div id="book-status">
                    <div id="book-status-check">
                        <h1>책 상태</h1>
                        <label>
	                        <input type="radio" name="condition" value="3" checked> 상                    
                        </label>
                        <label>
	                        <input type="radio" name="condition" value="2"> 중
                        </label>
                        <label>
	                        <input type="radio" name="condition" value="1"> 하
                        </label>
                        <h1>필기흔적</h1>
                        <label>
	                        <input type="radio" name="isNoted" value="Y" checked> 있음
                        </label>
                        <label>
	                        <input type="radio" name="isNoted" value="N"> 없음
                        </label>
                    </div>
                </div>
    
                <hr>
    
                <div id="book-img-upload">
                    <input type="file" name="upfiles1">
                    <input type="file" name="upfiles2"> <br>
                    <div id="book-next4">
                        <button type="button" id="next4">다음</button>
                    </div>
                </div>
                
                <hr>
    
                <div id="book-trade">
                    <div>
                        <h1>거래 방법</h1>
                        <label>
	                        <input type="radio" name="isDirect" value="Y" checked> 직거래
                        </label>
                        <label>
	                        <input type="radio" name="isDirect" value="N"> 택배
                        </label>
                        <label>
	                        <input type="radio" name="isDirect" value="B"> 둘다
                        </label>
                        <p>지역 : <input type="text" name="location" class="location" required></p> 
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

    	$("#next").click(function(){
    		if( $("#book-name-search").val() !== ""){
    			$("#book-thumbnail").fadeIn(1500).css("display" , "flex");
    		} else {
    			khalert("도서를 검색해 주세요.");
    		}
    	})
    	
        $("#next1").click(function(){ // 다음 버튼 누르면 페이드인 효과 발생
                $("#book-price").fadeIn(1500).css("display" , "flex");
        });
       
        $("#next2").click(function(){
            var p = $("#price").val();

            if( p !== "" ) {
                $("#book-content").fadeIn(1500).css("display" , "flex");
                
            } else {
                khalert("가격을 입력해 주세요!");
            }
        });

        $("#next3").click(function(){
            $("#book-status").fadeIn(1500).css("display" , "flex");
            $("#book-img-upload").fadeIn(1500).css("display" , "flex");
        })
        
        $("#next4").click(function(){
            $("#book-trade").fadeIn(1500).css("display" , "flex");
            $("#book-board-upload").fadeIn(1500).css("display" , "flex");
        })
        
        $("#upload").click(function(){
        	if( $(".location").val() == "") {
        		khalert("지역을 입력 해 주세요!");
        	} else {
        		khalert("게시글 작성 성공!");
        	}
        	
        })
        
        document.getElementById('book-name-search').addEventListener('keydown', function(event) {
        	  if (event.keyCode === 13) {
        	    event.preventDefault();
        	    $("#search-btn").click();
        	  };
        	}, true);
        
        
    })
    </script>
    
	<script>
		const autoResizeTextarea = (e) => {
		  let textarea = document.querySelector('.textarea');

		  if (textarea) {
		    textarea.style.height = 'auto';
		    let height = textarea.scrollHeight; // 높이
		    textarea.style.height = `${height + 8}px`;
		  }
		};
	</script>
	    
    <script>
    	document.getElementById("search-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksellsearch.do?bookname="+document.getElementById("book-name-search").value;
   		 })
   		 
   		 document.getElementById("book-home-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookstore.do";
   		 })
   		 
   		 document.getElementById("book-modify-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookselllist.do";
   		 })
    </script>
 
</body>
</html>