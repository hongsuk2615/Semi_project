
<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	   
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
                            <div onclick="location.href='<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= cNo %>'"> <%= cName %>게시판</div>
                            <div id="createContent">
                     
                         		<form enctype="multipart/form-data">
    								<div><input type="text" id="title" name="title" placeholder="글 제목"></div>
      							    <div><textarea id="content" name="content" placeholder="기본 설명 내용"></textarea></div>
           							<div id="createContent-check">
<<<<<<< HEAD
                						<div>첨부파일<input type="file" name="upfile"></div> 
=======
                						<div>첨부파일<input type="file" id="upfile" name="upfile" multiple></div>
>>>>>>> main
               							<div>
						                    <div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">질문</div>
						                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">익명</div>
						                    <div><button type="button" id="create-content-btn" onclick="createContent()">글 작성</button></div>
						                </div>
						            </div>
					           	</form>
                            <script>
		function createContent(){
			
			let formData = new FormData();
			
			if($("#upfile")[0].files.length < 5){
				formData.append("cNo", <%= request.getAttribute("cNo")%>);
				formData.append("title", $("#title").val());
				formData.append("content", $("#content").val().replace(/(\n|\r\n)/g, '<br>'));
				formData.append("isQuestion", $("#isQuestion").val());
				formData.append("isAnonimous", $("#isAnonimous").val());
				
			$.each( $("#upfile")[0].files , function(index , file){
				formData.append("upfile"+index , file);
			});
			
			
			$.ajax({
				url : "<%= request.getContextPath() %>/insert.bo",
				data : formData,
				type : "post",
				processData : false,
				contentType : false,
				success : function(data){
					console.log(data);
					
					if(data > 0) {
						alert("업로드성공");
						selectBoardList();
						$("#title").val("");
						$("#content").val("");
						$("#upfile").val("");
						$("#isQuestion").val("");
						$("#isAnonimous").val("");
						}
					if(data == 0) alert("업로드실패");
					if(data < 0) alert("전송방식 잘못됨");
					$("#upfile").val("");
						
					}
				
			});
			}else{
				alert("첨부파일 개수 초과");
				$("#upfile").val("");
			}
			
		}
		

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
                           <% }else{ %>
                            <ul id="content-area">
                           
                            	<% for(Board b : boardList) { %>
                                <li><div class="boardNo"style="display:none"><%= b.getBoardNo() %></div>
                                <%= b.getTitle() %><br>
                                    <%= b.getContent() %> <br>
                                   <%= b.getEnrollDate() %> &nbsp; <%= b.getWriter() %><br>
                                    <div id="board-detail-comment">
                                        
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
                        
		<div align="center" class="paging-area">
			
			<% if( currentPage != 1) { %>
				<button onclick="location.href = '<%=request.getContextPath() %>/boardDetail.bo?cNo=<%=cNo%>&currentPage=<%= currentPage -1 %>'">이전</button>
			<% } %>
			
			<% if(currentPage != pi.getMaxPage()) { %>
				<button onclick="location.href = '<%=request.getContextPath() %>/boardDetail.bo?cNo=<%=cNo%>&currentPage=<%=currentPage + 1 %>' ">다음</button>
			<% } %>
			
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
    </div>
   

     <script>
    </script>



</body>

</html>