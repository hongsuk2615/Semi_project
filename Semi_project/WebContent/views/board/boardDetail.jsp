
<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList <Board> boardList  = (ArrayList<Board>) request.getAttribute("boardList"); 
	String cName = (String) request.getAttribute("cName");
	int cNo = (int) request.getAttribute("cNo");
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
    <!-- 위로 가기 버튼 -->
    <div class="gototopdiv divhidden"><button class="btnsetting" type="button" style="position:fixed; right: 50px; bottom: 50px;" onclick="window.scrollTo(0, 0);"><img src="<%=request.getContextPath()%>/resources/IMG/up.png" width='30' height='30'></button></div>
    
    <!-- 위로 가기 버튼 -->
        <%@ include file="../common/header.jsp" %>
        <div id="body">
            
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <div id="board-detail">
                            <div id="category" onclick="location.href='<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= cNo %>'"> <%= cName %>게시판</div>
                            
							<div id="createContentbox">글 작성하기</div>
							<div id="createContent" class="divhidden">
                     
                         		<form enctype="multipart/form-data">
    								<div><input type="text" id="title" name="title" placeholder="제목을 입력해주세요!"></div>
      							    <div id="contentdiv"><textarea id="content" name="content" placeholder="내용을 입력해주세요!" maxlength="500"></textarea>
										<div id="QuestionContent" class="divhidden"><div><span>#주의 질문글입니다!</span></div></div>
									</div>
									<div id="file-area"></div>
									<div id="createContent-check">

										

                						<div>첨부파일(최대 5개)<input type="file" id="upfile" name="upfile"></div>

               							<div id="btns">
						                    <div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">
											<label for="isQuestion">질문</label></div>
						                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">
				                    		<label for="isAnonimous">익명</label></div>
						                    <div><button type="button" id="create-content-btn" onclick="createContent()">
						                    <img src="<%=request.getContextPath()%>/resources/IMG/edit.png" alt="" width="22" height="22">
											</button></div>
						                </div>
						            </div>
					           	</form>
                            <script>
                            //
        let fileArr = new Array();
        const files = $('#upfile')[0].files;
        const dataTransfer = new DataTransfer();
        let fileArray = Array.from(files);
        let count = 0;
        
        function hiddenImg(e){
        	$(e).css('display', 'none');
        	fileArray.splice(e.id.substr(6), 1);
        }
        
		function createContent(){
			let formData = new FormData();
			
			if(fileArray.length < 6){
				fileArray.forEach(file => { dataTransfer.items.add(file); });
				$('#upfile')[0].files = dataTransfer.files;
				
				formData.append("cNo", <%= request.getAttribute("cNo")%>);
				formData.append("title", $("#title").val());
				formData.append("content",$("#content").val().replace(/(\n|\r\n)/g, '<br>'));
				formData.append("isQuestion", $("#isQuestion").prop('checked') ? 'Y' : 'N');
				formData.append("isAnonimous", $("#isAnonimous").prop('checked') ? 'Y' : 'N');
					
			$.each( $('#upfile')[0].files , function(index , file){
				formData.append("upfile"+index , file);
			});
			
			
			$.ajax({
				url : "<%= request.getContextPath() %>/insert.bo",
				data : formData,
				type : "post",
				processData : false,
				contentType : false,
				success : function(data){
					if(data > 0) {
						alert("작성성공");
						selectBoardList();
						$("#title").val("");
						$("#content").val("");
						$("#upfile").val("");
						$("#isQuestion").val("");
						$("#isAnonimous").val("");
						}
						location.href='<%= request.getContextPath() %>/boardDetail.bo?cNo=<%=cNo%>';
						
					if(data == 0) alert("작성실패");
					if(data < 0) alert("전송방식 잘못됨");
					},
					beforeSend : function(){
						if($("#title").val() == ''){
							alert("제목을 입력해주세요!");
							$("#title").focus();
							return false;
						}else if($("#content").val() == ''){
							alert("내용을 입력해주세요!");
							$("#content").focus();
							return false;
						}
					}
			});
			 }else{ 
				alert("첨부파일 개수 초과");
				$("#upfile").val("");
			 } 
			
		}
	
	
	$("#upfile").change(function(e){
		
	    fileArray.push(e.target.files[0]);
	    
		let reader = new FileReader();
		reader.readAsDataURL(e.target.files[0]);
		
		reader.onload = function(e){
		let url = e.target.result;
		$("#file-area").append("<img class='newImg' id='newImg"+ count +"' onclick='hiddenImg(this);' width='100' height='100'>");
		$('#newImg'+count).attr("src",url);
		count++;
		}
		$("#upfile").val("");
	});

                            //

		function selectBoardList(){
			let replycount = 0;
			$.ajax({
				url : "<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= cNo %>",
				success : function(list){
					$("body").html(list);
				},
				error : function(){
					console.log("게시글 목록조회 실패")
				}
			})
		}
	</script>
                            </div>
                           <% if(boardList.isEmpty()) { %>
                           	글이 없습니다,,
                           <% } %>
                            <ul id="content-area"></ul>
						<script>
						
						let boardCount = 0;
						function loadBoard(){
							boardCount = boardCount + 1;
							$.ajax({
								url : "<%=request.getContextPath()%>/boardDetail.bo",
								type : "post",
								data :{
									cNo : <%=cNo %>,
									currentPage : boardCount
								}, 
								success : function(list){
									let result  = "";
									for(let i of list){ 
										i.writer = i.isAnonimous == ("Y") ? "익명" : i.writer;
										result += 
										`
										<li>
										<div class="\${i.boardNo}"style="display:none">\${i.boardNo}</div>
		                                <h3>\${i.title}</h3>
		                                    <p>\${i.content}</p><br>
											<div class="board-detail-footer">
											<div>\${i.writer} \${dayStringMaker(i.stringDate)} </div>
		                                    <div class="board-detail-comment">
												<div class="board-detail-commend"> <img class="recommendImg" src="<%=request.getContextPath()%>/resources/IMG/like.png" alt="" width="17" height="17">
													<span>\${i.recommendCount}</span></div>
													
													<div class="board-detail-commend"> <img src="<%=request.getContextPath()%>/resources/IMG/replyimg.png" alt="" width="17" height="17">
													<span>\${i.replyCount}</span></div>
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
						
						function selectContent(){
							$("#board-detail li").click(function(){
								let bNo = $(this).children().eq(0).text();
								location.href = '<%= request.getContextPath() %>/contentDetail.bo?bNo='+bNo;
								
							});
						}
						

					     window.onscroll = function(e) {
					         if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
					           setTimeout(loadBoard, 500); 
					         }
					       }
								     
								    
								</script>
                            
                            
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
	// 수정 중 다른 페이지로 나갈 때 alert
	document.querySelector('#title').addEventListener('keyup', function(){
		if($("#title").val() != '' || $("#content").val() != '' ){
			$(window).on("beforeunload", callback);
		}else{
			off();
		}
		
	});
	
	document.querySelector('#content').addEventListener('keyup', function(){
		if($("#title").val() != '' || $("#content").val() != '' ){
			$(window).on("beforeunload", callback);
		}else{
			off();
		}
	});
	
	function callback(){
	    return "changes will be lost!";
	}
		function off(){
		    $(window).off("beforeunload");
		}
		document.querySelector('#create-content-btn').addEventListener('click',off);
		  
	 /* 처음 페이지 로드 시 게시글 조회 함수 호출 */
	window.onload = loadBoard;
	 
	
	 window.addEventListener("scroll",function(){
	 if(window.scrollY > 800){
		 $(".gototopdiv").fadeIn();
	 }else{
		 $(".gototopdiv").fadeOut();
	 }
	 })

	 document.getElementById("isQuestion").addEventListener('click',function(){
		 if($("#QuestionContent").hasClass('divhidden')){
			 $("#QuestionContent").removeClass('divhidden');
			 alert("질문 글을 작성하면 댓글이 달린 이후에는 글을 수정 및 삭제할 수 없습니다.");
		 }else{
			 $("#QuestionContent").addClass('divhidden');
		 }
		
	 })
	 
	  document.getElementById("createContentbox").addEventListener('click',function(){
			 $("#createContent").removeClass('divhidden');
			 $("#createContentbox").addClass('divhidden');
	 })
   </script>
   <script>
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
	   
   
   </script>
   





</body>

</html>