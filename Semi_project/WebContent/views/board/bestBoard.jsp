<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>    
 <% 
   ArrayList <Board> bestList  = (ArrayList<Board>) request.getAttribute("bestList"); 
    int rcCount = Integer.parseInt(request.getParameter("rcCount"));
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   int currentPage = Integer.valueOf(request.getParameter("currentPage")==null?"0":request.getParameter("currentPage"));
   String boardTitle = (String)request.getAttribute("boardTitle");
   String year = request.getParameter("year");
   %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/CSS/header.css">
    <link rel="stylesheet" href="../../resources/CSS/base.css">
    <link rel="stylesheet" href="../../resources/CSS/body.css">
    <link rel="stylesheet" href="../../resources/CSS/footer.css">
    <link rel="stylesheet" href="../../resources/CSS/bestBoard.css">
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
        <%@ include file="../common/header.jsp" %>
        <div id="body">
            
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <div id="board-detail">
                            <div id="category"> <%= boardTitle%></div>
                            <div id="createContentbox">
                            <a href="<%=request.getContextPath()%>/best.bo?rcCount=<%=rcCount %>&year=2023" >2023</a>
                            <a href="<%=request.getContextPath()%>/best.bo?rcCount=<%=rcCount %>&year=2022">2022</a>
                            <a href="<%=request.getContextPath()%>/best.bo?rcCount=<%=rcCount %>&year=2021">2021</a>
                            </div>
							<% if(bestList==null) { %>
                              글이 없습니다,,
                           <% }else{ %>
                            <ul id="content-area">
                           
                              <% for(Board b : bestList) { %>
                                <li><div class="boardNo"style="display:none"><%= b.getBoardNo() %></div>
                                <%= b.getTitle() %><br>
                                    <%= b.getContent() %> <br>
                                   <%= b.getEnrollDate() %> &nbsp; <%= b.getWriter() %><br>
                                    <div id="board-detail-comment">
                                        <div>첨부파일</div>
                                        <div><%= b.getRecommendCount() %></div>
                                        <div><%= b.getReplyCount() %></div>
                                    </div>
                                </li>
                               
                                   <% } %>
                                 <% } %> 
                            </ul>
                             <script>
                           $(function(){
                              $("#board-detail li").click(function(){
                                 let bNo = $(this).children().eq(0).text();
                                 location.href = '<%= request.getContextPath() %>/contentDetail.bo?bNo='+bNo;
                                 
                              });
                           });
                        </script>
                        
                        
                        
                        <script>
						
						let boardCount = 0;
						function loadBoard(){
							boardCount = boardCount + 1;
							$.ajax({
								url : "<%=request.getContextPath()%>/best.bo",
								type : "post", 
								data :{
									year : <%=year %>,
									rcCount : <%=rcCount %>,
									currentPage : boardCount
								}, 
								success : function(list){
									let result  = "";
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
									alert("게시글 조회 실패");
								}
							
							})
						}
						
						
					
								     
								    
								</script>
                        
                        
                        
                        
                        
        <script>
        
	    
	    $("#board-8 th").click(function(){
	    	let date = new Date();
	    	location.href = "<%=request.getContextPath()%>/best.bo?rcCount=99&year="+date.getFullYear();
	    })
    </script>
    
    
    
                            
                    </div>
                     <div id="board-detail-search">
                       
                        <div>검색창</div>
                        <div id="board-detail-search-pagebtn">
				                        
				      <div align="center" class="paging-area">
				         
				         <% if( currentPage != 1) { %>
				            <button onclick="location.href = '<%=request.getContextPath() %>/best.bo?rcCount=<%=rcCount%>&currentPage=<%= currentPage -1 %>'">이전</button>
				         <% } %>
				         
				         <% if(currentPage != pi.getMaxPage()) { %>
				            <button onclick="location.href = '<%=request.getContextPath() %>/best.bo?rcCount=<%=rcCount%>&currentPage=<%=currentPage + 1 %>' ">다음</button>
				         <% } %>
				         
				      </div>
                        </div>
                    </div>
                    
                    </div>
    
                </div>

                <%@ include file="../common/body_right.jsp" %>
            </div>
        </div>


        <div id="footer">



        </div>
    </div>



</body>

</html>