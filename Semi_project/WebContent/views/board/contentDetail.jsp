<%@ page import="com.khtime.board.model.vo.Board, java.util.ArrayList, com.khtime.board.model.vo.Reply" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Board b =(Board) request.getAttribute("b"); 
	ArrayList<Reply> replyList = (ArrayList<Reply>) request.getAttribute("replyList"); 
	String cName = (String) request.getAttribute("cName");
	String alertMsg = (String)session.getAttribute("alertMsg");
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

<!-- alert -->
	<% if( alertMsg != null && !alertMsg.equals("")) { %>
			<script> alert("<%= alertMsg %>")</script>
			<% session.removeAttribute("alertMsg"); %>
		<% } %>


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
                                    <div id="content-header-right"> <!-- 관리자일 경우 삭제가능하게 만들기 -->
                                        <%if( request.getSession().getAttribute("loginUser") != null &&((Member)request.getSession().getAttribute("loginUser")).getNickName().equals(b.getWriter())){ %>
                                        	<button id="deleteBoard">삭제</button>
                                        	<button id="updateBoard">수정</button>
                                        	<script>
                                        	 document.getElementById("deleteBoard").addEventListener("click",function(){
                                     	        location.href = "<%= request.getContextPath() %>/delete.bo?bNo="+<%= b.getBoardNo() %>;
                                     	    })
                                     	    
                                     	    document.getElementById("updateBoard").addEventListener("click",function(){
                                     	        location.href = "<%= request.getContextPath() %>/update.bo?bNo="+<%= b.getBoardNo() %>;
                                     	    })
                                        	</script>
                                        <% }else{ %>
                                        쪽지 신고
										<% } %>                                        
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
                                    <div id="replydiv"><%= b.getReplyCount() %></div>
                                    <div><%= b.getScrapCount() %></div>
                                </div>
                                <div>
                                    <button id="recommendbtn">공감</button>
                                    <button id="scrapbtn">스크랩</button>
                                </div>
                            </div>
                            


                            <!-- 댓글 -->
                            
                         <ul id="comments-area">
                            <% if(replyList.isEmpty()) { %>
                           	<li>글이 없습니다,,</li>
                           <% }else{ %>
                              
                           
                            	<% for(Reply r : replyList) { %>
                               <li>
							
							<%= r.getReplyNo() %>
							 <div class='content-detail-comments'>
							 <div class='comments-left'>
							 프로필사진
							 <%= r.getWriter() %>
							 </div>
							 <div class='comments-right'>
		                     대댓글 신고
		                     <button id="recommendbtn<%= r.getReplyNo() %>" onclick="recommendclick(this.id)">공감</button>
		                     <button id="deletebtn<%= r.getReplyNo() %>" onclick="deleteclick(this.id)">삭제</button>
		                     </div>
		                     </div>
		                     <%= r.getContent() %>
		                     <br>
		                     <%= r.getEnrollDate() %>
		                     <br>
		                      <%= r.getRecommendCount() %>
		                     </li>
                               
                              	  <% } %>
                                 <% } %>
                                  </ul>
                    <!-- 댓글달기 -->
                    <div id="createComments">
                        <div>
                           <textarea id="replyContent" cols="50" rows="3" style="resize:none;" placeholder="댓글입력"></textarea>
                        </div>
                        <div>
                            <div>
                                <input id="isAnonimous" name="isAnonimous" type="checkbox" value="Y">익명
                            </div>
                            <div>
                                <button onclick="replyisEmpty()">글작성 버튼</button>
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
		
		function replyisEmpty(){
			if(document.getElementById("replyContent").value.trim().length == 0){ 
				alert("댓글 입력해주세요");
			}else{
				insertReply();
			}
		}
		
		 function insertReply(){
			$.ajax({
				url : "<%=request.getContextPath()%>/insert.re",
				data :{
					bNo : "<%= b.getBoardNo() %>",
					content : $("#replyContent").val(),
					isAnonimous : $("#isAnonimous").val()
				}, 
				success : function(result){
					console.log(result);
					if(result > 0){
						$("#comments-area").html("");
						selectReplyList();
						selectReplyCount();
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
			let replycount = 0;
			$.ajax({
				url : "<%=request.getContextPath()%>/select.re",
				data : { bNo : "<%=b.getBoardNo() %>"},
				success : function(list){
					let result  = "";
					for(let i of list){ 
						result += "<li>"
							// <0,1> <1,2> <2,3> <3,4> 
							 + i.replyNo
							 + "<div class='content-detail-comments'>"
							 + "<div class='comments-left'>"
							 +"프로필사진"
							 + i.writer
							 + "</div>"
							 + "<div class='comments-right'>"
		                     + " 대댓글 신고"
		                     +"<button id=recommendbtn"+i.replyNo+" onclick='recommendclick(this.id)'>공감</button>"
		                     +"<button id=deletebtn"+i.replyNo+" onclick='deleteclick(this.id)'>삭제</button>"
		                     + "</div>"
		                     + "</div>"
		                     + i.content
		                     + "<br>"
		                     + i.enrollDate
		                     + "<br>"
		                     + i.recommendCount
		                     + "</li>"
					}
					$("#comments-area").html(result);
				},
				error : function(){
					console.log("게시글 목록조회 실패")
				}
			})
		}
		
		function selectReplyCount(){
			
			$.ajax({
				url : "<%=request.getContextPath()%>/content.re",
				data :{
					bNo : "<%= b.getBoardNo() %>"
				}, 
				success : function(result){
					console.log("보드테이블 댓글개수:"+ result);
						$("#replydiv").html(result);
					
				}, error : function(){
					console.log("댓글개수 조회 실패")
				}
			
			})
		} 
	
		
	
		</script>
		
		<script>
		 document.getElementById("recommendbtn").addEventListener("click",function(){
  	        location.href = "<%= request.getContextPath() %>/recommend.bo?bNo="+<%= b.getBoardNo() %>;
  	        
  	    })
  	    
  	    document.getElementById("scrapbtn").addEventListener("click",function(){
  	        location.href = "<%= request.getContextPath() %>/scrap.bo?bNo="+<%= b.getBoardNo() %>;
  	    })
  	   
  	    function deleteclick(id){
			 alert(id.substr(9));
			 location.href = "<%= request.getContextPath() %>/delete.re?bNo="+<%= b.getBoardNo() %>+"&rNo="+id.substr(9);
		 }
		 
		 function recommendclick(id){
			 alert(id.substr(12));
			 location.href = "<%= request.getContextPath() %>/recommend.re?bNo="+<%= b.getBoardNo() %>+"&rNo="+id.substr(12);
		 }
	</script>




</body>

</html>