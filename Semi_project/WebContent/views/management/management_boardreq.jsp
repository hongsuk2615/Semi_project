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
				<table id="board-3">
					<thead>
						<tr>
							<th colspan="3">게시판 생성 요청 내역</th>
						</tr>
					</thead>
					<tbody>

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
            $("#board-3 tbody>tr").each(function (index, item) { // 게시판 생성 요청 모달
                    item.onclick = function () {
                        if(item.children.length > 1){
                            document.getElementById("management-modal").style.visibility = "visible";
                            let categoryName = item.children[0].innerHTML;
                            console.log(categoryName);
                            $.ajax({
                                url : '<%=request.getContextPath()%>/manageBoardReq.get',
                                data : {categoryName},
                                type : 'post',
                                success : function(result){ 
                                    console.log(result);
                                    let reqUser = result[(Object.keys(result)[0])];
                                    console.log('유저: ' + reqUser);
                                    document.getElementById("modal-body").innerHTML = 
                                    `<div class="modal-body-wrapper">
                                        <div class="modal-body-left">요청한 아이디</div>
                                        <div class="modal-body-right">\${reqUser.userId}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">이름</div>
                                        <div class="modal-body-right">\${reqUser.userName}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">분반</div>
                                        <div class="modal-body-right">\${reqUser.userClass}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">학생/강사 구분</div>
                                        <div class="modal-body-right">\${reqUser.authority == 1 ? '강사' : '학생'}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">생성하고 싶은 게시판 이름</div>
                                        <div class="modal-body-right">\${categoryName}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">사유</div>
                                        <div class="modal-body-right">\${Object.keys(result)[0]}</div>
                                    </div>`;
                                    
                                },
                                error : function(){
                                console.log("ajax통신 실패");
                                }				
                            });     
                            document.getElementById("ban-deny-btn").innerHTML = "승인";
                            document.getElementById("ban-deny-btn").addEventListener('click',function(){
                                location.href="<%=request.getContextPath()%>/approveMakeBoard.do?cName="+categoryName+"&approve=Y";
                            });
                            document.getElementById("unban-approve-btn").innerHTML = "거부";
                            document.getElementById("unban-approve-btn").addEventListener('click',function(){
                                location.href="<%=request.getContextPath()%>/approveMakeBoard.do?cName="+categoryName+"&approve=N";
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
        function getBoardReq(){
            $.ajax({
                url : '<%=request.getContextPath()%>/manageBoardReq.get',
                type : 'get',
                success : function(result){ 
                    console.log(result);
                    if(result.length == 0 ){
                        $('#board-3 tbody').append('<tr>'+
                                                        '<td>' + '생성 요청된 게시판이 없습니다.' + '</td>'+
                                                   '</tr>');
                    } else {
                        for(let i = 0; i < 10 ; i++){
                            if(result[i] != null){
                                $('#board-3 tbody').append('<tr>'+
                                                                '<td>' + Object.keys(result[i])[0] + '</td>'+
                                                                '<td>' + result[i][Object.keys(result[i])[0]].userId + '</td>'+
                                                                '<td>' + (result[i][Object.keys(result[i])[0]].authority ==  1 ? "강사":"학생") + '</td>'+     
                                                          '</tr>');
                            }else {
                                $('#board-3 tbody').append('<tr>'+
                                                                '<td colspan="3">' + '-'+ '</td>'+

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
        getBoardReq();
 });
    
    
    </script>
    


</body>
</html>