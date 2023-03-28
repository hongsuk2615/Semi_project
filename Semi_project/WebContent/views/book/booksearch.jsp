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
    <title>bookSearch</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
    
    <style>
        img {
            width: 180px;
            height: 290px;
            display: flex;
            justify-content: center;
    		align-items: center;
        }
        .book-text {
        	width: 200px;
        	height:100px;
        	display: flex;
            justify-content: center;
    		align-items: center;
    		flex-direction: column;
    		text-align: center;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <div id="book-header">
            <div id="book-header-content">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
                <div id="book-logo">
                    <img src="resources/IMG/book.png" alt="" style="height: 120px; width: 160px;">중고 책방
                </div>
                <div id="book-header-right">
                    로그인 된 회원 정보
                </div>
            </div>
        </div>
        <div id="book-navbar">
            <div id="book-btn">
                <button id="book-home-btn">
                    <img src="resources/IMG/home.png" id="book-home-btn-img">
                    홈
                </button>
                <button id="book-sell-btn">
                    <img src="resources/IMG/pencil.png" id="book-sell-btn-img">
                    판매하기
                </button>
            </div>
        </div>
        <div id="book-body">
            <div id="book-search">
                <div id="book-search-input">
                    <img src="resources/IMG/glass.png" id="glass">
                    <input name="bookname" id="bookname" type="text" placeholder="검색한 책 이름" style="width: 300px;  height: 28px;" value="<%=request.getAttribute("bookname") == null ? "" : request.getAttribute("bookname") %>">
                    <button type="button" id="search-btn">검색</button>
                </div>
            </div>
            <div id="book-body-content1">
                <div id="book-inf0">
                    <div id="book-img0"></div>
                    <div class="book-text"> 
                        <div id="book-title0"></div>
                        <div id="book-author0"></div>
                    </div>
                </div>
                <div id="book-inf1">
                    <div id="book-img1"></div>
                    <div class="book-text">
                        <div id="book-title1"></div>
                        <div id="book-author1"></div>
                    </div>
                </div>
                <div id="book-inf2">
                    <div id="book-img2"></div>
                    <div class="book-text">
                        <div id="book-title2"></div>
                        <div id="book-author2"></div>
                    </div>
                </div>
                <div id="book-inf3">
                    <div id="book-img3"></div>
                    <div class="book-text">
                        <div id="book-title3"></div>
                        <div id="book-author3"></div>
                    </div>
                </div>
            </div>

            <hr><hr>

            <div id="book-body-content2">
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
                </div>
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
						<button id="btn<%= currentPage %>" onclick="location.href = '<%=contextPath%>/booksearch.do?bookname=<%= request.getAttribute("bookname") %>&currentPage=<%= i %>'; "><%= i %></button>
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
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book",
                    data: { query: $("#bookname").val(), size :"8" , page: currPage } ,
                    headers: { Authorization : "KakaoAK 36b9faff2b40c9d761ac0092c6c33863" }
                })
    
                .done(function (res){
                	console.log(res);
                	console.log(res.length);
                	
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
	                    $("#book-datetime<%= i %>").append(res.documents[<%= i %>].datetime);
	                    let bookdata<%=i%> = {
	                    		thumbnail : res.documents[<%= i %>].thumbnail,
	                    		title : res.documents[<%= i %>].title,
	                    		author : res.documents[<%= i %>].authors,
	                    		publisher : res.documents[<%= i %>].publisher,
	                    		datetime : res.documents[<%= i %>].datetime,
	                    		contents : res.documents[<%= i %>].contents
	                    };
                        
                        function bookdetailPost<%=i%>(){sendPost("<%= request.getContextPath() %>/booksearchdetail.do", bookdata<%=i%>)};
                        $("#book-inf"+<%=i%>).click(bookdetailPost<%=i%>);
                        
                        
                  <% } %>
                });
            }
            $("#search-btn").click(function(){
            	
            	location.href="<%=request.getContextPath()%>/booksearch.do?bookname="+document.getElementById('bookname').value;
            });
           
      		
           $("#search-btn").click(function(){
                if( $("#bookname").val() == "") { 
               	alert("도서 제목을 검색 해 주세요.");
               } 
           })
            
            $("#book-footer button ").click(getBooks);
           
           	$("#nextPage").click(function(){
       			currPage++;
       		/* 	let a = "btn"+currPage; */
       			
       			location.href = '<%=contextPath%>/booksearch.do?bookname=<%= request.getAttribute("bookname") %>&currentPage='+currPage;
       			<%-- $(a).click("#btn<%= currentPage %>"); --%>
       			/* getBooks(); */
       		});
           	$("#prevPage").click(function(){
           		currPage--;
           		/* 	let a = "btn"+currPage; */
           			
           			location.href = '<%=contextPath%>/booksearch.do?bookname=<%= request.getAttribute("bookname") %>&currentPage='+currPage;
           			<%-- $(a).click("#btn<%= currentPage %>"); --%>
           			/* getBooks(); */
       		});
           <% if ( request.getAttribute("bookname") != "" && currentPage != 1  ) { %>
           		getBooks();
           <% } %>
           
         
           getBooks();
        }); 
    </script>
    
    <script>
    function sendPost(url, params) {
        var form = document.createElement('form');
        form.setAttribute('method', 'post'); //POST 메서드 적용
        form.setAttribute('action', url);	// 데이터를 전송할 url
        document.charset = "utf-8";
        for ( var key in params) {	// key, value로 이루어진 객체 params
            var hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden'); //값 입력
            hiddenField.setAttribute('name', key);
            hiddenField.setAttribute('value', params[key]);
            form.appendChild(hiddenField);
            console.log(key);
            console.log(params[key]);
        }
        document.body.appendChild(form);
        form.submit();	// 전송~
    }
   
    </script>

    </div>
</body>
</html>