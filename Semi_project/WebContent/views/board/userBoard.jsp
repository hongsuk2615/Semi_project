<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   ArrayList <Board> boardList  = (ArrayList<Board>) request.getAttribute("boardList"); 
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage() == 0 ? 1 : pi.getMaxPage();
   int bType = (int)request.getAttribute("bType");
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
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
                         <c:choose>
                        	<c:when test="${bType eq 1 }">
                        		<div id="category">내가 쓴 게시글</div>
                       		</c:when>
                            <c:when test="${bType eq 2 }">
                        		<div id="category">내가 쓴 댓글</div>
                       		</c:when>
                       		<c:when test="${bType eq 3 }">
                        		<div id="category">내가 스크랩한 글</div>
                       		</c:when>
                         </c:choose> 
                           <% if(boardList.isEmpty()) { %>
                           <br>
                              글이 없습니다,,
                           <% }else{ %>
                            <ul id="content-area">
                           
                               <% for(Board b : boardList) { %>
                                <li>
                                <div class="\${i.boardNo}"style="display:none"><%= b.getBoardNo() %></div>
	                                <h3> <%= b.getTitle() %></h3>
	                                    <p><%= b.getContent() %></p><br>
										<div class="board-detail-footer">
										<div><%= b.getWriter() %> <div class="stringDate"><%= b.getStringDate() %></div>  </div>
	                                    <div class="board-detail-comment">
											<div class="board-detail-commend"> <img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like.png" alt="" width="17" height="17">
												<span><%= b.getRecommendCount() %></span></div>
												<div class="board-detail-commend"> <img src="<%=request.getContextPath()%>/resources/IMG/replyimg.png" alt="" width="17" height="17">
												<span><%= b.getReplyCount() %></span></div>
										</div>
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
                           
                           function dayStringMaker(Day){
                   	   		let sysdate = new Date();
                   	   		let enrollDate = new Date(Day);
                   	   		let result ='';
                   	   		let diff = sysdate - enrollDate;
                   	   		console.log(diff);
                   	   		if(diff<3600000){
                   	   			result =   Math.ceil(diff/1000/60) + '분전';
                   	   		}else if(diff<86400000){
                   	   			result = Math.floor(diff/1000/60/60) + '시간전';
                   	   		}else if(diff<2592000000){
                   	   			result = Math.floor(diff/1000/60/60/24) + '일전';
                   	   		}else if(diff<31104000000){
                   	   			result = Math.floor(diff/1000/60/60/24/30) + '개월전';
                   	   		}else {
                   	   			result = Math.floor(diff/1000/60/60/24/30/12) + '년전';
                   	   		}
                   	   		
                   	   		
                   	   		return result;
                   	   		
                   	   	}
                           
                           $(".stringDate").each(function(index, item){
								console.log(item);
								let dateString = dayStringMaker($(item).html());
								$(item).html(dateString);
                          });
                        </script>
                            
                            
                    </div>
                   
                       <div class="paging-area">
      <div>
          <c:choose>
		   	<c:when test="${bType eq 1 }">
		   		 <% if( currentPage != 1) { %><button onclick="location.href = '<%=request.getContextPath() %>/myWriting.bo?bType=<%=bType%>&currentPage=<%= currentPage -1 %>'">이전</button><% } %>
         <% if(currentPage != maxPage) { %><button onclick="location.href = '<%=request.getContextPath() %>/myWriting.bo?bType=<%=bType%>&currentPage=<%=currentPage + 1 %>' ">다음</button><% } %>
		  		</c:when>
		       <c:when test="${bType eq 2 }">
		   		 <% if( currentPage != 1) { %><button onclick="location.href = '<%=request.getContextPath() %>/myComments.bo?bType=<%=bType%>&currentPage=<%= currentPage -1 %>'">이전</button><% } %>
         <% if(currentPage != maxPage) { %><button onclick="location.href = '<%=request.getContextPath() %>/myComments.bo?bType=<%=bType%>&currentPage=<%=currentPage + 1 %>' ">다음</button><% } %>
		  		</c:when>
		  		<c:when test="${bType eq 3 }">
		   		 <% if( currentPage != 1) { %><button onclick="location.href = '<%=request.getContextPath() %>/myScrap.bo?bType=<%=bType%>&currentPage=<%= currentPage -1 %>'">이전</button><% } %>
         <% if(currentPage != maxPage) { %><button onclick="location.href = '<%=request.getContextPath() %>/myScrap.bo?bType=<%=bType%>&currentPage=<%=currentPage + 1 %>' ">다음</button><% } %>
		  		</c:when>
		    </c:choose> 
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