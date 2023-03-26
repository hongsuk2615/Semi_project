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
                               
                            </tbody>

                        </table>
                        <table id="board-2">
                            <thead>
                                <tr>
                                    <th colspan="7">게시물 신고 내역</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                        <table id="board-3">
                            <thead>
                                <tr>
                                    <th colspan="3">게시판 생성 요청 내역</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                        <table id="board-4">
                            <thead>
                                <tr>
                                    <th colspan="7">신고유저관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                        <table id="board-5">
                            <thead>
                                <tr>
                                    <th>건의사항 게시판</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                        <table id="board-6">
                            <thead>
                                <tr>
                                    <th>공지사항 게시판</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>

                    </div>
                </div>

                <div id="footer"></div>

        </div>
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
        
        
        
        <script> // 회원가입 요청조회 비동기요청
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
                      enrollModalEvent();	
				},
				error : function(){
					console.log("ajax통신 실패");
				}				
			});			
		}
	    	getEnrollmentReqs();
            
	 });
        
      </script>
        
        
        
        
      
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
                                        location.href = "<%=request.getContextPath()%>/contentDetail.bo?bno="+result[i].boardNo;
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


<script> // 게시판생성요청조회 비동기요청
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
                  enrollModalEvent();			
            },
            error : function(){
                console.log("ajax통신 실패");
            }				
        });			
    }
        getBoardReq();
 });
    
  </script>


<script> // 신고유저조회 비동기요청
    $(function(){
        function getReportedUsers(){
            $.ajax({
                url : '<%=request.getContextPath()%>/manageReportUser.get',
                type : 'get',
                success : function(result){ 
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
                  enrollModalEvent();		
            },
            error : function(){
                console.log("ajax통신 실패");
            }				
        });			
    }
        getReportedUsers();
 });
    
  </script>

<script> // 게시판 비동기요청
    $(function(){
        function getBoardReq(cName, num){
            $.ajax({
                url : '<%=request.getContextPath()%>/boardlist.get?cName='+cName,
                type : 'get',
                success : function(result){ 
                    if(result.length == 0 ){
                        $('#board-'+num+' tbody').append('<tr>'+
                                                        '<td>' + '조회된 게시물이 없습니다' + '</td>'+
                                                   '</tr>');
                    } else {
                        for(let i = 0; i < 10 ; i++){
                            if(result[i] != null){
                                $('#board-'+num+' tbody').append('<tr>'+
                                                                '<td>' + result[i].title + '</td>'+
                                                          '</tr>');
                                $('#board-'+num+' tbody>tr').eq(i).click(function(){
                                    location.href = "<%=request.getContextPath()%>/contentDetail.bo?bno="+result[i].boardNo;
                                })
                            }else {
                                $('#board-'+num+' tbody').append('<tr>'+
                                                                '<td>' + '-'+ '</td>'+

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
        getBoardReq('건의사항',5);
        getBoardReq('공지사항',6);
 });
    
  </script>



      
      <script>
      
            document.querySelector("#board-1 th").addEventListener("click", function () {
                location.href = "<%=request.getContextPath()%>/usermanagement.do";
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
            function enrollModalEvent(){
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


            // $("#board-2 tbody>tr").each(function (index, item) {
            //     item.onclick = function () {
            //         location.href="";
            //     }
            // });

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
                    }
                    document.getElementById("ban-deny-btn").innerHTML = "승인";
                    document.getElementById("unban-approve-btn").innerHTML = "거부";
                }
            });

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
            // document.getElementById("ban-deny-btn").addEventListener("click", function () {
            //     location.href = ""
            // });
            // document.getElementById("unban-approve-btn").addEventListener("click", function () {
            //     location.href = ""
            // });
    	  
     
        }
      
        </script>
      
      
      
      
      
      
      
    </body>

    </html>