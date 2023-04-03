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
                                <form action="<%=request.getContextPath()%>/update.bo" method="post">
                                <input type="hidden" name="bNo" value="<%= b.getBoardNo() %>">
                                <input type="hidden" name="cNo" value="<%= b.getCategoryNo() %>">
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
												<img id="updateImg<%=at.getFileNo()%>" onclick="deleteImg(this.id)" src="<%= request.getContextPath() %><%= at.getFilePath()+at.getChangeName() %>" width="100" height="100">
										<% } %>
										</div>
										</div>
               							<div>
               							<% if(b.getIsQuestion() == "Y") { %>
               							<div><input type="checkbox" checked="checked" id="isQuestion" name="isQuestion" value="Y">질문</div>
               							<% }else{ %>
               							<div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">질문</div>
               							<% } %>
               							<% if(b.getIsAnonimous() == "Y") { %>
						                    <div><input type="checkbox" id="isAnonimous" checked="checked" name="isAnonimous" value="Y">익명</div>
				                    	<% }else{ %>
						                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">익명</div>
						                    <% } %>
						                    <div><button type="submit" id="update-content-btn">수정하기</button></div>
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
	
	
	function deleteImg(id){
		let fNo = id.substr(9);
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : "<%= request.getContextPath() %>/update.at",
				data : {fNo: fNo},
				success : function(result){
					console.log(result);
					
					if(result > 0) {
						alert("첨부파일 삭제 성공");
						selectAttachmentList();
						}
					if(result == 0) alert("첨부파일 삭제 실패");
					if(result < 0) alert("전송방식 잘못됨");
					
						
					}
		});
	}
	}
	
	function selectAttachmentList(){
		$.ajax({
			url : "<%=request.getContextPath()%>/select.at",
			data : { bNo : "<%=b.getBoardNo() %>"},
			success : function(list){
				let result  = "";
				for(let i of list){ 
					result += 
					`
				<img id="updateImg\${i.fileNo}" onclick="deleteImg(this.id)" 
				src="<%= request.getContextPath() %>\${i.filePath}\${i.changeName}"
				width="100" height="100">
				
                     `
				}
				$("#attachment-area").html(result);
			},
			error : function(){
				console.log("게시글 첨부파일 조회 실패")
			}
		})
	}
	
	$("#upfile").change(function(){
		let formData = new FormData();
		formData.append("upfile" , $("#upfile")[0].files[0]);
		formData.append("bNo", <%=b.getBoardNo() %>);
		$.ajax({
			url : "<%= request.getContextPath() %>/insert.at",
			data : formData,
			type : "post",
			processData : false,
			contentType : false,
			success : function(data){
				if(data > 0) {
					alert("첨부파일 추가 성공");
					selectAttachmentList();
					$("#upfile").val("");
					}
				if(data == 0) alert("첨부파일 추가 실패");
				if(data < 0) alert("전송방식 잘못됨");
				}
		});
});
	
	
	

	</script>
</body>

</html>