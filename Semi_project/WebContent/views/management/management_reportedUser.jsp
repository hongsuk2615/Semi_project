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
		<%@ include file="management_header.jsp"%>

		<div id="body">
			<div id="board-wrapper">
				<table id="board-4">
					<thead>
						<tr>
							<th colspan="7">신고 유저 조회</th>
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
        function modalEvent(){
			$("#board-4 tbody>tr").each(function (index, item) { //신고유저 모달
                item.onclick = function () {
                    if(item.children.length > 1){
                        document.getElementById("management-modal").style.visibility = "visible";
                         let reportedUser = item.children[0].innerHTML;

                         $.ajax({
                            url : '<%=request.getContextPath()%>/manageReportUser.get',
                            data : {reportedUser},
                            type : 'post',
                            success : function(result){ 
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
                                    <div class="modal-body-right">\${result.date}</div>
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
                                </div>`;
                                
                            },
                            error : function(){
                            console.log("ajax통신 실패");
                            }				
                        });
                        document.getElementById("ban-deny-btn").innerHTML = "정지";
                        document.getElementById("ban-deny-btn").addEventListener('click',function(){
                            location.href="<%=request.getContextPath()%>/banUser.do?userId="+reportedUser;
                        });
                        document.getElementById("unban-approve-btn").innerHTML = "화이트리스트";
                        document.getElementById("unban-approve-btn").addEventListener('click',function(){
                            location.href="<%=request.getContextPath()%>/whiteList.do?userId="+reportedUser;
                        });         
                    }                    
 
                }
            });
            document.getElementById("exit-btn").addEventListener("click", function () {
                document.getElementById("management-modal").style.visibility = "hidden";
            });

		}    
        
    </script>
    <script> //비동기 스크립트
	   $(function(){
        function getReportedUsers(){
            $.ajax({
                url : '<%=request.getContextPath()%>/manageReportUser.get',
                type : 'get',
                success : function(result){ 
                	console.log("리포트유저"+result);
                    if(result.length == 0 ){
                        $('#board-4 tbody').append('<tr>'+
                                                        '<td>' + '조회된 유저가 없습니다.' + '</td>'+
                                                   '</tr>');
                    } else {
                        for(let i = 0; i < 10 ; i++){
                            if(result[i] != null){
                                $('#board-4 tbody').append('<tr>'+
                                                                '<td>' + result[i].userId + '</td>'+
                                                                '<td>' + '신고횟수' + '</td>'+
                                                                '<td>' + result[i].reportCount + '</td>'+
                                                                '<td>' + '추천횟수' + '</td>'+
                                                                '<td>' + result[i].recommendCount + '</td>'+
                                                                '<td>' + '화이트리스트여부' + '</td>'+
                                                                '<td>' + result[i].isWhitelist + '</td>'+
                                                          '</tr>');
                            }else {
                                $('#board-4 tbody').append('<tr>'+
                                                                '<td colspan="7">' + '-'+ '</td>'+

                                                          '</tr>');
                            }
                        }	
                  }	
                  modalEvent();		
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