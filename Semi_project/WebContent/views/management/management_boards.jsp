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
					<table id="board-2">
						<thead>
							<tr>
								<th colspan="7">신고 게시물</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>

					</table>
					<div id="body-footer">
						<input id="search-user" type="search" placeholder="제목 및 내용 키워드로 검색">
						<div id="page-btn">
							<div id="back-btn"></div>
							<div id="next-btn"></div>
						</div>
					</div>
				</div>
			</div>


		</div>
		<div id="footer"></div>
	
    <script> // 게시판신고조회 비동기요청
        $(function(){
	    	function getReportedBoards(){
				$.ajax({
					url : '<%=request.getContextPath()%>/manageReportBoard.get',
					type : 'get',
					success : function(result){ 
						if(result.length == 0 ){
							$('#board-2 tbody').append('<tr>'+
															'<td>' + '신고된 게시판이 없습니다.' + '</td>'+
													   '</tr>');
						} else {
							for(let i = 0; i < 10 ; i++){
								if(result[i] != null){
									$('#board-2 tbody').append('<tr>'+
																	'<td>' + result[i].title + '</td>'+
																	'<td>' + '신고횟수' + '</td>'+
																	'<td>' + result[i].reportCount + '</td>'+
																	'<td>' + '추천횟수' + '</td>'+
																	'<td>' + result[i].recommendCount + '</td>'+
																	'<td>' + '스크랩횟수' + '</td>'+
																	'<td>' + result[i].scrapCount + '</td>'+
															  '</tr>');
                                    $('#board-2 tbody>tr').eq(i).click(function(){
                                        location.href = "<%=request.getContextPath()%>/contentDetail.bo?bNo="+result[i].boardNo;
                                    })
								}else {
									$('#board-2 tbody').append('<tr>'+
																	'<td colspan="7">' + '-'+ '</td>'+
	
															  '</tr>');
								}
							}	
					  }	
                	
				},
				error : function(){
					console.log("ajax통신 실패");
				}				
			});			
		}
	    	getReportedBoards();
	 });
        
      </script>


</body>
</html>