<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
	min-height: 500px;
	background-color: #f1f4f9;
}
</style>
<body>
	<div id="wrapper">
		<%@ include file="management_header.jsp"%>

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
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디2</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디3</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디4</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디5</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디1</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디2</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디3</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디4</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
						<tr>
							<td>유저아이디5</td>
							<td>유저이름</td>
							<td>학생/강사 구분</td>
						</tr>
					</tbody>

				</table>
				<div id="body-footer">
					<input id="search-user" type="search">
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
    <script> //비동기 스크립트
	    $(function(){
	    	function getReportedUsers(){
				$.ajax({
					url : '<%=request.getContextPath()%>/manageReportUser.get',
					type : 'get',
					success : function(result){ 
						console.log(result);
						$('#output1').text(result);
					},
					error : function(){
						console.log("ajax통신 실패");
					}				
				});			
			}
			getReportedUsers();
		 });
    
    
    </script>


</body>
</html>