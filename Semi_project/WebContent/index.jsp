<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/body.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <title>KH_TIME 메인페이지</title>
</head>
<style>
    * {
        border: 1px solid rgba(128, 128, 128, 0.568);
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

<body>
    <div id="wrapper">
        <div id="header">
            <div id="header-content">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
                <div id="navbar">
                    <div>게시판</div>
                    <div>친구목록</div>
                    <div>중고책방</div>
                    <div>To Do List</div>
                    <div>관리</div>
                </div>
                <div id="header-right">
                    <button id="login-btn">로그인</button>
                    <button id="enrollment-btn">회원가입</button>
                </div>
            </div>


        </div>
        
        <div id="body">
            <div id="main-banner">



            </div>
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <table id="board-1">
                            <tr>
                                <th>해당분반게시판</th>
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
                        <table id="board-2">
                            <tr>
                                <th>질문답변게시판</th>
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
                        <table id="board-3">
                            <tr>
                                <th>프로젝트 및 스터디 모집 게시판</th>
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
                        <table id="board-4">
                            <tr>
                                <th>수료생 게시판</th>
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
                        <table id="board-5">
                            <tr>
                                <th>건의사항 게시판</th>
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
                        <table id="board-6">
                            <tr>
                                <th>공지사항 게시판</th>
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
                    <div id="books-wrapper">
                        <div id="book-1">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목1</div>
                                <div>책가격1</div>
                            </div>
                        </div>
                        <div id="book-2">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목2</div>
                                <div>책가격2</div>
                            </div>
                        </div>
                        <div id="book-3">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목3</div>
                                <div>책가격3</div>
                            </div>
                        </div>
                        <div id="book-4">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목4</div>
                                <div>책가격4</div>
                            </div>
                        </div>
                    </div>
    
                </div>






                <div id="body-right">
                    <div id="search">
                            <img src="resources/IMG/searchimg.png" alt="searchimg" width="40" height="40">
                            <input type="search" id="search-input" placeholder="전체 게시글의 글을 검색하세요">         
                    </div>
                    <div id="login">
                        <form action="">
                            <div id="id-wrapper">
                                <img src="resources/IMG/idimg.png" alt="idimg" width="40" height="40">
                                <input type="text" id="login-id" placeholder="아이디를 입력하세요">
                            </div>
                            <div id="pwd-wrapper">
                                <img src="resources/IMG/pwdimg.png" alt="pwdimg" width="40" height="40">
                                <input type="password" id="login-pwd" placeholder="비밀번호를 입력하세요">
                            </div>
                            <div id="btn-wrapper">
                                <input type="submit" value="로그인">
                                <input type="button" value="회원가입">
                            </div>
                        </form>
                    </div>
                    <div id="user-list">
                        <div>
                            <img src="resources/IMG/free-icon-billboard-773665.png" alt="" width="20" height="20">
                            <div id="user-boards">내가 쓴글</div>
                        </div>
                        <div>
                            <img src="resources/IMG/replyimg.png" alt="" width="20" height="20">
                            <div id="user-replys">내가 쓴 댓글</div>
                        </div>
                        <div>
                            <img src="resources/IMG/scrapimg.png" alt="" width="20" height="20">
                            <div id="user-scraps">스크랩한 글</div>
                        </div>
                    </div>
                    <div id="additional-functions">
                        <div>
                            <img src="resources/IMG/free-icon-live-chat-5603000.png" alt="" width="20" height="20">
                            <div id="realtime-chat">실시간 채팅</div>
                        </div>
                        <div>
                            <img src="resources/IMG/free-icon-letter-d-5069823.png" alt="" width="20" height="20">
                            <div id="d-day">d-day알림</div>
                        </div>
                        <div>
                            <img src="resources/IMG/stopwatch.png" alt="" width="20" height="20">
                            <div id="check-study-time">공부량 체크</div>
                        </div>
                    </div>
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
            </div>
        </div>


        <div id="footer">



        </div>
    </div>



</body>

</html>