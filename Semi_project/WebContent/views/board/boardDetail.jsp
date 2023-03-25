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
                            <div id="createContent"> 글 작성 > 글 제목
                                <div>내용</div>
                                <div id="createContent-check">
                                    <div>첨부파일</div>
                                    <div>체크 및 글작성
                                        <div>질문 ㅇ</div>
                                        <div>익명 ㅇ</div>
                                        <div>글작성버튼</div>
                                    </div>
                                </div>
                            </div>
                           <% if(boardList.isEmpty()) { %>
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



</body>

</html>