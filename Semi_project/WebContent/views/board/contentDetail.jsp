<%@ page import="com.khtime.board.model.vo.Board, java.util.ArrayList, com.khtime.board.model.vo.Reply, com.khtime.board.model.vo.BoardAttachment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Board b =(Board) request.getAttribute("b"); 
	ArrayList <BoardAttachment> attachmentList  = (ArrayList<BoardAttachment>) request.getAttribute("attachmentList");
	ArrayList<Reply> replyList = (ArrayList<Reply>) request.getAttribute("replyList"); 
	String cName = (String) request.getAttribute("cName");
	int recommendcheck = (int) request.getAttribute("recommendcheck");
	int scrapcheck  = (int) request.getAttribute("scrapcheck"); 
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
                            <div id="category" onclick="location.href='<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= b.getCategoryNo() %>'"> <%= cName %>게시판</div>
                            <div id="content-detail-content"> 
                                <div id="content-header">
                                    <div id="content-header-left">
                                       
                                              <% if(b.getIsAnonimous().equals("N")) { %>
                                              <div id="content-profile">
                                            <img src="<%= request.getContextPath() %><%= b.getUserProfile() %>" width="30" height="30">
                                        </div>
                                        <div id="content-writer">
                                            <div>
                                               <span class="spanWriter"> <%= b.getWriter() %></span>
                                                <% }else { %>
                                                <div id="content-profile">
                                            <img src="<%=request.getContextPath()%>/resources/IMG/user.png" width="30" height="30">
                                        </div>
                                        <div id="content-writer">
                                            <div>
                                              <span class="spanWriter">  익명</span>
                                                <% } %> 
                                            </div>
                                            <div class="stringDate"> <span class="spanDate"></span> </div>
                                        </div>
                                        </div>
                                    <div id="content-header-right"> <!-- 관리자일 경우 삭제가능하게 만들기 -->
                                        <%if( loginUser != null &&loginUser.getAuthority() == 0 ||
                                        		loginUser != null && loginUser.getNickName().equals(b.getWriter())){ %>
                                        	<button id="updateBoard" class="btnsetting"><span>수정</span></button>
                                        	<button id="deleteBoard" class="btnsetting"><span>삭제</span></button>
                                        	<script>
                                        	 document.getElementById("deleteBoard").addEventListener("click",function(){
                                        		 if(confirm("정말 삭제하시겠습니까?")){ 
                                     	        	location.href = "<%=request.getContextPath() %>/delete.bo?bNo=<%=b.getBoardNo()%>&cNo=<%=b.getCategoryNo()%>&aC=<%=attachmentList.size()%>&isQ=<%=b.getIsQuestion()%>";
                                        		 }
                                     	    })
                                        			
                                     	    document.getElementById("updateBoard").addEventListener("click",function(){
                                     	    	if($('.replycheck').length != 0 && "<%=b.getIsQuestion()%>" == "Y"){
                                     	    		alert("질문글은 댓글이 있을 경우 수정 및 삭제가 불가능합니다!")
                                     	    	}else{
                                     	    		location.href = "<%= request.getContextPath() %>/update.bo?bNo=<%=b.getBoardNo()%>&cNo=<%=b.getCategoryNo()%>";
                                     	    	}
                                     	    })
                                        	</script>
                                        <% }else{ %>
                                        	<button id="msgBoard" class="btnsetting"><span>쪽지</span></button>
                                        	<button id="reportBoard" class="btnsetting"><span>신고</span></button>
                                        	
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
                                   <h3><%= b.getTitle() %></h3> 
                                </div>
                                <div id="contentdiv">
                                  <p> <%= b.getContent() %></p>
                                </div>
                                <div id="file-area">
                                        <% for(BoardAttachment at : attachmentList){ %>
												<img src="<%= request.getContextPath() %><%= at.getFilePath()+at.getChangeName() %>" width="100%" height="100%">
										<% } %></div>
                                <div class="boardDataDiv">
                                <% if(recommendcheck == 1) { %>
                                    <div class="board-detail-commend"><img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like2.png">
                                    <span id="recommendbox" style="color: red;"><%= b.getRecommendCount() %></span></div>
                                    <% }else{ %>
                                     <div class="board-detail-commend"><img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like1.png">
                                    <span id="recommendbox" style="color: red;"><%= b.getRecommendCount() %></span></div>
									<% } %>
									 <% if(scrapcheck == 1) { %>                                
                                    <div class="board-detail-commend"><img class="scrapImg" src="<%=request.getContextPath()%>/resources/IMG/star1.png">
                                    <span id="scrapbox" style="color: #ffcc1c;"><%= b.getScrapCount() %></span></div>
                                    <% }else{ %>
                                      <div class="board-detail-commend"><img class="scrapImg" src="<%=request.getContextPath()%>/resources/IMG/star.png">
                                    <span id="scrapbox" style="color: #ffcc1c;"><%= b.getScrapCount() %></span></div>
                                    <% } %>
                                    <div class="board-detail-commend"><img class="replyImg" src="<%=request.getContextPath()%>/resources/IMG/message.png" style="padding-top: 3px;">
                                    <span id="replybox" style="color: #666666;"><%= b.getReplyCount() %></span></div>
                                </div>
                                <div class="boardDataDiv" id="boardDataBtn">
                                   <button id="recommendbtn"><span>공감</span></button>
                                    <button id="scrapbtn"><span >스크랩</span></button>
                                 <% if(b.getIsQuestion().equals("Y")){ %>
								<div id="QuestionContentbox"><div><span>#주의 질문글입니다!</span></div></div>
								<% } %>
                                
                                </div>
                            </div>

                            <!-- 댓글 -->
                            
                         <ul id="comments-area">
                        <img src="<%=request.getContextPath()%>/resources/IMG/edit.png" alt="" width="200" height="200">
                        </ul>
                         
                    <!-- 댓글달기 -->
                    <div id="createComments">
                        <div>
                           <textarea id="replyContent" cols="75" rows="4" style="resize:none;" placeholder="댓글을 입력해주세요!" maxlength="200"></textarea>
                        </div>
                        <div id="comments-right-btn">
                            <div>
                                <input id="isAnonimous" name="isAnonimous" type="checkbox" value="Y"><label for="isAnonimous">익명</label>
                            </div>
                            <div>
                                <button class="btnsetting" onclick="insertReply()">
                                <img src="<%=request.getContextPath()%>/resources/IMG/edit.png" alt="" width="20" height="20"></button>
                            </div>
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

		/* 댓글 입력 */
		 function insertReply(){
			$.ajax({
				url : "<%=request.getContextPath()%>/insert.re",
				data :{
					bNo : "<%= b.getBoardNo() %>",
					content : $("#replyContent").val(),
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
		 $("#replyContent").keyup(function () {
             if (window.event.keyCode == 13) {
            	 insertReply();
             }
         });
		
		
		 /* 댓글 조회 */
		function selectReplyList(){
			
			$.ajax({
				url : "<%=request.getContextPath()%>/select.re",
				data : { bNo : "<%=b.getBoardNo() %>"},
				success : function(list){
					
					let result  = "";
					for(let i of list[0]){ 
						if(i.isAnonimous == "N"){
						result += 
							
						`
						<li>
						 <div class='content-detail-comments replycheck'>
							 <div class='comments-left'>
								 <img src="<%= request.getContextPath() %>\${i.userProfile}" width="30" height="30">
								 <span class="spanWriter">\${i.nickName}</span>
							 </div>
								 <div class='comments-right'>`
								 if(i.writer == <%=loginUser.getUserNo()%>){
									result += ` <button id="deletebtn\${i.replyNo}" class="btnsetting" onclick="deleteclick(this.id)"><span>삭제</span></button> `
								 }else{
								 result += `   
				                     <button id="recommendbtn\${i.replyNo}" class="btnsetting" onclick="recommendclick(this.id)"><span>공감</span></button>
				                     <button id="reportbtn\${i.replyNo}" class="btnsetting" onclick="reportclick(this.id)"><span>신고</span></button>`
				                    }
				                    result += `</div>
	                     </div>
	                     <p>\${i.content}<p>
	                     <div id="recommendCount\${i.replyNo}" class="replyrecommend">
	                     <span class="spanDate">\${dayStringMaker(i.stringDate)}</span>
	                     `
	                     if(i.recommendCount != 0){
	                    	 if(list[2].includes(i.replyNo)){
	                    	 result += `
	                    		 <img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like2.png">
	    	                     <span class="replyRecommendCount">\${i.recommendCount}</span> `
	                    	 }else{
	                    		 result += `
		                    		 <img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like1.png">
		    	                     <span class="replyRecommendCount">\${i.recommendCount}</span> `
	                    		 
	                    	 }
	                     }
   	                     result += ` </div> </li> `
						}else{
					result += 
						`
						<li>
						 <div class='content-detail-comments replycheck'>
						 <div class='comments-left'>
						 <img src="<%=request.getContextPath()%>/resources/IMG/user.png" width="30" height="30">
						 <span class="spanWriter">익명 \${list[1][i.nickName]}</span>
						  </div> 
						  <div class='comments-right'>`
						  if(i.writer == <%=loginUser.getUserNo()%>){
								result += ` <button id="deletebtn\${i.replyNo}" class="btnsetting" onclick="deleteclick(this.id)"><span>삭제</span></button> `
							 }else{
							 result += `   
			                     <button id="recommendbtn\${i.replyNo}" class="btnsetting" onclick="recommendclick(this.id)"><span>공감</span></button> 
			                     <button id="reportbtn\${i.replyNo}" class="btnsetting" onclick="reportclick(this.id)"><span>신고</span></button>`
			                    }
			                    result += `</div>
                  </div>
	                     <p> \${i.content}</p>
	                     <div id="recommendCount\${i.replyNo}" class="replyrecommend">
	                     <span class="spanDate">\${dayStringMaker(i.stringDate)}</span>
	                     ` 
	                     if(i.recommendCount != 0){
	                    	 if(list[2].includes(i.replyNo)){
		                    	 result += `
		                    		 <img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like2.png">
		    	                     <span class="replyRecommendCount">\${i.recommendCount}</span> `
		                    	 }else{
	                    		 result += `
		                    		 <img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like1.png">
		    	                     <span class="replyRecommendCount">\${i.recommendCount}</span> `
		                    		 
		                    	 }
	                     }
                   		 result += ` </div> </li> `
					}
					$("#comments-area").html(result);
					}
					if(result == ""){
						$("#comments-area").html("");
					}
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
						$("#replybox").html(result);
					
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
							$("#recommendbox").html(data);
							$('.board-detail-commend .recommendImg').attr('src','<%=request.getContextPath()%>/resources/IMG/like2.png');
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
							$("#scrapbox").html(data);
							$('.scrapImg').attr('src','<%=request.getContextPath()%>/resources/IMG/star1.png');
							alert("스크랩 성공!");
						}
						if(data == 0) alert("본인이 작성한 글은 스크랩이 불가능합니다!");
						if(data < 0){
							if(confirm("스크랩을 취소하시겠습니까?")){
								deleteScrap();
							}
						}
						}
				});
  	    })
  	    
  	    function deleteScrap(){
			 $.ajax({
					url : "<%= request.getContextPath() %>/deletescrap.bo",
					data : {
						bNo : <%= b.getBoardNo() %>
						},
					success : function(data){
						if(data >= 0) {
							alert("스크랩 취소 성공!");
						$("#scrapbox").html(data);
						$('.scrapImg').attr('src','<%=request.getContextPath()%>/resources/IMG/star.png');
							}
						}
				});
		 }
  	    
  	     
  	   /* 댓글 삭제, 추천, 신고  */
  	    function deleteclick(id){
			 let rNo = id.substr(9);
			 $.ajax({
					url : "<%= request.getContextPath() %>/delete.re",
					data : {
						bNo : <%= b.getBoardNo() %>,
						rNo : rNo
						},
					success : function(data){
						if(data > 0) {
							alert("삭제 성공!");
							selectReplyList();
							selectReplyCount();
						}else{
							alert("삭제 실패!");
						}
					},
					beforeSend : function(){
						if(!confirm("정말 삭제하시겠습니까?")){
							return false;
						}
					}
				});
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
							selectReplyList();
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
							},
						beforeSend : function(){
							if(!confirm("정말 신고하시겠습니까?")){
								return false;
							}
						}
								
					});
	  	     }
	  	    
		 /* 처음 페이지 로드 시 댓글 조회 함수 호출 */
		$(function(){
			selectReplyList();});
		
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
	 	
	   let enrollDate = dayStringMaker("<%=b.getStringDate()%>");
	   $(".spanDate").append(enrollDate);
	</script>




</body>

</html>