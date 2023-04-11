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
				<div>
					<table id="board-1">
						<thead>
							<tr>
								<th colspan="3">회원가입 승인요청</th>
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
	<script>
		let currentPage = 1;
		let userName='';
	</script>
	<script> //모달스크립트
        function modalEvent(){
			$("#board-1 tbody>tr").each(function (index, item) { //회원가입 승인요청 모달창
                item.onclick = function () {
                    
                     if(item.children.length > 1){
                        document.getElementById("management-modal").style.visibility = "visible";
                         let userId = item.children[0].innerHTML;
                     
                    console.log(userId);
                    
                    $.ajax({
                            url : '<%=request.getContextPath()%>/manageEnrollmentReqs.get',
                            data : {userId},
                            type : 'post',
                            success : function(result){ 
                                console.log(result);
                                document.getElementById("modal-body").innerHTML = 
                                    `<div class="modal-body-wrapper">
                                        <div class="modal-body-left">아이디</div>
                                        <div class="modal-body-right">\${result.userId}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">이름</div>
                                        <div class="modal-body-right">\${result.userName}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">닉네임</div>
                                        <div class="modal-body-right">\${result.nickName}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">분반</div>
                                        <div class="modal-body-right">\${result.userClass}</div>
                                    </div>
                                    <div class="modal-body-wrapper">
                                        <div class="modal-body-left">학생/강사 구분</div>
                                        <div class="modal-body-right">\${result.authority==1 ? '강사' : '학생'}</div>
                                    </div>`;
                            },
                            error : function(){
                            console.log("ajax통신 실패");
                            }				
                        });
                    
                        document.getElementById("ban-deny-btn").innerHTML = "승인";
                        document.getElementById("ban-deny-btn").addEventListener('click',function(){
                            location.href="<%=request.getContextPath()%>/approveEnroll.do?userId="+userId+"&approve=Y";
                        });
                        document.getElementById("unban-approve-btn").innerHTML = "거부";
                        document.getElementById("unban-approve-btn").addEventListener('click',function(){
                            location.href="<%=request.getContextPath()%>/approveEnroll.do?userId="+userId+"&approve=N";
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
	    	function getEnrollmentReqs(){
				$.ajax({
					url : '<%=request.getContextPath()%>/manageEnrollmentReqs.get',
					type : 'get',
					success : function(result){ 
						if(result.length == 0 ){
							$('#board-1 tbody').append('<tr>'+
															'<td>' + '요청된 회원가입이없습니다.' + '</td>'+
													   '</tr>');
						} else {
							for(let i = 0; i < 10 ; i++){
								if(result[i] != null){
									$('#board-1 tbody').append('<tr>'+
																	'<td>' + result[i].userId + '</td>'+
																	'<td>' + result[i].userName + '</td>' +													
																	'<td>' + (result[i].authority == '1' ?  '강사':'학생') + '</td>'+
															  '</tr>');
								}else {
									$('#board-1 tbody').append('<tr>'+
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
	    	getEnrollmentReqs();
            
	 });
    
    
    </script>
	<script> // 카테고리 검색 이벤트
		$('#search-user').keyup(function () {
			currentPage = 1;
			if (window.event.keyCode == 13) {
				userName = $(this).val();
				$.ajax({
					url : '<%=request.getContextPath()%>/filteredApproveEnroll.get',
					type : 'get',
					data : {userName, currentPage},
					success : function(result){
						$('#board-1 tbody').html('');
						if(result.length == 0 ){
							$('#board-1 tbody').append('<tr>'+
															'<td>' + '요청된 회원가입이없습니다.' + '</td>'+
													   '</tr>');
						} else {
							for(let i = 0; i < 10 ; i++){
								if(result[i] != null){
									$('#board-1 tbody').append('<tr>'+
																	'<td>' + result[i].userId + '</td>'+
																	'<td>' + result[i].userName + '</td>' +													
																	'<td>' + (result[i].authority == '1' ?  '강사':'학생') + '</td>'+
															  '</tr>');
								}else {
									$('#board-1 tbody').append('<tr>'+
																	'<td colspan="3">' + '-'+ '</td>'+
	
															  '</tr>');
								}
							}		
					  }	
					  modalEvent();	
					}
	
	
	
				});
			}
		});
		</script>
		
		<script>
		$('#back-btn').click(function(){
			if(currentPage>1){
				currentPage--;
			}
			
			$.ajax({
				url : '<%=request.getContextPath()%>/filteredApproveEnroll.get',
				type : 'get',
				data : {userName, currentPage},
				success : function(result){
					$('#board-1 tbody').html('');
					if(result.length == 0 ){
						$('#board-1 tbody').append('<tr>'+
														'<td>' + '요청된 회원가입이없습니다.' + '</td>'+
												   '</tr>');
					} else {
						for(let i = 0; i < 10 ; i++){
							if(result[i] != null){
								$('#board-1 tbody').append('<tr>'+
																'<td>' + result[i].userId + '</td>'+
																'<td>' + result[i].userName + '</td>' +													
																'<td>' + (result[i].authority == '1' ?  '강사':'학생') + '</td>'+
														  '</tr>');
							}else {
								$('#board-1 tbody').append('<tr>'+
																'<td colspan="3">' + '-'+ '</td>'+

														  '</tr>');
							}
						}		
				  }	
				  modalEvent();	
				}



			});
			
		})
		
		$('#next-btn').click(function(){			
				currentPage++;
			$.ajax({
				url : '<%=request.getContextPath()%>/filteredApproveEnroll.get',
				type : 'get',
				data : {userName, currentPage},
				success : function(result){
					$('#board-1 tbody').html('');
					if(result.length == 0 ){
						$('#board-1 tbody').append('<tr>'+
														'<td>' + '요청된 회원가입이없습니다.' + '</td>'+
												   '</tr>');
					} else {
						for(let i = 0; i < 10 ; i++){
							if(result[i] != null){
								$('#board-1 tbody').append('<tr>'+
																'<td>' + result[i].userId + '</td>'+
																'<td>' + result[i].userName + '</td>' +													
																'<td>' + (result[i].authority == '1' ?  '강사':'학생') + '</td>'+
														  '</tr>');
							}else {
								$('#board-1 tbody').append('<tr>'+
																'<td colspan="3">' + '-'+ '</td>'+

														  '</tr>');
							}
						}		
				  }	
				  modalEvent();	
				}



			});
			
		})
		
		
		
		</script>

</body>
</html>