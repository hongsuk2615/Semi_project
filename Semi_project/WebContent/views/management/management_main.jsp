<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../resources/CSS/header.css">
<link rel="stylesheet" href="../../resources/CSS/body.css">
<link rel="stylesheet" href="../../resources/CSS/footer.css">

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
		<%@ include file="management_header.jsp"%>

		<div id="body">
			<div id="board-wrapper">
                        <table id="board-1">
                            <tr>
                                <th colspan="3">회원가입 승인요청</th>
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

                        </table>
                        <table id="board-2">
                            <tr>
                                <th colspan="5">게시물 신고 내역</th>
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
                        </table>
                        <table id="board-3">
                            <tr>
                                <th colspan="3">게시판 생성 요청 내역</th>
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
                        </table>
                        <table id="board-4">
                            <tr>
                                <th colspan="5">신고유저관리</th>
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
		</div>

		<div id="footer"></div>
	</div>
	<script>
		
	</script>
</body>
</html>