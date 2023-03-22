<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="resources/CSS/header.css">
        <link rel="stylesheet" href="resources/CSS/body.css">
        <link rel="stylesheet" href="resources/CSS/management_body.css">
        <link rel="stylesheet" href="resources/CSS/footer.css">
        <link rel="stylesheet" href="resources/CSS/management_modal.css">

        <title>Document</title>
    </head>
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

    <body>
        <div id="wrapper">
            <%@ include file="management_header.jsp" %>

                <div id="body">
                    <div id="board-wrapper">
                        <table id="board-1">
                            <thead>
                                <tr>
                                    <th colspan="3">회원가입 승인요청</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>유저아이디1</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디2</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디3</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디4</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디5</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디1</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디2</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디3</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디4</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                                <tr>
                                    <td>유저아이디5</td>
                                    <td>유저이름</td>
                                    <td> 학생/강사 구분</td>
                                </tr>
                            </tbody>

                        </table>
                        <table id="board-2">
                            <thead>
                                <tr>
                                    <th colspan="5">게시물 신고 내역</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>게시물 제목1</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목2</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목3</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목4</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목5</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목1</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목2</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목3</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목4</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>게시물 제목5</td>
                                    <td>신고횟수</td>
                                    <td>0</td>
                                    <td>추천횟수</td>
                                    <td>0</td>
                                </tr>
                            </tbody>
                        </table>
                        <table id="board-3">
                            <thead>
                                <tr>
                                    <th colspan="3">게시판 생성 요청 내역</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>요청 게시판제목1</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목2</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목3</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목4</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목5</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목1</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목2</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목3</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목4</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                                <tr>
                                    <td>요청 게시판제목5</td>
                                    <td>요청유저 아이디</td>
                                    <td>강사/학생여부</td>
                                </tr>
                            </tbody>
                        </table>
                        <table id="board-4">
                            <thead>
                                <tr>
                                    <th colspan="5">신고유저관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>유저아이디1</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디2</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디3</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디4</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디5</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디1</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디2</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디3</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디4</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>유저아이디5</td>
                                    <td>신고 횟수</td>
                                    <td>100</td>
                                    <td>추천수</td>
                                    <td>20</td>
                                </tr>
                            </tbody>
                        </table>
                        <table id="board-5">
                            <thead>
                                <tr>
                                    <th>건의사항 게시판</th>
                                </tr>
                            </thead>
                            <tbody>
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
                            </tbody>
                        </table>
                        <table id="board-6">
                            <thead>
                                <tr>
                                    <th>공지사항 게시판</th>
                                </tr>
                            </thead>
                            <tbody>
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
                            </tbody>
                        </table>

                    </div>
                </div>

                <div id="footer"></div>

        </div>
        <div id="management-modal">
            <div id="modal-content">
                <div id="modal-body">
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">내용주제1</div>
                        <div class="modal-body-right">내용</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">내용주제1</div>
                        <div class="modal-body-right">내용</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">내용주제1</div>
                        <div class="modal-body-right">내용</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">내용주제1</div>
                        <div class="modal-body-right">내용</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">내용주제1</div>
                        <div class="modal-body-right">내용</div>
                    </div>

                </div>


                <div id="modal-footer">


                    <button id="exit-btn">돌아가기</button>
                    <button id="ban-deny-btn">정지</button>
                    <button id="unban-approve-btn">정지해제</button>

                </div>
            </div>

        </div>
        <script>
            document.querySelector("#board-1 th").addEventListener("click", function () {
                location.href = "";
            });
            document.querySelector("#board-2 th").addEventListener("click", function () {
                location.href = "";
            });
            document.querySelector("#board-3 th").addEventListener("click", function () {
                location.href = "";
            });
            document.querySelector("#board-4 th").addEventListener("click", function () {
                location.href = "";
            });
            document.querySelector("#board-5 th").addEventListener("click", function () {
                location.href = "";
            });
            document.querySelector("#board-6 th").addEventListener("click", function () {
                location.href = "";
            });
            $("#board-1 tbody>tr").each(function (index, item) {
                item.onclick = function () {
                    document.getElementById("management-modal").style.visibility = "visible";
                    document.getElementById("modal-body").innerHTML = 
                    `<div class="modal-body-wrapper">
                        <div class="modal-body-left">아이디</div>
                        <div class="modal-body-right">hong</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">이름</div>
                        <div class="modal-body-right">홍길동</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">분반</div>
                        <div class="modal-body-right">UI/UX</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">학생/강사 구분</div>
                        <div class="modal-body-right">학생</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">White List 여부</div>
                        <div class="modal-body-right">N</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">받은 추천 횟수</div>
                        <div class="modal-body-right">100</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">신고 받은 횟수</div>
                        <div class="modal-body-right">5</div>
                    </div>`;
                    document.getElementById("ban-deny-btn").innerHTML = "승인";
                    document.getElementById("unban-approve-btn").innerHTML = "거부";
                }
            });


            $("#board-2 tbody>tr").each(function (index, item) {
                item.onclick = function () {
                    location.href="";
                }
            });

            $("#board-3 tbody>tr").each(function (index, item) {
                item.onclick = function () {
                    document.getElementById("management-modal").style.visibility = "visible";
                    document.getElementById("modal-body").innerHTML = 
                    `<div class="modal-body-wrapper">
                        <div class="modal-body-left">요청한 아이디</div>
                        <div class="modal-body-right">hong</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">이름</div>
                        <div class="modal-body-right">홍길동</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">분반</div>
                        <div class="modal-body-right">UI/UX</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">학생/강사 구분</div>
                        <div class="modal-body-right">학생</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">생성하고 싶은 게시판 이름</div>
                        <div class="modal-body-right">음악추천게시판</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">사유</div>
                        <div class="modal-body-right">이라너ㅣ아러ㅣ나ㅓ이라ㅓ니아러ㅣ너ㅏㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ아ㅣ</div>
                    </div>`;
                    document.getElementById("ban-deny-btn").innerHTML = "승인";
                    document.getElementById("unban-approve-btn").innerHTML = "거부";
                }
            });

            $("#board-4 tbody>tr").each(function (index, item) {
                item.onclick = function () {
                    document.getElementById("management-modal").style.visibility = "visible";
                    document.getElementById("modal-body").innerHTML = 
                    `<div class="modal-body-wrapper">
                        <div class="modal-body-left">아이디</div>
                        <div class="modal-body-right">hong</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">이름</div>
                        <div class="modal-body-right">홍길동</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">분반</div>
                        <div class="modal-body-right">UI/UX</div>
                    </div>
                    <div class="modal-body-wrapper">
                        <div class="modal-body-left">학생/강사 구분</div>
                        <div class="modal-body-right">학생</div>
                    </div>`;
                    document.getElementById("ban-deny-btn").innerHTML = "정지";
                    document.getElementById("unban-approve-btn").innerHTML = "정지해제";
                }
            });

            $("#board-5 tbody>tr").each(function (index, item) {
                item.onclick = function () {
                    location.href="";
                }
            });

            $("#board-6 tbody>tr").each(function (index, item) {
                item.onclick = function () {
                    location.href="";
                }
            });



            document.getElementById("exit-btn").addEventListener("click", function () {
                document.getElementById("management-modal").style.visibility = "hidden";
            });
            document.getElementById("ban-deny-btn").addEventListener("click", function () {
                location.href = ""
            });
            document.getElementById("unban-approve-btn").addEventListener("click", function () {
                location.href = ""
            });
        </script>
    </body>

    </html>