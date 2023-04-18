
<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList <Board> searchList  = (ArrayList<Board>) request.getAttribute("searchList"); 
	ArrayList <Integer> recommendcheck  = (ArrayList<Integer>) request.getAttribute("recommendcheck"); 
	ArrayList <Integer> scrapcheck  = (ArrayList<Integer>) request.getAttribute("scrapcheck"); 
	String keyword = (String) request.getAttribute("keyword");
   
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/body.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/boardDetail.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <title>Document</title>
    <style>
        * {
            /* border: 1px solid rgba(128, 128, 128, 0.568); */
        }
    
        div {
            display: inline-block;
            box-sizing: border-box;
        }
    
        a {
            text-decoration: none;
            color: black;
        }
    
        #wrapper {
            width: 100%;
            min-width: 1180px;
            background-color: #f1f4f9;
        }
    </style>
</head>
<body>

    <div id="wrapper">
    <!-- 위로 가기 버튼 -->
    <div class="gototopdiv displaynone"><button class="btnsetting" type="button" style="position:fixed; right: 50px; bottom: 50px;" onclick="window.scrollTo(0, 0);"><img src="<%=request.getContextPath()%>/resources/IMG/up.png" width='30' height='30'></button></div>
    
    <!-- 위로 가기 버튼 -->
        <%@ include file="../common/header.jsp" %>
        <div id="body">
            
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <div id="board-detail">
                            <div id="category" >
                            	"<%=keyword%>"으로 검색한 결과
                            </div>
	<script>
	let recommendBoards = [];
	<% for(Integer i : recommendcheck){%>
		recommendBoards.push(<%=i%>);
	<% } %>
	
	let scrapBoards = [];
	<% for(Integer i : scrapcheck){%>
		scrapBoards.push(<%=i%>);
	<% } %>
	</script>
                            <ul id="content-area">
                           <% if(searchList.isEmpty()) { %>
                           <li class="shadownone" style="display:flex; align-items : center; pointer-events : none;"> <div style="text-align:center; width:100%">조회된 게시물이 없습니다</div></li>
                           <% } %>
                            </ul>
						<script>
						
						let boardCount = 0;
						function loadBoard(){
							boardCount = boardCount + 1;
							$.ajax({
								url : "<%=request.getContextPath()%>/boDetailSearch.do",
								type : "post", 
								data :{
									keyword : "<%=keyword %>",
									currentPage : boardCount
								}, 
								success : function(list){
									let result  = "";
									console.log("list"+list);
									for(let i of list){ 
										i.writer = i.isAnonimous == ("Y") ? "익명" : i.writer;
										result += 
										`
										<li>
										<div class="boardNo\${i.boardNo} displaynone">\${i.boardNo}</div>
		                                <h3>\${i.title}</h3>
		                                    <p>\${i.content}</p><br>
											<div class="board-detail-footer">
											<div class="board-detail-footer-left">`
											if(i.writer == "익명"){
												result += `<img src="<%=request.getContextPath()%>/resources/IMG/user.png" width="30" height="30">`
											}else{
												result += `<img src="<%= request.getContextPath() %>\${i.userProfile}" width="30" height="30">`
											}
											result += `<span class="spanWriter">\${i.writer}<span> <div class="stringDate"><span class="spanDate">\${dayStringMaker(i.stringDate)} <span></div></div>
		                                    <div class="board-detail-comment">
												<div class="board-detail-commend"> `;
												
												if(recommendBoards.includes(i.boardNo)){
													result += `<img class="recommendImg includes" src="<%=request.getContextPath()%>/resources/IMG/like2.png">
													<span style="color: red;">\${i.recommendCount}</span></div>`;
												}else{
													result += `<img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like1.png">
														<span style="color: red;">\${i.recommendCount}</span></div>`;
												}
													if(scrapBoards.includes(i.boardNo)){
														result += `<div class="board-detail-commend"> <img class="includes" src="<%=request.getContextPath()%>/resources/IMG/star1.png">
													<span style="color: #ffcc1c;">\${i.scrapCount}</span></div>`
													}else{
														result += `<div class="board-detail-commend"> <img src="<%=request.getContextPath()%>/resources/IMG/star.png">
															<span style="color: #ffcc1c;">\${i.scrapCount}</span></div>`
													} result +=	` <div class="board-detail-commend"> <img style="padding-top: 3px;" src="<%=request.getContextPath()%>/resources/IMG/message.png">
														<span style="color: #666666;">\${i.replyCount}</span></div>
											</div>
										</div>
                                		</li>
					                     `
									}
										$("#content-area").append(result);
										selectContent();
									
								}, error : function(){
									khalert("게시글 조회 실패");
								}
							
							})
						}
						
						function selectContent(){
							$("#board-detail li").click(function(){
								let bNo = $(this).children().eq(0).text();
								location.href = '<%= request.getContextPath() %>/contentDetail.bo?bNo='+bNo;
								
							});
						}
						
						function removeLoadingImg(){
							$('.loadingbox').each(function(index,item){
				        		   item.remove();
						});
						}

					     window.onscroll = function(e) {
					         if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
					        	 if($('.loadingbox').length == 0){
					        	$("#content-area").append("<li class='loadingbox'><img src='<%=request.getContextPath()%>/resources/IMG/loadingGif.gif' width='100' height='100'></li>");
					        	 }
					        	setTimeout(loadBoard, 500);
					            setTimeout(removeLoadingImg, 500);
					           
					         }
					       }	     
								    
								</script>
                            
                            
                    </div>
                   
                    </div>
    
                </div>

                <%@ include file="../common/body_right.jsp" %>
            </div>
        </div>


        <div id="footer">



        </div>
    </div>
   <script>
		  
	 /* 처음 페이지 로드 시 게시글 조회 함수 호출 */
	$(function(){loadBoard();});
	 
	
	 window.addEventListener("scroll",function(){
	 if(window.scrollY > 800){
		 $(".gototopdiv").fadeIn();
	 }else{
		 $(".gototopdiv").fadeOut();
	 }
	 })
	 
	   	function dayStringMaker(Day){
	   		let sysdate = new Date();
	   		let enrollDate = new Date(Day);
	   		let result ='';
	   		let diff = sysdate - enrollDate;
	   		
	   		const year = enrollDate.getFullYear();
	   		const month = enrollDate.getMonth() + 1;
	   		const date = enrollDate.getDate();
	   		const hour = enrollDate.getHours();
	   		const minutes = enrollDate.getMinutes();
	   		
	   		if(diff<3600000){
	   			result =   Math.ceil(diff/1000/60) + '분전';
	   		}else if(diff<86400000){
	   			result = Math.floor(diff/1000/60/60) + '시간전';
	   		}else if(diff<31104000000){
	   			result = year+"/"+month+"/"+date+" "+hour+":"+minutes;
	   		}else {
	   			result = Math.floor(diff/1000/60/60/24/30/12) + '년전';
	   		}
	   		
	   		
	   		return result;
	   		
	   	}
   </script>
	
	 <%@ include file="../common/khalertmodal.jsp" %>
	

<script type="text/javascript" src="resources/JS/khalertmodal.js"></script>


</body>

</html>