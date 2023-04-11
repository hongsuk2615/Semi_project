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
<title>실시간 채팅 페이지</title>  
</head>
<body>
	<script>
      const msg = "<%=request.getSession().getAttribute("alertMsg")%>";
      
      if(msg != "null") { // "성공적으로 로그인이 되었습니다" / "null"
         alert(msg);
         // 알람창을 띄워준 후 session에 담긴 메세지는 지워줘야함
         // 안그러면 menubar.jsp가 로딩될때마다 매번 alert함수가 실행됨
         <%request.getSession().removeAttribute("alertMsg");%>
         
      }
   	</script>
	<div class=container>
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green">실시간 채팅방</i>
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">

							<!-- 채팅내용이 출력될 div -->
							<div class="portlet-body chat-widget"
								style="overfloy-y: auto; width: auto; height: 300px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2023년04월11일</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="a"> <img
												class="media-object img-circle" src="">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													홍길동 <span class="small pull-right">오전 9:48</span>
												</h4>
											</div>
											<p>안녕하세요.하이하이</p>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#"> <img
												class="media-object img-circle" src="">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													손석범 <span class="small pull-right">오전 9:50</span>
												</h4>
											</div>
											<p>하이요</p>
										</div>
									</div>
								</div>
							</div>

							<!-- 채팅을 입력할 div -->
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<!-- 로그인한 유저의 NICKNAME 출력 -->
										<h4 style="height: 40px; background-color:#8dbaf2;" id="sender" >로그인한 유저닉네임</h4>
									</div>
								</div>
								<div class="row" style="height: 90px;">
									<div class="form-group col-xs-10">
										<textarea style="height: 80px;" id="msg" class="form-control"
											placeholder="메세지를 입력하세요" maxlength="100"></textarea>
									</div>
									<div class="form-group col-xs-2">
										<button type="button" class="btn btn-default pull-right"
											onclick="sendMsg();">전송</button>
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

	<script>
		// WebSocket 객체 연결 192.168.120.23 내아이피
		// const socket = new WebSocket("ws://ip:port/<%=request.getContextPath()%>/chatting.do")
		const socket = new WebSocket("ws://192.168.120.23:8080/<%=request.getContextPath()%>/chatting.do")
		
		socket.onopen = function(e){ //접속성공여부확인
			console.log("접속 성공");
			console.log(e);
		}
		
		// 웹소켓의 sendText,sendObject메소드 실행하면 실행되는 함수
		socket.onmessage = function(e){
			console.log("메세지 수신");
			console.log(e);
			console.log(e.data);
		}
		
		// 웹소켓서버에서 메세지 전송하는 함수
		const sendMsg = () => {
			// 보내는사람닉네임,메세지내용
			socket.send($("#sender").val()+","+$("#msg").val());
			
		}; 
		
	</script>
	
</body>
</html>