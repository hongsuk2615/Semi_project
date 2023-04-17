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
        <link rel="stylesheet" href="resources/CSS/management_detail.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
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
            min-height: 500px;
            background-color: #f1f4f9;
        }
    </style>

    <body>
        <div id="wrapper">
            <%@ include file="management_header.jsp" %>

                <div id="body">
                   

                        <div id="board-wrapper">
                            <div>
                                <div id="filter">
                                    <input type="checkbox" value="Y" id="whitelist" name="filter">
                                    <label for="whitelist">화이트리스트</label>
                                    <input type="checkbox" value="Y" id="banned" name="filter">
                                    <label for="banned">밴 유저</label>
                                    <input type="checkbox" value="Y" id="reported" name="filter">
                                    <label for="reported">신고 당한 유저</label>
                                    <input type="radio" value="1" name="authority" id="student" checked>
                                    <label for="student">학생</label>
                                    <input type="radio" value="2" name="authority" id="teacher">
                                    <label for="teacher">강사</label>
                                </div>
                                <table id="resultBoard">
                                    <thead>
                                        <tr>
                                            <th colspan="10">유저 조회 결과</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>

                                </table>
                                <div id="body-footer">
                                    <input id="search-user" type="search" placeholder="이름으로 검색">
                                    <div id="page-btn">
                                        <div id="back-btn"></div>
                                        <div id="next-btn"></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    
                    <div id="footer"></div>
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
                </div>
                <script> //모달스크립트
                    function modalEvent() {
                        $("#resultBoard tbody>tr").each(function (index, item) { //신고유저 모달
                            item.onclick = function () {
                                if (item.children.length > 1) {
                                    document.getElementById("management-modal").style.visibility = "visible";
                                    let userId = item.children[0].innerHTML;
                                    console.log(userId);
                                    $.ajax({
                                        url: '<%=request.getContextPath()%>/manageUsers.get',
                                        data: { userId },
                                        type: 'post',
                                        success: function (result) {
                                            console.log(result);
                                            document.getElementById("modal-body").innerHTML =
                                                `<div class="modal-body-wrapper">
                                        <div class="modal-body-left">아이디</div>
                                        <div class="modal-body-right">\${result.userId}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">닉네임</div>
                                        <div class="modal-body-right">\${result.nickName}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">이름</div>
                                        <div class="modal-body-right">\${result.userName}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">분반</div>
                                        <div class="modal-body-right">\${result.userClass}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">학생/강사 구분</div>
                                        <div class="modal-body-right">\${result.authority == 1 ? '강사' : '학생'}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">가입일자</div>
                                        <div class="modal-body-right">\${result.enrollDate}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">신고횟수</div>
                                        <div class="modal-body-right">\${result.reportCount}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">추천횟수</div>
                                        <div class="modal-body-right">\${result.recommendCount}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">화이트리스트여부</div>
                                        <div class="modal-body-right">\${result.isWhitelist}</div>
                                    </div>
                                    `;

                                            if (result.isBanned == 'Y') {
                                                document.getElementById("ban-deny-btn").innerHTML = "정지해제";
                                                document.getElementById("ban-deny-btn").addEventListener('click', function () {
                                                    location.href = "<%=request.getContextPath()%>/banUser.do?userId=" + userId + "&isBanned=N&redirect=N";
                                                });
                                            } else {
                                                document.getElementById("ban-deny-btn").innerHTML = "정지";
                                                document.getElementById("ban-deny-btn").addEventListener('click', function () {
                                                    location.href = "<%=request.getContextPath()%>/banUser.do?userId=" + userId + "&isBanned=Y&redirect=N";
                                                });
                                            }
                                            if (result.isWhitelist == 'Y') {
                                                document.getElementById("unban-approve-btn").innerHTML = "화이트리스트 해제";
                                                document.getElementById("unban-approve-btn").addEventListener('click', function () {
                                                    location.href = "<%=request.getContextPath()%>/whiteList.do?userId=" + userId + "&isWhitelist=N&redirect=N";
                                                });
                                            } else {
                                                document.getElementById("unban-approve-btn").innerHTML = "화이트리스트 부여";
                                                document.getElementById("unban-approve-btn").addEventListener('click', function () {
                                                    location.href = "<%=request.getContextPath()%>/whiteList.do?userId=" + userId + "&isWhitelist=Y&redirect=N";
                                                });
                                            }

                                        },
                                        error: function () {
                                            console.log("ajax통신 실패");
                                        }
                                    });

                                }

                            }
                        });
                        document.getElementById("exit-btn").addEventListener("click", function () {
                            document.getElementById("management-modal").style.visibility = "hidden";
                        });

                    }

                </script>
                <script>
                    let searchName = '';

                    function getFilteredUsers() {
                        let isWhitelist = $('#whitelist').prop('checked') ? 'Y' : '';
                        let isBanned = $('#banned').prop('checked') ? 'Y' : '';
                        let reported = $('#reported').prop('checked') ? '0' : '-1';
                        let authority = $('input[name="authority"]:checked').val();
                        $.ajax({
                            url: '<%=request.getContextPath()%>/manageUsers.get',
                            type: 'get',
                            data: {
                                isWhitelist,
                                isBanned,
                                reported,
                                authority,
                                searchName
                            },
                            success: function (result) {
                                console.log(result);
                                if (result.length == 0) {
                                    $('#resultBoard tbody').html('<tr>' +
                                        '<td>' + '조회된 유저가 없습니다.' + '</td>' +
                                        '</tr>');
                                } else {
                                    $('#resultBoard tbody').html('');
                                    for (let i = 0; i < 10; i++) {
                                        if (result[i] != null) {
                                            $('#resultBoard tbody').append('<tr>' +
                                                '<td>' + result[i].userId + '</td>' +
                                                '<td>' + result[i].userName + '</td>' +
                                                '<td>' + '신고횟수' + '</td>' +
                                                '<td>' + result[i].reportCount + '</td>' +
                                                '<td>' + '추천횟수' + '</td>' +
                                                '<td>' + result[i].recommendCount + '</td>' +
                                                '<td>' + '화이트리스트여부' + '</td>' +
                                                '<td>' + result[i].isWhitelist + '</td>' +
                                                '<td>' + '정지여부' + '</td>' +
                                                '<td>' + result[i].isBanned + '</td>' +
                                                '</tr>');
                                        } else {
                                            $('#resultBoard tbody').append('<tr>' +
                                                '<td colspan="10">' + '-' + '</td>' +

                                                '</tr>');
                                        }
                                    }
                                }
                                modalEvent();
                            },
                            error: function () {
                                console.log("ajax통신 실패");
                            }
                        });
                    }
                    $('#search-user').keyup(function () {
                        if (window.event.keyCode == 13) {
                            searchName = $('#search-user').val();
                            getFilteredUsers();
                        }
                    });
                    $('#filter>input').click(getFilteredUsers);
                </script>
                <script> //비동기 스크립트
                    $(function () {

                        getFilteredUsers();
                    });


                </script>


    </body>

    </html>