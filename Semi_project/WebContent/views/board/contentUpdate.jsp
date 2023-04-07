<%@ page import="com.khtime.board.model.vo.Board, java.util.ArrayList, com.khtime.board.model.vo.Reply, com.khtime.board.model.vo.BoardAttachment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Board b =(Board) request.getAttribute("b"); 
	ArrayList <BoardAttachment> attachmentList  = (ArrayList<BoardAttachment>) request.getAttribute("attachmentList");
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
                                <form> 
                                <div> 프로필: <img src="<%= request.getContextPath() %><%= b.getUserProfile() %>" width="30" height="30"></div>
    								<div>
                                              <% if(b.getIsAnonimous().equals("N")) { %>
                                                <%= b.getWriter() %>
                                                <% }else { %>
                                                익명
                                                <% } %> 
                                            </div>
    								<div>등록일: <%= b.getEnrollDate() %></div>
    								<div><input type="text" id="title" name="title" placeholder="글 제목" value="<%=b.getTitle()%>"></div>
      							    <div><textarea id="content" name="content" placeholder="기본 설명 내용"><%= b.getContent() %></textarea></div>
           							<div id="createContent-check">
                						<div>첨부파일<input type="file" id="upfile" name="upfile">
                						<div id="attachment-area">
                                        <% for(BoardAttachment at : attachmentList){ %>
												<img id="updateImg<%=at.getFileNo()%>" onclick="hiddenImg(this);" src="<%= request.getContextPath() %><%= at.getFilePath()+at.getChangeName() %>" width="100" height="100">
										<% } %>
										</div>
										</div>
               							<div>
               							<% if(b.getIsQuestion().equals("Y")){ %>
               							<div><input type="checkbox" checked="checked" id="isQuestion" name="isQuestion" value="Y">질문</div>
               							<% }else{ %>
               							<div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">질문</div>
               							<% } %>
               							<% if(b.getIsAnonimous().equals("Y")){ %>
						                    <div><input type="checkbox" id="isAnonimous" checked="checked" name="isAnonimous" value="Y">익명</div>
				                    	<% }else{ %>
						                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">익명</div>
						                    <% } %>
						                    <div><button type="button" id="update-content-btn" onclick="updateContent()">수정하기</button></div>
						                </div>
						            </div>
					           	</form>
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
    </div>
         <script>
         
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
				formData.append("content",$("#content").val().replace(/(\n|\r\n)/g, '<br>'));
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
						alert("수정성공");
						location.href='<%= request.getContextPath() %>/contentDetail.bo?bNo=<%=b.getBoardNo()%>';
						}
					if(data == 0) alert("수정실패");
					if(data < 0) alert("전송방식 잘못됨");
					}
			});
			}else{
				alert("첨부파일 개수 초과");
				$("#upfile").val("");
			}
			
		}
	
	
	$("#upfile").change(function(e){
		
	    fileArray.unshift(e.target.files[0]);
		let reader = new FileReader();
		reader.readAsDataURL(e.target.files[0]);
		
		reader.onload = function(e){
		let url = e.target.result;
		$("#attachment-area").append("<img class='newImg' id='newImg"+ count +"' onclick='hiddenImg(this);' width='100' height='100'>");
		$('#newImg'+count).attr("src",url);
		count++;
		}
		$("#upfile").val("");
	});
	
     
	$(window).on("beforeunload", callback);
	 
	function callback(){
	    console.log("beforeunload callback !");
	    alert("callback함수 실행")
	    return "changes will be lost!";
	}
	 
	function off(){
	    console.log("beforeunload turn off !");
	    $(window).off("beforeunload");
	}
	
	document.querySelector('#update-content-btn').addEventListner('click', () => off());
	  

	</script>
</body>

</html>