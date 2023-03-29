<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>    
    <% 
   ArrayList <Board> bestList  = (ArrayList<Board>) request.getAttribute("bestList"); 
    int rcCount = Integer.parseInt(request.getParameter("rcCount"));
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   int currentPage = Integer.valueOf(request.getParameter("currentPage")==null?"0":request.getParameter("currentPage"));
   
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
                            <div> BEST 게시판</div>
                            <div>
                            <a href="">23년 상반기</a>
                            <a href="">22년 하반기</a>
                            <a href="">22년 상반기</a>
                            <a href="">21년 하반기</a>
                            <a href="">21년 상반기</a>
                            </div>
							<% if(bestList==null) { %>
                              글이 없습니다,,
                           <% }else{ %>
                            <ul>
                           
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