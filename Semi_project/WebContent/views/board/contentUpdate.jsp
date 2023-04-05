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
                                <form enctype="multipart/form-data">
                                <div> 프로필: <img src="<%= request.getContextPath() %><%= b.getUserProfile() %>" width="30" height="30"></div>
    								<div>
                                              <% if(b.getIsAnonimous().equals("N")) { %>
                                                <%= b.getWriter() %>
                                                <% }else { %>
                                                익명
                                                <% } %> 
                                            </div>
    								<div>등록일: <%= b.getEnrollDate() %></div>
    								<div><input type="text" id="title" name="title" placeholder="글 제목"> <%= b.getTitle() %></div>
      							    <div><textarea id="content" name="content" placeholder="기본 설명 내용"><%= b.getContent() %></textarea></div>
           							<div id="createContent-check">
                						<div>첨부파일<input type="file" id="upfile" name="upfile" multiple>
                						<div>
                                        <% for(BoardAttachment at : attachmentList){ %>
												<img src="<%= request.getContextPath() %><%= at.getFilePath()+at.getChangeName() %>" width="200" height="150">
										<% } %></div></div>
               							<div>
						                    <div><input type="checkbox" id="isQuestion" name="isQuestion" value="Y">질문</div>
						                    <div><input type="checkbox" id="isAnonimous" name="isAnonimous" value="Y">익명</div>
						                    <div><button type="button" id="create-content-btn" onclick="createContent()">수정하기</button></div>
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
	
</body>

</html>