<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>khaelrtmodal</title>
</head>
<body>
	<div id="modal-alert" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
				<p id="modal-contents"></p>
				<button id="modal-button"><span>확인</span></button>
			</div>
		</div>
	</div>
	
	<div id="modal-confirm" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
				<p id="modal-confirm-content"></p>
				<button class="confirmbtn" id="modal-yes-button" value=""><span>확인</span></button>
				<button class="confirmbtn" id="modal-no-button"><span>취소</span></button>
			</div>
		</div>
	</div>
</body>
</html>