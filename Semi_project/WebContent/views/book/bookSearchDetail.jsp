<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.khtime.common.model.vo.*, com.khtime.board.model.vo.Board , java.util.ArrayList , com.khtime.book.model.vo.Book"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
	
	String contextPath = request.getContextPath();
	ArrayList<Book> bList = (ArrayList<Book>)request.getAttribute("bList");
	int length = 0;
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bookSearchDetail</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_search_detail.css">
</head>
<body>
    <div id="wrapper">
    	<%@ include file="/views/common/book_header.jsp" %>
        <div id="book-navbar">
            <div id="book-btn">
                <button id="book-home-btn" style="color: white;"onclick="location.href = '<%=contextPath%>/bookstore.do'">
                    <img src="resources/IMG/home.png" id="book-home-btn-img">
                    홈
                </button>
                <button id="book-sell-btn" style="color: white;">
                    <img src="resources/IMG/pencil.png" id="book-sell-btn-img">
                    판매하기
                </button>
            </div>
        </div>
        <div id="book-body">
            <div id="book-search">
                <div id="book-search-input">
                    <img src="resources/IMG/glass.png" id="glass">
                    <input name="bookname" id="bookname" type="text" placeholder="검색한 책 이름" style="width: 300px;  height: 28px;" value="<%=request.getParameter("title") == null ? "" : request.getParameter("title") %>">
                    <button type="button" id="search-btn">검색</button>
                </div>
            </div>
            <div id="book-body-content1">
                <div id="book-thumbnail">
                    <div id="book-img0"></div>
                    <div class="book-text"> 
                    	<p>제목 :<div id="book-title0"></div></p>
                        <div id="book-author0"></div><br>
                        <div id="book-publisher0"></div><br>
                        <div id="book-datetime0"></div><br>
                        <div id="book-contents0"></div>
                    </div>
                </div>
          	</div>
          	
            <hr><hr>
            
			<div id="book-body-content2">
			<% if(bList.size() > 6) {
	                	length = 6;
	                }else {
	                	length = bList.size();
	                }
                %>
				<% for(int i = 0; i < length; i++) { %>
					<div class="book-sell-img" data-bkno="<%=bList.get(i).getBookNo()%>">
                		<div class="book-sell-inf<%= i %>">
	                        <img src="<%= request.getContextPath() %><%= bList.get(i).getTitleImg() %>" style="width: 180px; height: 280px;">
	                    </div>
	                    <div class="book-detail-text">
	                        <div class="book-price" style="color: red;" ><%= bList.get(i).getPrice() %></div>
	                    </div>
                	</div>
                    <% } %>		
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
						<button id="btn<%= currentPage %>" onclick="location.href = '<%=contextPath%>/booksearchdetail.do?bookname=<%= request.getParameter("title")%>&currentPage=<%= i %>'; "><%= i %></button>
					<% } else { %>
						<button disabled><%=i %></button>
					<% } %>
					
				<% } %>
				
				<% if(currentPage != maxPage) { %>
					<button type="button" id="nextPage">&gt;</button>
				<% } %>
			
            </div>

        </div>
    
    <script>
    let currPage = <%= currentPage %>;
        $(document).ready(function(){
        	function getBooks(){
                $.ajax({
                    method: "POST",
                    url: "https://dapi.kakao.com/v3/search/book",
                    data: { query: $("#bookname").val(), size :"8" , page: currPage } ,
                    headers: { Authorization : "KakaoAK 36b9faff2b40c9d761ac0092c6c33863" }
                })
    
                .done(function (res){
                    <%-- <% for(int i = 0; i < 8; i++) { %> --%>
	                    $("#book-img0").empty();
	                    $("#book-title0").empty();
	                    $("#book-author0").empty();
	                    <%-- <% } %> --%>
	                    <%-- <% for(int i = 0; i < 8; i++) { %> --%>
                        $("#book-img0").append( "<img src='" +res.documents[0].thumbnail + "'/>");
                        $("#book-title0").append(res.documents[0].title);
                        $("#book-author0").append(res.documents[0].authors);
                        $("#book-publisher0").append(res.documents[0].publisher);
                        $("#book-datetime0").append(res.documents[0].datetime.substring(0,10));
                        $("#book-contents0").append(res.documents[0].contents);
                        let bookdata0 = {
                        		thumbnail : res.documents[0].thumbnail,
                        		title : res.documents[0].title,
                        		author : res.documents[0].authors,
                        		publisher : res.documents[0].publisher,
                        		datetime : res.documents[0].datetime,
                        		contents : res.documents[0].contents
                        };
                        
                        <%-- function bookdetailPost() {sendPost("<%= request.getContextPath() %>/bookdetail.do", bookdata0)};
                        $(".book-sell-img").click(bookdetailPost()); --%>
                });
            }
            $("#search-btn").click(getBooks);
            getBooks();
      		
           $("#search-btn").click(function(){
                if( $("#bookname").val() == "") { 
               	alert("도서 제목을 검색 해 주세요.");
               } 
           })
            
            $("#book-footer button ").click(getBooks);
           
           	$("#nextPage").click(function(){
       			currPage++;
       		/* 	let a = "btn"+currPage; */
       			
       			location.href = '<%=contextPath%>/booksearchdetail.do?bookname=<%= request.getParameter("title") %>&currentPage='+currPage;
       			<%-- $(a).click("#btn<%= currentPage %>"); --%>
       			/* getBooks(); */
       		});
           	$("#prevPage").click(function(){
           		currPage--;
           		/* 	let a = "btn"+currPage; */
           			
           			location.href = '<%=contextPath%>/booksearchdetail.do?bookname=<%= request.getParameter("title") %>&currentPage='+currPage;
           			<%-- $(a).click("#btn<%= currentPage %>"); --%>
           			/* getBooks(); */
       		});
           <% if ( request.getParameter("title") != "" && currentPage != 1  ) { %>
           		getBooks();
           <% } %>
           
        });

    </script>
    
    <script>
		document.getElementById("book-sell-btn-img").addEventListener("click",function(){
    	location.href = "<%= request.getContextPath() %>/booksell.do"
		})
		
		document.getElementById("search-btn").addEventListener("click",function(){
        	location.href = "<%= request.getContextPath() %>/booksearch.do?bookname="+document.getElementById("bookname").value;
   		})
   		
   		$('.book-sell-img').each(function(index,item){
			    let bkno = $(item).attr('data-bkno');
			    $(item).click(function(){
			    	location.href = "<%= request.getContextPath() %>/bookdetail.do?bkno="+bkno;
			    });
		});
    </script>
	
	
    </div>
</body>
</html>