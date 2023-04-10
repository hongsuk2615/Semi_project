<%@ page import="com.khtime.board.model.vo.Board, java.util.ArrayList, com.khtime.board.model.vo.Reply, com.khtime.board.model.vo.BoardAttachment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Board b =(Board) request.getAttribute("b"); 
	ArrayList <BoardAttachment> attachmentList  = (ArrayList<BoardAttachment>) request.getAttribute("attachmentList");
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
    <link rel="stylesheet" href="resources/CSS/sendmessagemodal.css">
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
                        <div id="content-detail">
                            <div onclick="location.href='<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= b.getCategoryNo() %>'"> <%= cName %>게시판</div>
                            <div id="content-detail-content"> 
                                <div id="content-header">
                                    <div id="content-header-left">
                                        <div id="content-profile">
                                            <img src="<%= request.getContextPath() %><%= b.getUserProfile() %>" width="30" height="30">
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
                                        <%if( loginUser != null &&loginUser.getAuthority() == 0 ||
                                        		loginUser != null && loginUser.getNickName().equals(b.getWriter())){ %>
                                        	<button id="deleteBoard">삭제</button>
                                        	<button id="updateBoard">수정</button>
                                        	<script>
                                        	 document.getElementById("deleteBoard").addEventListener("click",function(){
                                        		 if(confirm("정말 삭제하시겠습니까?")){ 
                                     	        	location.href = "<%=request.getContextPath() %>/delete.bo?bNo=<%=b.getBoardNo()%>&cNo=<%=b.getCategoryNo()%>&aC=<%=attachmentList.size()%>&isQ=<%=b.getIsQuestion()%>";
                                        		 }
                                     	    })
                                        			
                                     	    document.getElementById("updateBoard").addEventListener("click",function(){
                                     	        location.href = "<%= request.getContextPath() %>/update.bo?bNo=<%=b.getBoardNo()%>&cNo=<%=b.getCategoryNo()%>";
                                     	    })
                                        	</script>
                                        <% }else{ %>
                                        	<button id="msgBoard">쪽지</button>
                                        	<button id="reportBoard">신고</button>
                                        	<script>
                                        
                                        	
                                        	
                                        	document.getElementById("reportBoard").addEventListener("click",function(){
                                        		if(confirm("정말 신고하시겠습니까?")){ 
                                    	  	    $.ajax({
                                    					url : "<%= request.getContextPath() %>/report.bo",
                                    					data : {bNo : <%= b.getBoardNo() %>},
                                    					success : function(data){
                                    						if(data > 0) alert("신고 성공!");
                                    						if(data < 0) alert("이미 신고된 글입니다!");
                                    						}
                                    				});
                                        		}
                                      	    })
                                      	    
                                        	
                                        	</script>
										<% } %>                                        
                                    </div>
                                </div>
                                <div>
                                    글 번호:<%= b.getBoardNo()%> , <%= b.getTitle() %>
                                </div>
                                <div>
                                   <%= b.getContent() %>
                                </div>
								
                                <div id="file-area">
                                        <% for(BoardAttachment at : attachmentList){ %>
												<img src="<%= request.getContextPath() %><%= at.getFilePath()+at.getChangeName() %>" width="100%" height="100%">
										<% } %></div>
                                <div>
                                    <div id="recommenddiv"><%= b.getRecommendCount() %></div>
                                    <div id="replydiv"><%= b.getReplyCount() %></div>
                                    <div id="scrapdiv"><%= b.getScrapCount() %></div>
                                </div>
                                <div>
                                    <button id="recommendbtn">공감</button>
                                    <button id="scrapbtn">스크랩</button>
                                </div>
                            </div>

                            <!-- 댓글 -->
                            
                         <ul id="comments-area"></ul>
                         
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
                                <button onclick="insertReply()">글작성 버튼</button>
                            </div>
                        </div>
                    </div>
                </div>
                    <div id="goto-boardlist">
                       
                        <div onclick="location.href='<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= b.getCategoryNo() %>'">글 목록</div>
                    </div>
                    </div>
    
                </div>

                <%@ include file="../common/body_right.jsp" %>
            </div>
        </div>
        

        <div id="footer">



        </div>
        <form action="<%= request.getContextPath() %>/sendMsgBoard.do" method="post">
		     <input type="hidden" name="boardNo" id="BoardNo" value="<%=b.getBoardNo()%>">
			 <div class="msg-modal hidden">
				<div class="Msgbg"></div>
				<div class="msg-modalBox">
					<div class="header">
						<h2>작성자에게 쪽지보내기</h2>
					</div>
						<div class="sendMsgBody">
							<div class="inputBox">
								<h4 class="inputLabel">쪽지보내기</h4>            
		              			<input onkeydown='mykeydown()' style="height: 130px; white-space: pre;" maxlength="70" type="textarea" name="content" placeholder="공백포함 최대60자" class="inputField" required /><br>
						  </div>
						<button type="submit" class="closeBtn" id="fullBlueBtn4">보내기</button>			
						</div>
				</div>
			</div>
	  </form>
    </div>
    	<script> <!-- 쪽지보내기모달 textarea 엔터키 감지스크맆트 -->
    function mykeydown() { 
        if(window.event.keyCode==13) //enter 일 경우
        {
            sendServer();
        }
     }
    </script>
    <script> <!--쪽지보내기모달 닫는 스크맆트-->
      const openMsg = () => {
          document.querySelector(".msg-modal").classList.remove("hidden");
          
      }
      const closeMsg = () => {
          console.log('cdlose')
          document.querySelector(".msg-modal").classList.add("hidden");
      }
      
      document.querySelector(".closeBtn").addEventListener("click", closeMsg);
      document.querySelector(".Msgbg").addEventListener("click", closeMsg);
      document.getElementById('msgBoard').addEventListener("click", openMsg);
  </script>
    
    
		<script>
		/* 댓글 입력, 조회, 댓글개수 증가 */
		/* function replyisEmpty(){
			if(document.getElementById("replyContent").value.trim().length == 0){ 
				alert("댓글 입력해주세요");
			}else{
				insertReply();
			}
		} */
		/* 댓글 입력 */
		 function insertReply(){
			$.ajax({
				url : "<%=request.getContextPath()%>/insert.re",
				data :{
					bNo : "<%= b.getBoardNo() %>",
					content : $("#replyContent").val().replace(/(\n|\r\n)/g, '<br>'),
					isAnonimous : $("#isAnonimous").prop('checked') ? 'Y' : 'N'
				}, 
				success : function(result){
					if(result > 0){
						selectReplyList();
						selectReplyCount();
						$("#replyContent").val("");
						
					}else{
						alert("댓글작성에 실패했습니다.");	
					}
				},
				beforeSend : function(){
					if(document.getElementById("replyContent").value.trim().length == 0){ 
						alert("댓글을 입력해주세요!");
						return false;
					}
				},
					error : function(){
					console.log("댓글작성실패")
				}
			})
			}
			
		
		 /* 댓글 조회 */
		function selectReplyList(){
			let replycount = 0;
			$.ajax({
				url : "<%=request.getContextPath()%>/select.re",
				data : { bNo : "<%=b.getBoardNo() %>"},
				success : function(list){
					let numberArray = 1;
					let result  = "";
					for(let i of list[0]){ 
						if(i.isAnonimous == "N"){
						result += 
							
						`
						<li>
						\${i.replyNo}
						 <div class='content-detail-comments'>
						 <div class='comments-left'>
						 <img src="<%= request.getContextPath() %>\${i.userProfile}" width="30" height="30">
						\${i.writer}
						 </div>
						 <div class='comments-right'>
	                     대댓글
	                     <button id="reportbtn\${i.replyNo}" onclick="reportclick(this.id)">신고</button>
	                     <button id="recommendbtn\${i.replyNo}" onclick="recommendclick(this.id)">공감</button>
	                     <button id="deletebtn\${i.replyNo}" onclick="deleteclick(this.id)">삭제</button>
	                     </div>
	                     </div>
	                     \${i.content}
	                     <br>
	                     \${i.enrollDate}
	                     <br>
	                      공감수 : <div id="recommendCount\${i.replyNo}">\${i.recommendCount}</div>
	                     </li>
	                     `
						}else{
					result += 
						
						`
						<li>
						\${i.replyNo}
						 <div class='content-detail-comments'>
						 <div class='comments-left'>
						 <img src="<%= request.getContextPath() %>\${i.userProfile}" width="30" height="30"> 대체이미지
						 익명
						
						 \${list[1][i.writer]}
						 
						  </div> 
						 <div class='comments-right'>
	                     대댓글
	                     <button id="reportbtn\${i.replyNo}" onclick="reportclick(this.id)">신고</button>
	                     <button id="recommendbtn\${i.replyNo}" onclick="recommendclick(this.id)">공감</button>
	                     <button id="deletebtn\${i.replyNo}" onclick="deleteclick(this.id)">삭제</button>
	                     </div>
	                     </div>
	                     \${i.content}
	                     <br>
	                     \${i.enrollDate}
	                     <br>
	                     공감수 : <div id="recommendCount\${i.replyNo}">\${i.recommendCount}</div>
	                     </li>
	                     `
						}
					}
					$("#comments-area").html(result);
				},
				error : function(){
					alert("게시글 목록조회 실패");
				}
			})
		}
		/* 댓글개수 증가 */
		function selectReplyCount(){
			
			$.ajax({
				url : "<%=request.getContextPath()%>/content.re",
				data :{
					bNo : "<%= b.getBoardNo() %>"
				}, 
				success : function(result){
						$("#replydiv").html(result);
					
				}, error : function(){
					alert("댓글개수 조회 실패");
				}
			
			})
		} 
		
	
		</script>
		
		<script>
		 /* 게시글 추천, 삭제  */
		 document.getElementById("recommendbtn").addEventListener("click",function(){
	  	    $.ajax({
					url : "<%= request.getContextPath() %>/recommend.bo",
					data : {bNo : <%= b.getBoardNo() %>},
					success : function(data){
						if(data > 0) {
							alert("공감 성공!");
							$("#recommenddiv").html(data);
						}
						if(data == 0) alert("본인이 작성한 글은 공감이 불가능합니다!");
						if(data < 0) alert("이미 공감된 글입니다!");
						}
				});
  	     })
  	    
  	    
  	    document.getElementById("scrapbtn").addEventListener("click",function(){
	  	    $.ajax({
					url : "<%= request.getContextPath() %>/scrap.bo",
					data : {bNo : <%= b.getBoardNo() %>},
					success : function(data){
						if(data > 0) {
							alert("스크랩 성공!");
							$("#scrapdiv").html(data);
						}
						if(data == 0) alert("본인이 작성한 글은 스크랩이 불가능합니다!");
						if(data < 0) alert("이미 스크랩된 글입니다!");
						}
				});
  	    })
  	    
  	     
  	   /* 댓글 삭제, 추천, 신고  */
  	    function deleteclick(id){
			 location.href = "<%= request.getContextPath() %>/delete.re?bNo="+<%= b.getBoardNo() %>+"&rNo="+id.substr(9);
		 }
		 
		 function recommendclick(id){
			 let rNo = id.substr(12);
			 $.ajax({
					url : "<%= request.getContextPath() %>/recommend.re",
					data : {
						bNo : <%= b.getBoardNo() %>,
						rNo : rNo
						},
					success : function(data){
						if(data > 0) {
							alert("공감 성공!");
							$("#recommendCount"+rNo).html(data);
						}
						if(data == 0) alert("본인이 작성한 댓글은 공감이 불가능합니다!");
						if(data < 0) alert("이미 공감된 글입니다!");
						}
				});
		 }
		 
		 function reportclick(id){
			 let rNo = id.substr(9);
		  	    $.ajax({
						url : "<%= request.getContextPath() %>/report.re",
						data : {bNo : <%= b.getBoardNo() %>,
								rNo : rNo
								},
						success : function(data){
							if(data > 0) alert("신고 성공!");
							if(data == 0) alert("본인이 작성한 댓글은 신고 불가능합니다!");
							if(data < 0) alert("이미 신고된 글입니다!");
							}
					});
	  	     }
	  	    
		 /* 처음 페이지 로드 시 댓글 조회 함수 호출 */
		window.onload = selectReplyList;
	</script>




</body>

</html>