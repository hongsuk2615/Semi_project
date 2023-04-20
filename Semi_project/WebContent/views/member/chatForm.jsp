<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="resources/CSS/chatCustom.css">
<link rel="stylesheet" href="resources/CSS/bootstrap.css">
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/body.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="resources/JS/bootstrap.js"></script>
<style>
	hr{
		border-top:1px solid #77a9de;
	}
</style>
<title>실시간 채팅 페이지</title>  
</head>
<body>

	<div id="wrapper">
		<!-- 네비영역 헤더-->
		<%@ include file="../common/header.jsp"%>
		<div class=container id="body">
			<div class="container bootstrap snippet" id="body-wrapper">
				<div class="row">
					<div class="col-xs-12">
						<div class="portlet portlet-default">
							<div class="portlet-heading">
								<div class="portlet-title">
									<h4>
										<i class="fa fa-circle text-green">KH TIME</i>
									</h4>
								</div>
								<div class="clearfix"></div>
							</div>
							<div id="chat" class="panel-collapse collapse in">

								<!-- 채팅내용이 출력될 div -->
								<div class="portlet-body chat-widget"
									style="overflow-y: scroll; width: 1118px; height: 600px;">
									<div class="row">
										<div class="col-lg-12">
											<p class="text-center text-muted small" id="sysdate" style="font-size: 20px;"></p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12" id="chatting-box">
											
										</div>
									</div>
									
								</div>

								<!-- 채팅을 입력할 div -->
								<div class="portlet-footer">
									<div class="row">
										<div class="form-group col-xs-4">
											<!-- 로그인한 유저의 NICKNAME 출력 -->
											<h4 style="height:10px; color:white; "><%=loginUser.getNickName() %></h4>
											<input type="hidden" value="<%=loginUser.getNickName() %>" id="sender">
											<input type="hidden" value="<%=loginUser.getUserProfile() %>" id="profileImg">
											<!-- <input type="hidden" id="sendTime"> -->
										</div>
									</div>
									<div class="row" style="height: 90px;">
										<div class="form-group col-xs-10">
											<textarea style="resize:none; height: 80px;" id="msg" class="form-control"
												placeholder="메세지를 입력하세요" maxlength="100"></textarea>
										</div>
										<div class="form-group col-xs-2">
											<button type="button" class="btn btn-default pull-right"
												onclick="sendMsg(); ">전송</button>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
	
	<script> // 아이디값 sysdate에 오늘날짜값 넣어주는 스크립트 
	    let today = new Date();
		document.getElementById('sysdate').innerHTML = today.getFullYear()+'.'+(today.getMonth()+1)+'.' + today.getDate();
	</script> 
	
	<script>
		// WebSocket 객체 연결 192.168.130.3 내아이피
		// const socket = new WebSocket("ws://ip:port/<%=request.getContextPath()%>/chatting.do")
		const socket = new WebSocket("ws://192.168.130.5:8080/<%=request.getContextPath()%>/chatting.do")
	
		socket.onopen = function(e){ //접속성공여부확인
			console.log("접속 성공");
			console.log(e);
		}
		
		// 웹소켓의 sendText,sendObject메소드 실행하면 실행되는 함수
		socket.onmessage = function(e){
			console.log("메세지 수신");
			console.log(e);
			console.log(e.data);
			
			let msg = e.data.split(","); //[닉네임,내용,보낸시간]
			
			if(msg[0] == "<%=loginUser.getNickName()%>" && msg[1] != ' '){ 
				console.log('내가보낸거');
				$('#chatting-box').append(`<div class="media" style="color:#42A5F5">
						<a class="pull-left" href="#"><img class="media-object img-circle" src="<%=request.getContextPath()%>`+msg[3]+`"></a>
						<div class="media-body">
						<h4 class="media-heading" id="nickName">
							\${msg[0]} <span class="small pull-right" id="sendTime" style="color:#42A5F5;">\${msg[2]}</span>
						</h4>
					</div>
					<p>\${msg[1]}</p>
				</div><hr>`);
				
			} else if(msg[1] != ' '){
				console.log('받은거');
				$('#chatting-box').append(`<div class="media">
						<a class="pull-left" href="#"><img class="media-object img-circle" src="<%=request.getContextPath()%>`+msg[3]+`"></a>
						<div class="media-body">
						<h4 class="media-heading" id="nickName">
							\${msg[0]} <span class="small pull-right" id="sendTime">\${msg[2]}</span>
						</h4>
					</div>
					<p>\${msg[1]}</p>
				</div><hr>`);
			}
		}
		
		// 웹소켓서버에서 메세지 전송하는 함수
		const sendMsg = () => {
			// 보내는사람닉네임,메세지내용,보낸시간
			var nowDate = new Date(); 
			
			socket.send($("#sender").val()+","+$("#msg").val()+","+nowDate.toLocaleTimeString()+","+$('#profileImg').val()); //"유저닉네임,채팅친내용,보낸시간"
			
		}; 
		
		// 웹소켓이 닫히는경우 0.3초마다 다시 연결시켜주는 코드
		socket.onclose = function(e){
			console.log('소켓이닫힘, 다시연결', e);
			setTimeout(socketInit, 300);
		}
		setTimeout(function(){
			socket.send($("#sender").val()+", ,"+new Date().toLocaleTimeString());
		},300);
		
		
		// 전송시 enter키 감지하는 스크립트
		$('#msg').keyup(function () {
            if (window.event.keyCode == 13) {
               
                sendMsg();
                $(this).val("");
            }
        });
	</script>
	
</body>
</html>