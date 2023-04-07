
<%@ page import="com.khtime.common.model.vo.PageInfo, java.util.ArrayList, com.khtime.board.model.vo.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList <Board> boardList  = (ArrayList<Board>) request.getAttribute("boardList"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String cName = (String) request.getAttribute("cName");
	int cNo = (int) request.getAttribute("cNo");
	int currentPage = (int)request.getAttribute("currentPage");
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
    <div><button type="button" style="position:fixed; right: 50px; bottom: 50px;" onclick="window.scrollTo(0, 0);">위로가기</button></div>
    
    <!-- 위로 가기 버튼 -->
        <%@ include file="../common/header.jsp" %>
        <div id="body">
            
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <div id="board-detail">
                            <div id="category" onclick="location.href='<%=request.getContextPath()%>/boardDetail.bo?cNo=<%= cNo %>'"> <%= cName %>게시판</div>
                            <div id="createContent">
                     
                         		<form enctype="multipart/form-data">
    								<div><input type="text" id="title" name="title" placeholder="글 제목"></div>
      							    <div><textarea id="content" name="content" placeholder="기본 설명 내용" ></textarea></div>
           							<div id="createContent-check">

    

                						<div>첨부파일<input type="file" id="upfile" name="upfile"></div>

               							<div id="btns">
						                    <div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">질문</div>
						                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">익명</div>
						                    <div><button type="button" id="create-content-btn" onclick="createContent()">글 작성</button></div>
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
		$("#createContent-check").append("<img class='newImg' id='newImg"+ count +"' onclick='hiddenImg(this);' width='100' height='100'>");
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
						
						
						function loadBoard(){
							let count = 1;
							$.ajax({
								url : "<%=request.getContextPath()%>/boardDetail.bo",
								type : "post",
								data :{
									cNo : <%=cNo %>,
									currentPage : count
								}, 
								success : function(list){
									console.log("loadBoard");
									console.log(list);
									count++;
									let result  = "";
									for(let i of list){ 
										result += 
										`
										<li><div class="\${i.boardNo}"style="display:none">\${i.boardNo}</div>
		                                \${i.title}<br>
		                                    \${i.content} <br>
		                                   \${i.enrollDate} &nbsp; \${i.writer}<br>
		                                    <div id="board-detail-comment">
                                        
                                        <div>\${i.recommendCount}</div>
                                        <div>\${i.replyCount}</div>
                                    </div>
                                </li>
					                     `
									}
										$("#content-area").append(result);
									
								}, error : function(){
									alert("게시글 조회 실패");
								}
							
							})
						}
						
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
                        
		<%-- <div align="center" class="paging-area">
			
			<% if( currentPage != 1) { %>
				<button onclick="location.href = '<%=request.getContextPath() %>/boardDetail.bo?cNo=<%=cNo%>&currentPage=<%= currentPage -1 %>'">이전</button>
			<% } %>
			
			<% if(currentPage != pi.getMaxPage()) { %>
				<button onclick="location.href = '<%=request.getContextPath() %>/boardDetail.bo?cNo=<%=cNo%>&currentPage=<%=currentPage + 1 %>' ">다음</button>
			<% } %>
			
		</ div> --%>
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
     window.onscroll = function(e) {
    	 console.log("scroll");
         if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
           setTimeout(loadBoard, 1000) ; 
         }
       }
     //
     
     /*  window.addEventListener("scroll", infiniteScroll);

     let isUpdateList = true;    

     function infiniteScroll(){
         const currentScroll = window.scrollY;
         const windowHeight = window.innerHeight;
         const bodyHeight = document.body.clientHeight;
         const paddingBottom = 200;
          if(currentScroll + windowHeight + paddingBottom >= bodyHeight){ 
       	 if(currentScroll >= 1000){
         
        	 loadBoard();
         
             if(isUpdateList){
                 isUpdateList = false;
                 
                  -- after fetch API --
                 isUpdateList = true; 
             }
         }
     }  */
    </script>



</body>

</html>