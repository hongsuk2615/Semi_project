<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/body.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/mypage.css">
<link rel="stylesheet" href="resources/CSS/base.css">

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
<title>KH_TIME 메인페이지</title>
</head>
<style>
	a, button{
	 cursor:pointer;
	}
	
	a:hover{
	 color:skyblue;
	}
	
	.openBtn:hover, .openBtn1:hover, .openBtn2:hover{
	 background-color:skyblue;
	 color:#0d64e6;
	 
	}
</style>

<body>

	<div id="wrapper">

		<!-- 네비영역 헤더-->
		<%@ include file="../common/header.jsp"%>


		<!-- 마이페이지 전체래퍼-->
		<div id="body">
			<div id="body-wrapper">
				<div id="mypage-wrap">
					<div id="myinfo" style="height: 270px; width: 100%; color: #0d64e6;">
						<strong>내 정보</strong>
						<div style="position: relative; left: 60%;">
							<button type="button" class="openBtn">비밀번호변경</button>
							<button type="button" class="openBtn1">이메일변경</button>
						</div>
						<br>
						<br>
						<div style=" width: 100px; ">
							<label for="profile">
								<div style=" width:100px;height: 100px;">
									<img src="<%=request.getContextPath()%><%=loginUser.getUserProfile()%>" alt="로그인유저프사" style="width:100%; height:100%; border-radius: 50px;">
								</div>
							</label><!--  <input type="file" name="profile" id="profile"
								style="display: none;" onchange="readURL(this);"> -->
						</div>
						<br><br>
						<div style="display: flex; justify-content: space-between;">
							<div id="userInfo">
							<span id="loginuser-id">아이디 : <%=loginUser.getUserId() %></span><br>
							<span id="loginuser-name&nickname">이름 : <%=loginUser.getUserName() %></span><br>
							<span>닉네임 : <%=loginUser.getNickName() %></span><br>
							<span id="loginuser-class">강의실 : <%=loginUser.getUserClass() %></span>
							</div>
							<button id="logoutbtn" style="margin-top: 40px;"onclick="javascript:btn()">로그아웃</button>
						</div>
					</div>
					
					<div id="community"
						style="height: 200px; display: flex; flex-direction: column; justify-content: space-between;">
						<strong>커뮤니티</strong>
						<a class="openBtn3">닉네임변경</a>
						<a class="openBtn4">프로필사진변경</a>
						<a id="messageboxBtn">쪽지함</a>
					    <a id="user-boards">게시판관리</a>
					</div>

					<div id="infouse"
						style="display: flex; flex-direction: column; justify-content: space-between;">
						<strong>이용안내</strong> 
						<a id="noticeBoard">공지사항</a> 
						<a id="termsOfUse">서비스약관</a> 
						<a id="privacyPolicy">개인정보 처리방침</a> 
						<a id="teenagerPolicy">청소년 보호정책</a>
					</div>

					<div id="etc" style="height: 150px;">
						<strong>기타</strong>
						<button class="openBtn2"
							style="position: relative; top: 90%; left: 83%;"
							data-target="#deleteModal">회원탈퇴</button>
					</div>
				</div>
			</div>
		</div>

		<div id="footer"></div>
	</div>



	<!-- [비밀번호 변경] 모달창 -->

	<div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<div class="header">
				<h2>비밀번호 변경</h2>
			</div>
			<form action="<%= request.getContextPath() %>/updatePwd.me" method="post" onSubmit="return validatePwd();"> 
				<div class="addDdayBody">
					<div class="inputBox">
						<h4 class="inputLabel">새 비밀번호</h4>
						<input type="password" name="updatePwd" placeholder="새 비밀번호" class="inputField" required /><br>
						<input type="password"name="checkPwd" placeholder="새 비밀번호 확인" class="inputField" required />
						
					</div>
		
					<div class="inputBox">
						<h4 class="inputLabel">현재 비밀번호</h4>
						<input type="password" name="userPwd" placeholder="현재 비밀번호" class="inputField" required />
					</div>
					<div>
						<strong>※ 혹시 타인에게 계정을 양도하려고 하시나요?</strong><br> KH타임 이용약관에서는
						타인에게 계정 판매, 양도 및 대여 등을 엄격하게 금지하고 있습니다. <br> 모니터링 시스템에 의해 계정
						양도가 적발될 경우 해당 계정은 영구 정지, 탈퇴 등의 조치가 가해지며, 계정 양도로 인해 사기, 불법 행위가 발생할
						경우 관련법에 따라 <span class="redline">법적 책임을 지게 될 수 있습니다.</span>
					</div>
				</div>
				<button type="submit" class="closeBtn" id="fullBlueBtn1" onclick="return validatePwd();" >비밀번호 변경</button>			
			</form>
			
			<!-- 비밀번호 유효성검사 정규식 -->
			<script>
		 			function validatePwd(){
		 				let regExp = /^[a-z0-9!@#$%^]{8,15}$/i;
		 				console.log($("input[name='updatePwd']").val());
		 				console.log(regExp.test($("input[name='updatePwd']").val()));
			             if(!regExp.test($("input[name='updatePwd']").val())){
			                khalert("유효한 비밀번호를 입력해주세요");
			                return false;
			            }else if($("input[name='updatePwd']").val() != $("input[name='checkPwd']").val()) {
		 					khalert("비밀번호가 일치하지 않습니다.");						
		 					return false;	
		 				} 
		 			}
		 	</script>
		</div>
	</div>




	<!-- [이메일 변경] 모달창 -->
	<div class="modal1 hidden">
		<div class="bg1"></div>
		
		<div class="modalBox" style="height:auto;">
			<div class="header">
				<h2>이메일 변경</h2>
			</div>
			<form action="<%= request.getContextPath() %>/updateEmail.me" method="post">
			<div class="addDdayBody" style="height:auto;">
				<div class="inputBox">
					<h3 class="inputLabel">이메일</h3>
					<input type="text" name="updateEmail" id="email" placeholder="ex)abc@naver.com" class="inputField" required/><br>
				</div>
				<div class="inputBox">
					<h3 class="inputLabel">계정 비밀번호</h3>
					<input type="password" name="userPwd" placeholder="사용자 비밀번호 입력" class="inputField" required/>
				</div>
				<div id="emailnotice" style="position: relative; ">
					<span>※ 반드시 본인의 이메일을 입력해주세요.</span><br> <span>※ 계정 분실 시
						아이디/비밀번호 찾기,개인정보 관련 주요 고지사항 안내 등에 사용 됩니다.</span>
				</div>
			</div>
			<button style="border:transparent;" type="submit" class="closeBtn1" id="fullBlueBtn" onclick="return validateEmail();">이메일 변경</button>
			</form>
		</div>
		
		
		<script> // 이메일변경 모달창 클릭시 이메일양식에 맞는지 유효성검사
		function validateEmail(){
			  var emailVal = $("#email").val();

			  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // 검증에 사용할 정규식 변수 regExp에 저장
			  if(regExp.test(emailVal)) {
			    return true;
			  }
			  else {
			    khalert('이메일 형식이 다릅니다.');
			    return false;
			  }
		}
		</script>
	</div>

	
	
	<!-- [프로필사진변경 모달창] -->

	<div class="modal4 hidden">
		<div class="bg4"></div>
		<div class="modalBox" style="height:430px; display: flex; flex-direction: column;">
			<div class="header">
				<h2>프로필사진 변경</h2>
			</div>
				<div class="addDdayBody" style="display: flex; justify-content: space-between; flex-direction: column; padding:0;">
					<div class="inputBox">
						<div id="enrollimg">
                            이미지나 사진을 등록해주세요.<br><br>
                            <div>
                                <img id="titleImg" width="150" height="150">
                            </div><br>
                            <div id="file-area" style="border: 1px solid black">
                               <input type="file" id="file1" name="file" onchange="loadImg(this, 1);"> 
                            </div>
                        </div>
				  </div>
				<button style="border:transparent;" type="button" class="closeBtn4" id="fullBlueBtn4" onclick="changeProfileImg();">변경하기</button>			
			</div>
   		 </div>
   	</div>
   
   	<script>
        $(function() {
            $("#titleImg").click(function() {
                $("#file1").click();
            })
        });

        
        function loadImg(inputFile, num) {
            // inputFile : 현재 변화가 생긴 input type="file" 요소
            // num : 몇번째 input 요소인지 확인 후 해당영역에 미리보기하기위한 변수
            console.log(inputFile.files[0]);
            /*
                파일 선택시 length = 1, 파일선택 취소시 배열안의 내용이 비어있게됨
                length 값을 가지고 파일의 존재유무를 알수가 있다.
                files속성은 업로드된 파일의 정보들을  "배열"형식으로 여러개 묶어서 반환, length 그 배열의 크기를 의미
             */
            if(inputFile.files.length != 0){
                //선택된 파일이 존재할 경우에 선택된 파일들을 읽어들여서 그 영역에 맞는 곳에 미리보기 추가
                //파일을 읽어들일 FileReader 객체 생성
                let reader = new FileReader();
                	
                // 파일을 읽어들이는 메서드 -> 어느파일을 읽을지 매개변수에 제시해줘야함.
                // 0번째 인덱스에 담긴 파일정보를 제시
                // -> 해당파일을 읽어들이는 순간 해당파일만의 고유한 url부여됨.
                // -> 해당 url을 src 속성값으로 제시
                reader.readAsDataURL(inputFile.files[0]);
                
                // 파일 읽기가 완료되었을때 실행할 함수 정의
                reader.onload = function(e){// e.target.result에 고유한 url부여됨.
                    //각 영역에 맞춰서 이미지 미리보기 기능 제시.
                    let url = e.target.result;
                
                    switch(num){
                    case 1: $("#titleImg").attr("src",url);break;
                    }
                }
            }else{
                // 선택된 파일이 없을 경우 미리보기도 함께 사라지게끔 작업.
                switch(num){
                case 1: $("#titleImg").removeAttr("src"); break;
            }
        }
    }
        function changeProfileImg(){
  
        	let form = new FormData();
        	form.append("profileImg",$('#file1')[0].files[0]);
        	
        	$.ajax({
        		url : "/Semi_project/changProfileImg.me",
        		data : form,
        		type : "post",
        		processData : false,
        		contentType : false,
        		success : function(){
        			location.href="<%=request.getContextPath()%>/myPage.me";
        		}
        	})
        }
    </script>
   	
   	
	
	
	<!-- [닉네임 변경] 모달창 -->
	<div class="modal3 hidden">
		<div class="bg3"></div>
		<div class="modalBox" style="height: 300px;">
			<div class="header">
				<h2>닉네임 변경</h2>
			</div>
		<form action="<%= request.getContextPath() %>/updateNickName.me" method="post">
			<div class="addDdayBody" style="height:auto;">
				<div class="inputBox">
					<h3 class="inputLabel">닉네임</h3>
					<input type="text" id="nickName" name="updateNickName" placeholder="특수문자 제외 2자~ 8자" class="inputField" /><br>
				</div>
				<div id="emailnotice"
					style="position: relative; text-align: center;">
					※ 닉네임을 설정하면 <span class="redline">30일간 변경할 수 없습니다.</span><br>
				</div>
			</div>
			<button type="submit" class="closeBtn3" id="fullBlueBtn3"
					style="width: 100%; height: 60px; display: flex; justify-content: space-evenly; border:transparent; border-radius:0px 0px 12px 12px;" onclick="return validateNickName();">
					닉네임 변경
				</button>
		</form>
		<script>
		function validateNickName(){
			  var nickNameVal = $("#nickName").val();
			  
			  var regExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}$/;
			  // 검증에 사용할 정규식 변수 regExp에 저장
			  if (regExp.test(nickNameVal)) {
			    return true;
			  }
			  else {
			    khalert('닉네임 형식이 다릅니다.');
			    return false;
			  }
			  window.location.href="/Semi_project/myPage.me" 
		}
		</script>
		</div>
	</div>
	
	

	<!-- [회원 탈퇴] 모달창 -->
	<div class="modal2 hidden" id="deleteModal">
		<div class="bg2"></div>
		<div class="modalBox" style="height: 300px;">
			<div class="header">
				<h2>회원탈퇴</h2>
			</div>
			<div class="addDdayBody" style="display:flex; justify-content:center;">
				<div id="emailnotice"
					style="position: relative; text-align: center;">
					<p style="text-align: center;">그 동안 KH TIME을 이용해주셔서 감사합니다.</p>
					<span style="text-align: center;">탈퇴하시겠습니까?</span>
					<div class="closeBtn2" id="confirm"
						style="width: 100%; height: 120px; display: flex; justify-content: space-evenly; padding-top: 70px;">
						<button type="submit" id="yes" style="width: 100%;">예</button>
						<button id="no" style="width: 100%;">아니오</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function(){
				$('#yes').click(function(){
					location.href = '<%= request.getContextPath() %>/deleteMember.me'
				});
			});
		</script>
	</div>
   
	<script> <!-- 로그아웃 버튼 스크립트-->
        
        document.getElementById("logoutbtn").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath()%>/logout.me";
	    })
    </script>


	<script> <!--비밀번호변경 스크맆트-->
        const open = () => {
            document.querySelector(".modal").classList.remove("hidden");
        }
        const close = () => {
            console.log('cdlose')
            document.querySelector(".modal").classList.add("hidden");
        }
        document.querySelector(".openBtn").addEventListener("click", open);
        document.querySelector(".closeBtn").addEventListener("click", close);
        document.querySelector(".bg").addEventListener("click", close);
    </script>



	<script> <!--이메일변경 스크맆트-->
        const open1 = () => {
            document.querySelector(".modal1").classList.remove("hidden");
        }
        const close1 = () => {
            console.log('cdlose')
            document.querySelector(".modal1").classList.add("hidden");
        }
        document.querySelector(".openBtn1").addEventListener("click", open1);
        document.querySelector(".closeBtn1").addEventListener("click", close1);
        document.querySelector(".bg1").addEventListener("click", close1);
    </script>


	<script> <!--회원탈퇴버튼 스크맆트-->
    const open2 = () => {
        document.querySelector(".modal2").classList.remove("hidden");
    }
    const close2 = () => {
        console.log('cdlose')
        document.querySelector(".modal2").classList.add("hidden");
    }
    document.querySelector(".openBtn2").addEventListener("click", open2);
    document.querySelector(".closeBtn2").addEventListener("click", close2);
    document.querySelector(".bg2").addEventListener("click", close2);
    </script>



	<script> <!--닉네임변경 스크맆트-->
    const open3 = () => {
        document.querySelector(".modal3").classList.remove("hidden");
    }
    const close3 = () => {
        console.log('cdlose')
        document.querySelector(".modal3").classList.add("hidden");
    }
    document.querySelector(".openBtn3").addEventListener("click", open3);
    document.querySelector(".closeBtn3").addEventListener("click", close3);
    document.querySelector(".bg3").addEventListener("click", close3);
	</script>
	
	<script> <!--프로필사진변경 스크맆트-->
    const open4 = () => {
        document.querySelector(".modal4").classList.remove("hidden");
    }
    const close4 = () => {
        console.log('cdlose')
        document.querySelector(".modal4").classList.add("hidden");
    }
    document.querySelector(".openBtn4").addEventListener("click", open4);
    document.querySelector(".closeBtn4").addEventListener("click", close4);
    document.querySelector(".bg4").addEventListener("click", close4);
	</script>
	
	<script>  <!-- 쪽지함jsp, 요청게시판관리, 개인이용정책 등등으로 이동시키는 스크맆트-->
  		document.getElementById("messageboxBtn").addEventListener("click",function(){
      	 	location.href = "<%= request.getContextPath() %>/msgbox.me";
  		}) 
  		
  		 document.getElementById("user-boards").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/reqBoard.me";
	    })
	    
	    document.getElementById("termsOfUse").addEventListener("click",function(){
      	 	location.href = "<%= request.getContextPath() %>/TermsOfUseController.me";
  		}) 
  		
  		document.getElementById("privacyPolicy").addEventListener("click",function(){
      	 	location.href = "<%= request.getContextPath() %>/PrivacyPolicyController.me";
  		}) 
  		
  		document.getElementById("noticeBoard").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/boardDetail.bo?cNo=5";
	    })
	    
	    document.getElementById("teenagerPolicy").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/TeenagerPolicyController.me";
	    })
  	</script>




</body>

</html>