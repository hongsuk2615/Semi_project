<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   ArrayList <Board> boardList  = (ArrayList<Board>) request.getAttribute("boardList"); 
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   int currentPage = pi.getCurrentPage();
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
                        	<c:when bType == 1>
                        		<div>내가 쓴 게시글</div>
                       		</c:when>
                            <c:when bType == 2>
                        		<div>내가 쓴 댓글</div>
                       		</c:when>
                       		<c:when bType == 3>
                        		<div>내가 스크랩한 글</div>
                       		</c:when>
                         </c:choose> 
                           <% if(boardList.isEmpty()) { %>
                           <br>
                              글이 없습니다,,
                           <% }else{ %>
                            <ul id="content-area">
                           
                               <% for(Board b : boardList) { %>
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
                            
                            
                    </div>
                    <div id="board-detail-search">
                       
                        <div>검색창</div>
                        <div id="board-detail-search-pagebtn">
                        
      <div align="center" class="paging-area">
          <c:choose>
		   	<c:when bType == 1>
		   		 <% if( currentPage != 1) { %><button onclick="location.href = '<%=request.getContextPath() %>/myWriting.bo?bType=<%=bType%>&currentPage=<%= currentPage -1 %>'">이전</button><% } %>
         <% if(currentPage != pi.getMaxPage()) { %><button onclick="location.href = '<%=request.getContextPath() %>/myWriting.bo?bType=<%=bType%>&currentPage=<%=currentPage + 1 %>' ">다음</button><% } %>
		  		</c:when>
		       <c:when bType == 2>
		   		 <% if( currentPage != 1) { %><button onclick="location.href = '<%=request.getContextPath() %>/myComments.bo?bType=<%=bType%>&currentPage=<%= currentPage -1 %>'">이전</button><% } %>
         <% if(currentPage != pi.getMaxPage()) { %><button onclick="location.href = '<%=request.getContextPath() %>/myComments.bo?bType=<%=bType%>&currentPage=<%=currentPage + 1 %>' ">다음</button><% } %>
		  		</c:when>
		  		<c:when bType == 3>
		   		 <% if( currentPage != 1) { %><button onclick="location.href = '<%=request.getContextPath() %>/myScrap.bo?bType=<%=bType%>&currentPage=<%= currentPage -1 %>'">이전</button><% } %>
         <% if(currentPage != pi.getMaxPage()) { %><button onclick="location.href = '<%=request.getContextPath() %>/myScrap.bo?bType=<%=bType%>&currentPage=<%=currentPage + 1 %>' ">다음</button><% } %>
		  		</c:when>
		    </c:choose> 
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