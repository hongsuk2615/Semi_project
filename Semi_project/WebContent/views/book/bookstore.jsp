<%@ page language="java" contentType="text/html; charset=UTF-8" import= "java.util.ArrayList , com.khtime.common.model.vo.*, com.khtime.book.model.vo.*"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
	
	/* Book book = (Book)request.getAttribute("book"); */
	
	String contextPath = request.getContextPath();
	ArrayList<Book> bList = (ArrayList<Book>) request.getAttribute("bList");
	int length = 0;
%>  
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
</head>
<body>
    <div id="wrapper">
       <%@ include file="/views/common/book_header.jsp" %>
        <div id="book-navbar">
            <div id="book-btn">
                <button id="book-home-btn">
                    <img src="resources/IMG/home.png" id="book-home-btn-img">Home
                </button>
                <button type="button" id="book-sell-btn">
                    <img src="resources/IMG/pencil.png" id="book-sell-btn-img">판매하기
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
                <% if(bList.size() > 8) {
	                	length = 8;
	                }else {
	                	length = bList.size();
	                }
                %>
                	<% for(int i = 0; i < length; i++) { %>
                	<div id="book-wrap">
                		<div id="book-img">
	                        <img src="<%= request.getContextPath() %><%= bList.get(i).getTitleImg() %>" style="width: 180px; height: 280px;">
	                    </div>
	                    <div id="book-text">
	                        <div id="book-title"><%= bList.get(i).getBookName() %></div><br>
	                        <div id="book-price">가격 : <%= bList.get(i).getPrice() %></div>
	                    </div>
                	</div>
                    <% } %>
                </div>
               <!-- <div id="book-inf">
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
            </div>  -->

            <hr><hr>

            
        </div>
    </div>
        <div id="book-footer">
            <div id="book-page">
            	<% if(currentPage != 1) { %>
					<button id=prevPage>&lt;</button>
				<% } %>
				
				<% for(int i = startPage; i <= endPage; i++ ) { %>
					
					<% if(i != currentPage) { %>
						<%-- <button ><%= i %></button> --%>
						<button id="btn<%= currentPage %>" onclick="location.href = '<%=contextPath%>/bookstore.do?&currentPage=<%= i %>'; "><%= i %></button>
					<% } else { %>
						<button disabled><%=i %></button>
					<% } %>
					
				<% } %>
				
				<% if(currentPage != maxPage) { %>
					<button type="button" id="nextPage">&gt;</button>
				<% } %>
            
                <!-- <button>&lt;</button>
                <button id="book-page-btn1">1</button>
                <button id="book-page-btn2">2</button>
                <button id="book-page-btn3">3</button>
                <button id="book-page-btn4">4</button>
                <button>&gt;</button> -->
            </div>
        </div>
        
        

    </div>
    
    <script>
    let currPage = <%= currentPage %>;
     $(function() {
    	 $("#nextPage").click(function(){
				currPage++;
			/* 	let a = "btn"+currPage; */
				
				location.href = '<%=contextPath%>/bookstore.do?currentPage='+currPage;
				<%-- $(a).click("#btn<%= currentPage %>"); --%>
				/* getBooks(); */
			});
	   	$("#prevPage").click(function(){
	   		currPage--;
	   		/* 	let a = "btn"+currPage; */
			
			location.href = '<%=contextPath%>/bookstore.do?currentPage='+currPage;
			<%-- $(a).click("#btn<%= currentPage %>"); --%>
			/* getBooks(); */
	   	});
     })
	    
	</script>
	   	
	<script>   	
    	document.getElementById("search-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksearch.do?bookname="+document.getElementById("bookname").value;
   		 })
    	
   		 document.getElementById("book-sell-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksell.do";
   		 })
   		 
   		 document.getElementById("book-home-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookstore.do";
   		 })
   		 
   		 document.getElementById("book-wrap").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookdetail.do";
   		 })
    </script>
</body>
</html>