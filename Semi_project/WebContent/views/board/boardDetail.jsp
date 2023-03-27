<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList <Board> boardList  = (ArrayList<Board>) request.getAttribute("boardList"); %>    
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
                            <div> 자유게시판</div>
                            <div id="createContent">
                            	<form action="<%=request.getContextPath()%>/insert.bo" method="post">
    	<input type="hidden" name="cNo" value="<%= request.getAttribute("cNo")%>">
    	<div><input type="text" id="title" name="title" placeholder="글 제목"></div>
            <div>
            <textarea id="content" name="content" placeholder="기본 설명 내용"></textarea></div>
            <div id="createContent-check">
                <div>첨부파일</div>
                <div>
                    <div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">질문</div>
                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">익명</div>
                    <div><button id="create-content-btn">글 작성</button></div>
                </div>
            </div>
            </form>
                            
                            </div>
                           <% if(boardList==null) { %>
                           	글이 없습니다,,
                           <% }else{ %>
                            <ul>
                           
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
                        <div>이전</div>
                        <div>다음</div>
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
    <script>
   <%--  document.getElementById("createContent").addEventListener("click",function(){
    	this.innerHTML = `
    	<form action="<%=request.getContextPath()%>/insert.bo" method="post">
    	<input type="hidden" name="cNo" value="<%= request.getAttribute("cNo")%>">
    	<div><input type="text" id="title" name="title" placeholder="글 제목"></div>
            <div>
            <textarea id="content" name="content" placeholder="기본 설명 내용"><input type="text" ></textarea></div>
            <div id="createContent-check">
                <div>첨부파일</div>
                <div>
                    <div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">질문</div>
                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">익명</div>
                    <div><button id="create-content-btn">글 작성</button></div>
                </div>
            </div>
            </form>
            `;
    }) --%>
    
    </script>



</body>

</html>