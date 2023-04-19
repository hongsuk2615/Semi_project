<%@ page import="com.khtime.board.model.vo.Board, java.util.ArrayList, com.khtime.board.model.vo.Reply, com.khtime.board.model.vo.BoardAttachment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Board b =(Board) request.getAttribute("b"); 
	ArrayList <BoardAttachment> attachmentList  = (ArrayList<BoardAttachment>) request.getAttribute("attachmentList");
	String cName = (String) request.getAttribute("cName");
	String isQuestion = b.getIsQuestion().equals("Y") ? "checked" : "" ;
	String isAnonimous = b.getIsAnonimous().equals("Y") ? "checked" : "" ;
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
        <link rel="stylesheet" href="resources/CSS/khalertmodal.css">
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


 <%@ include file="../common/header.jsp" %>
        <div id="body">
            
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <div id="board-detail">
                             <div id="category" onclick="location.href='<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= b.getCategoryNo() %>'"> <%= cName %>게시판</div>
                            <div id="createContent">
                         		<form enctype="multipart/form-data">
    								<div><input type="text" id="title" name="title" placeholder="제목을 입력해주세요!" value="<%=b.getTitle()%>"></div>
      							    <div id="contentdiv">
      							    <%@include file="textEditor.jsp" %><div id="content" contenteditable="true"><%= b.getContent() %></div>
										<div id="QuestionContent" class="divhidden" ><div><span>#주의 질문글입니다!</span></div></div>
									</div>
									<div id="file-area">
									<% for(BoardAttachment at : attachmentList){ %>
										<img id="updateImg<%=at.getFileNo()%>" onclick="hiddenImg(this);" src="<%= request.getContextPath() %><%= at.getFilePath()+at.getChangeName() %>" width='100' height='100'>
									<% } %>
									</div>
									<div id="createContent-check">
                						<div>첨부파일(최대 5개)<input type="file" id="upfile" name="upfile"></div>

               							<div id="btns">
						                    <div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y" <%= isQuestion %>>
											<label for="isQuestion">질문</label></div>
						                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y" <%= isAnonimous %>>
				                    		<label for="isAnonimous">익명</label></div>
						                    <div><button type="button" id="update-content-btn" onclick="updateContent()">
						                    <img src="<%=request.getContextPath()%>/resources/IMG/edit.png" alt="" width="22" height="22">
											</button></div>
						                </div>
						            </div>
					           	</form>
                            </div>

                </div>
                    </div>
    
                </div>

                <%@ include file="../common/body_right.jsp" %>
            </div>
        </div>
        

        <div id="footer">



        </div>
    
         <script>
         
         // 글 수정 버튼 이벤트
        let fNo = "";
        let fileArr = new Array();
        const files = $('#upfile')[0].files;
        const dataTransfer = new DataTransfer();
        let fileArray = Array.from(files);
        let count = 0;
        let originLength = 0;
       	$("img[id ^='updateImg']").each(function(){
       		originLength++;
       	})
        function hiddenImg(e){
        	$(e).css('display', 'none');
        	
        	if($(e).hasClass("newImg") === true){
        		fileArray.splice(e.id.substr(6), 1);
        	}else{
        		fNo += e.id.substr(9) + ",";
        		originLength--;
        	}
        }
    
		function updateContent(){
			
			let formData = new FormData();
			
			if(fileArray.length + originLength < 6){
				off();
				fileArray.forEach(file => { dataTransfer.items.add(file); });
				$('#upfile')[0].files = dataTransfer.files;
				
				let deleteImg = fNo.replace(/,\s*$/, "");
				formData.append("bNo", <%=b.getBoardNo()%>);
				formData.append("cNo", <%=b.getCategoryNo()%>);
				formData.append("title", $("#title").val());
				formData.append("content",$("#content").html()+'');
				formData.append("isQuestion", $("#isQuestion").prop('checked') ? 'Y' : 'N');
				formData.append("isAnonimous", $("#isAnonimous").prop('checked') ? 'Y' : 'N');
				formData.append("deleteImg", deleteImg);
					
			$.each( $('#upfile')[0].files , function(index , file){
				formData.append("upfile"+index , file);
			});
			
			
			$.ajax({
				url : "<%= request.getContextPath() %>/update.bo",
				data : formData,
				type : "post",
				processData : false,
				contentType : false,
				success : function(data){
					
					if(data > 0) {
						location.href='<%= request.getContextPath() %>/contentDetail.bo?bNo=<%=b.getBoardNo()%>';
						}
					if(data == 0) khalert("수정실패");
					if(data < 0) khalert("전송방식 잘못됨");
					}
			});
			}else{
				khalert("첨부파일 개수 초과");
				$("#upfile").val("");
			}
			
		}
	
		// 파일 추가
	$("#upfile").change(function(e){
		
	    fileArray.unshift(e.target.files[0]);
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
	
	// 수정 중 다른 페이지로 나갈 때 alert
	$(window).on("beforeunload", callback);
	function callback(){
	    return "changes will be lost!";
	}
	function off(){
	    $(window).off("beforeunload");
	}
	document.querySelector('#update-content-btn').addEventListener('click', () => off());
	  
	//질문글
	document.getElementById("isQuestion").addEventListener('click',function(){
		 if($("#QuestionContent").hasClass('divhidden')){
			 $("#QuestionContent").removeClass('divhidden');
			 khalert("질문 글을 작성하면 댓글이 달린 이후에는 글을 수정 및 삭제할 수 없습니다.");
		 }else{
			 $("#QuestionContent").addClass('divhidden');
		 }
		
	 })
	 
	 if($("#isQuestion").prop('checked') == true){
		 $("#QuestionContent").removeClass('divhidden');
	 }
	</script>
	 <%@ include file="../common/khalertmodal.jsp" %>
	

<script type="text/javascript" src="resources/JS/khalertmodal.js"></script>
</body>

</html>