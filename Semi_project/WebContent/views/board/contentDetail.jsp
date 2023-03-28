<%@ page import="com.khtime.board.model.vo.Board, java.util.ArrayList, com.khtime.board.model.vo.Reply" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Board b =(Board) request.getAttribute("b"); 
	ArrayList<Reply> replyList = (ArrayList<Reply>) request.getAttribute("replyList"); 
	String cName = (String) request.getAttribute("cName");
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
    <link rel="stylesheet" href="resources/CSS/contentDetail.css">
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
                        <div id="content-detail">
                            <div> <%= cName %>게시판</div>
                            <div id="content-detail-content"> 
                                <div id="content-header">
                                    <div id="content-header-left">
                                        <div id="content-profile">
                                            프로필
                                        </div>
                                        <div id="content-writer">
                                            <div>
                                              <% if(b.getIsAnonimous().equals("N")) { %>
                                                <%= b.getWriter() %>
                                                <% }else { %>
                                                익명
                                                <% } %> 
                                              
                                            </div>
                                            <div>
                                                <%= b.getEnrollDate() %>
                                            </div>
                                        </div>
                                        </div>
                                    <div id="content-header-right">
                                        쪽지 신고
                                    </div>
                                </div>
                                <div>
                                    <%= b.getTitle() %>
                                </div>
                                <div>
                                   <%= b.getContent() %>
                                </div>
                                <div>
                                    <div><%= b.getRecommendCount() %></div>
                                    <div><%= b.getReplyCount() %></div>
                                    <div><%= b.getScrapCount() %></div>
                                </div>
                                <div>
                                    <button>공감</button>
                                    <button>스크랩</button>
                                </div>
                            </div>
                            


                            <!-- 댓글 -->
                            
                            <ul id="comments-area">
                           
                            </ul>
                            
                    <!-- 댓글달기 -->
                    <div id="createComments">
                        <div>
                           <textarea id="replyContent" cols="50"  rows="3" style="resize:none;" >댓글입력.</textarea>
                        </div>
                        <div>
                            <div>
                                <input id="isAnonimous" name="isAnonimous" type="checkbox">익명
                            </div>
                            <div>
                                <button onclick="insertReply()">글작성 버튼</button>
                            </div>
                        </div>
                    </div>
                </div>
                    <div id="goto-boardlist">
                       
                        <div>글 목록</div>
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
		$(function(){
			setInterval(selectReplyList, 1000);
		});
		
		function insertReply(){
			$.ajax({
				url : "<%=request.getContextPath()%>/rInsert.bo",
				data :{
					content : $("#replyContent").val(), 
					bNo     : "<%= b.getBoardNo() %>",
					isAnonimous : $("#isAnonimous").val()
				}, 
				success : function(result){
					//댓글등록성공시  result = 1
					
					// 댓글등록 실패시 result = 0
					if(result > 0){
						//새 댓글목록 불러오는 함수호출
						selectReplyList();
						// 댓글내용 비워주기
						$("#replyContent").val("");
					}else{
						alert("댓글작성에 실패했습니다.");	
					}
				}, error : function(){
					console.log("댓글작성실패")
				}
			})
		}
		
		function selectReplyList(){
			$.ajax({
				url : "<%=request.getContextPath()%>/rSelect.bo",
				data : { bNo : "<%=b.getBoardNo() %>"},
				success : function(list){
					let result  = "";
					for(let i of list){ 
						result += "<li>"
							 + "<div class='content-detail-comments'>"
							 + "<div class='comments-left'>"
							 +"프로필사진"
							 + i.writer
							 + "</div>"
							 + "<div class='comments-right'>"
		                     + " 대댓글 공감 쪽지 신고"
		                     + "</div>"
		                     + "</div>"
		                     + i.content
		                     + "<br>"
		                     + i.enrollDate
		                     + "<br>"
		                     + "</li>"
					}
					$("#comments-area").html(result);
				},
				error : function(){
					console.log("게시글 목록조회 실패")
				}
			})
		}
	</script>




</body>

</html>