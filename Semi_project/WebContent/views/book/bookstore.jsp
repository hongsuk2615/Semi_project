<%@ page language="java" contentType="text/html; charset=UTF-8" import= "java.util.ArrayList , com.khtime.common.model.vo.*, com.khtime.book.model.vo.*"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
	
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
                    <img src="resources/IMG/home.png" id="book-home-btn-img">
                    Home
                </button>
                <button type="button" id="book-sell-btn">
                    <img src="resources/IMG/pencil.png" id="book-sell-btn-img">
                    판매하기
                </button>
                <button type="button" id="book-modify-btn">
                    <img src="resources/IMG/수정하기.png" id="book-modify-btn-img">
                    내 판매목록
                </button>
            </div>
        </div>
        <div id="book-body">
            <div id="book-search">
                <div id="book-search-input">
                    <img src="resources/IMG/glass.png" id="glass">
                    <input type="text" placeholder="도서 제목을 입력하세요" id="bookname" style="width: 300px;  height: 28px;">
                    <button id="search-btn" value="">검색</button>
                </div>
            </div>
            <div id="book-body-content1">
                <div class="book-inf">
                <% if(bList.size() > 8) {
	                	length = 8;
	                }else {
	                	length = bList.size();
	                }
                %> <% if(length == 0) { %>
                		<h1>조회된 판매 목록이 없습니다.</h1>
                	<% } else { %>
	                	<% for(int i = 0; i < length; i++) { %>
		                	<div class="book-wrap" data-bkno="<%=bList.get(i).getBookNo()%> " data-aos="fade-left" data-aos-duration="1500">
		                		<div class="book-img">
			                        <img src="<%= request.getContextPath() %><%= bList.get(i).getTitleImg() %>" 
			                        style="border-radius: 10px; width: 180px; height: 280px; <%= bList.get(i).getIsSoldout().equals("Y") ? "filter: contrast(0.1);" : "" %>  ">
			                    </div>
			                    <div class="book-text">
			                        <div class="book-title" style="text-align: center;"><% if(bList.get(i).getIsSoldout().equals("Y")) { %>
			                        		<s style="text-decoration-color: gray;"><%= bList.get(i).getBookName() %></s>
			                        	<% } else { %>
			                        		<%= bList.get(i).getBookName() %>
			                        	<% } %>
			                        </div><br>
			                        <div class="book-price">가격 : <%= bList.get(i).getIsSoldout().equals("Y") ? "판매 완료" : bList.get(i).getPrice() %></div>
			                    </div>
		                	</div>
	                    <% } %>
	            	<% } %>
                </div>
            
        </div>
    </div>
        <div id="book-footer">
            <div id="book-page">
            	<% if(currentPage != 1) { %>
					<button id=prevPage>
						<img src="resources/IMG/left.png">
					</button>
				<% } %>
				
				<% for(int i = startPage; i <= endPage; i++ ) { %>
					<% if(i != currentPage) { %>
						<%-- <button ><%= i %></button> --%>
						<button id="btn<%= currentPage %>" onclick="location.href = '<%=contextPath%>/bookstore.do?&currentPage=<%= i %>'; " style="border: none; background: none;"><%= i %></button>
					<% } else { %>
						<button disabled><%=i %></button>
					<% } %>
					
				<% } %>
				
				<% if(currentPage != maxPage) { %>
					<button type="button" id="nextPage">
						<img src="resources/IMG/right.png" style="background: none;">
					</button>
				<% } %>
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
	   
	   	$("#search-btn").click(function(){
            if( $("#bookname").val() === "") { 
           	alert("도서 제목을 검색 해 주세요.");
           } else {
        	   document.getElementById("search-btn").addEventListener("click",function(){
   	        	location.href = "<%= request.getContextPath() %>/booksearch.do?bookname="+document.getElementById("bookname").value;
   	   		 }) 
           } 
      	}) 
     })
	    
	</script>
	   	
	<script>   	
	
   		 document.getElementById("book-sell-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksell.do";
   		 })
			
   		 document.getElementById("book-home-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookstore.do";
   		 })
   		 
   		 document.getElementById("book-modify-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/bookselllist.do";
   		 })

   		 
   		 
   		 
   		 $('.book-wrap').each(function(index,item){
			    let bkno = $(item).attr('data-bkno');
			    $(item).click(function(){
			    	location.href = "<%= request.getContextPath() %>/bookdetail.do?bkno="+bkno;
			    });
		});
   	
   		
	        $('#bookname').keyup(function () {
	            if (window.event.keyCode == 13) {
	            	if( $("#bookname").val() == "") {
	            	alert("도서 제목을 검색 해 주세요.");
	            }else{
	               location.href = "<%= request.getContextPath() %>/booksearch.do?bookname="+document.getElementById("bookname").value;             
	            }
	       	 }
	        });
   		 
    </script>
    
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
    	AOS.init();
    </script>
</body>
</html>