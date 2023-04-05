<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.khtime.common.model.vo.*, com.khtime.board.model.vo.Board"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
	
	String contextPath = request.getContextPath();
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
                    	<div id="book-title0"></div>
                        <div id="book-author0"></div>
                        <div id="book-publisher0"></div>
                        <div id="book-datetime0"></div>
                        <div id="book-contents0"></div>
                    </div>
                </div>
          	</div>
          	
            <hr><hr>
            
			<div id="book-body-content2">
				<div class="book-sell-img">
					<div class="book-sell-inf">
						<img src="resources/IMG/책이미지.jfif" style="width: 200px; height:300px;">
						<img src="resources/IMG/책이미지.jfif" style="width: 200px; height:300px;">
					</div>
					<div style="color: red;"><h1>100,000원</h1></div>
				</div>
				<div class="book-sell-img">
					<div class="book-sell-inf">
						<img src="resources/IMG/책이미지.jfif" style="width: 200px; height:300px;">
						<img src="resources/IMG/책이미지.jfif" style="width: 200px; height:300px;">
					</div>
					<div style="color: red;"><h1>100,000원</h1></div>
				</div>
				<div class="book-sell-img">
					<div class="book-sell-inf">
						<img src="resources/IMG/책이미지.jfif" style="width: 200px; height:300px;">
						<img src="resources/IMG/책이미지.jfif" style="width: 200px; height:300px;">
					</div>
					<div style="color: red;"><h1>100,000원</h1></div>
				</div>			
			</div>
            <!-- <div id="book-body-content2">
                <div id="book-inf4">
                    <div id="book-img4"></div>
                    <div class="book-text">
                        <div id="book-title4"></div>
                        <div id="book-author4"></div>
                    </div>
                </div>
                <div id="book-inf5">
                    <div id="book-img5"></div>
                    <div class="book-text">
                        <div id="book-title5"></div>
                        <div id="book-author5"></div>
                    </div>
                </div>
                <div id="book-inf6">
                    <div id="book-img6"></div>
                    <div class="book-text">
                        <div id="book-title6"></div>
                        <div id="book-author6"></div>
                    </div>
                </div>
                <div id="book-inf7">
                    <div id="book-img7"></div>
                    <div class="book-text">
                        <div id="book-title7"></div>
                        <div id="book-author7"></div>
                    </div>
                </div> -->
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
				
                <!-- <button id="prevPage">&lt;</button>
                <button id="book-page-btn1">1</button>
                <button id="book-page-btn2">2</button>
                <button id="book-page-btn3">3</button>
                <button id="book-page-btn4">4</button>
                <button id="nextPage">&gt;</button> -->
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
                    <% for(int i = 0; i < 8; i++) { %>
	                    $("#book-img<%= i %>").empty();
	                    $("#book-title<%= i %>").empty();
	                    $("#book-author<%= i %>").empty();
	                    <% } %>
	                    <% for(int i = 0; i < 8; i++) { %>
                        $("#book-img<%= i %>").append( "<img src='" +res.documents[<%= i %>].thumbnail + "'/>");
                        $("#book-title<%= i %>").append(res.documents[<%= i %>].title);
                        $("#book-author<%= i %>").append(res.documents[<%= i %>].authors);
                        $("#book-publisher<%= i %>").append(res.documents[<%= i %>].publisher);
                        $("#book-datetime<%= i %>").append(res.documents[<%= i %>].datetime.substring(0,10));
                        $("#book-contents<%= i %>").append(res.documents[<%= i %>].contents);
                        let bookdata<%=i%> = {
                        		thumbnail : res.documents[<%= i %>].thumbnail,
                        		title : res.documents[<%= i %>].title,
                        		author : res.documents[<%= i %>].authors,
                        		publisher : res.documents[<%= i %>].publisher,
                        		datetime : res.documents[<%= i %>].datetime,
                        		contents : res.documents[<%= i %>].contents
                        };
                        
                        <%-- function bookdetailPost<%=i%>(){sendPost("<%= request.getContextPath() %>/booksearchdetail.do", bookdata<%=i%>)};
                        $("#book-inf"+<%=i%>).click(bookdetailPost<%=i%>); --%>
                  <% } %>
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
    </script>

    </div>
</body>
</html>