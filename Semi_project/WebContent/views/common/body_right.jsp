<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/body.css">
    <title>Document</title>
</head>
<body>
    <div id="body-right">
        <div id="search">
                <img src="<%=request.getContextPath()%>/resources/IMG/searchimg.png" alt="searchimg" width="40" height="40">
                <input type="search" id="search-input" placeholder="전체 게시글의 글을 검색하세요">         
        </div>
        <div id="login">
        	<% if(loginUser == null) {%>
            <form action="">
                <div id="id-wrapper">
                    <img src="<%=request.getContextPath()%>/resources/IMG/idimg.png" alt="idimg" width="40" height="40">
                    <input type="text" id="login-id" placeholder="아이디를 입력하세요">
                </div>
                <div id="pwd-wrapper">
                    <img src="<%=request.getContextPath()%>/resources/IMG/pwdimg.png" alt="pwdimg" width="40" height="40">
                    <input type="password" id="login-pwd" placeholder="비밀번호를 입력하세요">
                </div>
                <div id="btn-wrapper">
                    <input type="submit" value="로그인">
                    <input type="button" value="회원가입">
                </div>
            </form>
            <% } else { %>
            <div id="loginuser-profile">
            	<div id="loginuser-profileimg">
                    <img src="/Semi_project/resources/IMG/user.png" alt="로그인유저프사">
                </div>
                <div id="loginuser-nickname">꿀꾸루</div>
                <div id="loginuser-name">홍길동</div>
                <div id="loginuser-id">hong</div>
                <div id="loginuser-btn">
                    <button>로그아웃</button>
                    <button>마이페이지</button>
                </div>
            
            
            </div>
            <% } %>
        </div>
        <% if(loginUser != null) {%>
        <div id="user-list">
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/free-icon-billboard-773665.png" alt="" width="20" height="20">
                <div id="user-boards">내가 쓴글</div>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/replyimg.png" alt="" width="20" height="20">
                <div id="user-replys">내가 쓴 댓글</div>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/scrapimg.png" alt="" width="20" height="20">
                <div id="user-scraps">스크랩한 글</div>
            </div>
        </div>
  
        <div id="additional-functions">
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/free-icon-live-chat-5603000.png" alt="" width="20" height="20">
                <div id="realtime-chat">실시간 채팅</div>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/free-icon-letter-d-5069823.png" alt="" width="20" height="20">
                <div id="d-day">d-day알림</div>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/stopwatch.png" alt="" width="20" height="20">
                <div id="check-study-time">공부량 체크</div>
            </div>
        </div>
        <% } %>
        <div id="hot-board">
            <table id="board-5">
                <tr>
                    <th>HOT 게시판</th>
                </tr>
                <tr>
                    <td>게시물 제목1</td>
                </tr>
                <tr>
                    <td>게시물 제목2</td>
                </tr>
                <tr>
                    <td>게시물 제목3</td>
                </tr>
                <tr>
                    <td>게시물 제목4</td>
                </tr>
                <tr>
                    <td>게시물 제목5</td>
                </tr>
                <tr>
                    <td>게시물 제목6</td>
                </tr>
            </table>
        </div>
        <div id="best-board">
            <table id="board-6">
                <tr>
                    <th>BEST 게시판</th>
                </tr>
                <tr>
                    <td>게시물 제목1</td>
                </tr>
                <tr>
                    <td>게시물 제목2</td>
                </tr>
                <tr>
                    <td>게시물 제목3</td>
                </tr>
                <tr>
                    <td>게시물 제목4</td>
                </tr>
                <tr>
                    <td>게시물 제목5</td>
                </tr>
                <tr>
                    <td>게시물 제목6</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>