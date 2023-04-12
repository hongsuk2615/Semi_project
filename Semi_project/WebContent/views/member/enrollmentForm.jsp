<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String alertMsg = (String)request.getSession().getAttribute("alertMsg"); %>   
<!DOCTYPE html>
<html lang="en">
	
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/enrollment.css">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Document</title>
    <style>
      .input-form {
      max-width: 680px;
      margin-top: 80px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
        body {
       width:100%;
       height:100%;
       margin: 0;
        padding-top: 80px;
        padding-bottom: 40px;
        font-family: "Nanum Gothic", arial, helvetica, sans-serif;
        background-repeat: no-repeat;
        background:linear-gradient(to bottom right, white, #6BA8D1);
   }
       /*   * {
        border: 1px solid rgba(128, 128, 128, 0.568);
         } */
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
        }
         #btn btn-primary{
      		height: 20px;
     		align-items: center;     
    }
    </style>
</head>

<body>
    <% if(alertMsg != null){ %>
    	
    	<script>
    		alert("<%= alertMsg %>");
    	</script>
    	<% session.removeAttribute("alertMsg");%>
    	
    <% } %>
    <div id="wrapper">
     <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto"  style="display:flex; justify-content: center;">
        <div id="enrollment-wrapper">
            <div>
                <img src="resources/IMG/로고이미지.png" style="width: 100px; height: 100px;">
            </div>
            <div>
                <b style="font-size: xx-large;">KH TIME에 오신걸 환영합니다.</b>
            </div>
            <div>
                <b style="color: darkgray;">KH TIME은 개발자를 위한 지식 공유 플랫폼입니다.</b>
            </div>
            <br><br>
            <div style="display: flex; align-items: center;">
                <div>
                    <hr style="width: 80px; height:1px; background-color: black;">
                </div>
                <div><b>&nbsp회원가입에 필요한 기본정보를 입력해주세요.&nbsp</b></div>
                <div>
                    <hr style="width: 80px; height:1px; background-color: black;">
                </div>
            </div>
            <br>
            <div id="form-wrapper">
                <form action="enroll.me" method="post" enctype="multipart/form-data">
                    <div id="enrollimg">
                        이미지나 사진을 등록해주세요.<br><br>
                        <div>
                            <img id="titleImg" width="150" height="150">
                        </div><br>
                        <div id="file-area" style="border: 1px solid black">
                           <input type="file" id="file1" name="file" onchange="loadImg(this, 1);"> 
                        </div>
                    </div><br>
                     <hr style=" background-color: black;">
                    강사/학생<br>
                    <div>
                        <div>
                            <div><input type="radio" name="TeacherStudent" id="teacher" value="1">
                                <label for="teacher"><b  style="font-size: larger;">강사&nbsp&nbsp&nbsp&nbsp&nbsp</b></label>
                            </div>
                            <div><input type="radio" name="TeacherStudent" id="student" value="2">
                                <label for="student"><b  style="font-size: larger;">학생</b></label>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div id="info">
                        아이디 <br>
                        <input placeholder="특수문자 제외  영문 , 숫자 5~12글자로 작성하세요. " type="text" name="userId" id="userId"
                            required>
                        <button type="button" class="btn btn-primary" onclick="idCheck();" >중복확인</button>
                        <br><br>
                        <div style="width: 200px; height: 15px;"></div><br>

                        비밀번호 <br>
                       <input type="password" name="userPwd" id="userPwd1" placeholder="영문, 숫자, 특수문자 포함 8자 이상"   required>
                        <br><span  id="passwordid"></span>
                        <br><br>
                        비밀번호 확인 <br>
                        <input placeholder="비밀번호와 일치하게 작성하세요" type="password" name="userPwd2" id="userPwd2"  required>
                        <br><span  id="passwordid3"></span>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        이름 <br>
                        <input type="text" name="userName" id="userName"  placeholder="한글(결합)로만 2글자이상"required>
                        <br><span  id="passwordid2"></span>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        닉네임 <br>
                        <input type="text" name="nick-name" id="nickname" required>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        이메일 <br>
                        <input placeholder="이메일 형식에 맞게 입력하세요" type="email" name="email" id="email">
                        <button type="button" class="btn btn-primary" onclick="emailCheck();" >중복확인</button>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        반이름 &nbsp&nbsp
                        <select name="class">
                            <option value="selected">반선택</option>
                            <option value="A반">A반</option>
                            <option value="B반">B반</option>
                            <option value="C반">C반</option>
                        </select>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>
                    </div>
                    <b>약관동의</b><br><br>
                   <div class="checkbox_group">

					  <input type="checkbox" id="check_all" >
					  <label for="check_all">전체 동의</label>
					  <br>
					  <input type="checkbox" id="check_1" class="normal" >
					  <label for="check_1">개인정보 처리방침 동의(필수)</label>
					<div style="overflow:scroll; width:400px; height:100px;">
						<p  style="font-size:small;">
						민감정보 또는 고유식별정보*를 처리하기 위해서는 정보주체의
						별도 동의가 필요합니다. 다만, 법령에서 민감정보 또는 고유식별
						정보의 처리를 요구하거나 허용하는 경우에는 동의를 받지 않고
						개인정보의 수집 이용이 가능합니다.
						* 주민등록번호는 법률·대통령령·국회규칙·대법원규칙·헌법재판소규칙·중앙선거
						관리위원회 규칙·감사원규칙에 근거가 있거나 정보주체 또는 제3자의 급박한
						생명, 신체, 재산의 이익을 위하여 명백히 필요한 경우에만 수집․이용 가능
						</p>
					</div>
					  <br>
					  <input type="checkbox" id="check_2" class="normal" >
					  <label for="check_2">서비스 이용약관 동의(필수)</label>
					  	<div style="overflow:scroll; width:400px; height:100px;">
						<p  style="font-size:small;">
						민감정보 또는 고유식별정보*를 처리하기 위해서는 정보주체의
						별도 동의가 필요합니다. 다만, 법령에서 민감정보 또는 고유식별
						정보의 처리를 요구하거나 허용하는 경우에는 동의를 받지 않고
						개인정보의 수집 이용이 가능합니다.
						* 주민등록번호는 법률·대통령령·국회규칙·대법원규칙·헌법재판소규칙·중앙선거
						관리위원회 규칙·감사원규칙에 근거가 있거나 정보주체 또는 제3자의 급박한
						생명, 신체, 재산의 이익을 위하여 명백히 필요한 경우에만 수집․이용 가능
						</p>
					</div>
					  <br>
					  <input type="checkbox" id="check_3" class="normal" >
					  <label for="check_3">마케팅 수신 동의</label>
					  	<div style="overflow:scroll; width:400px; height:100px;">
						<p  style="font-size:small;">
						민감정보 또는 고유식별정보*를 처리하기 위해서는 정보주체의
						별도 동의가 필요합니다. 다만, 법령에서 민감정보 또는 고유식별
						정보의 처리를 요구하거나 허용하는 경우에는 동의를 받지 않고
						개인정보의 수집 이용이 가능합니다.
						* 주민등록번호는 법률·대통령령·국회규칙·대법원규칙·헌법재판소규칙·중앙선거
						관리위원회 규칙·감사원규칙에 근거가 있거나 정보주체 또는 제3자의 급박한
						생명, 신체, 재산의 이익을 위하여 명백히 필요한 경우에만 수집․이용 가능
						</p>
					</div>
					</div>
                    <br><br>
                    <div id="enrollbutton">
                        <div> <button type="submit" class="btn btn-primary"  onclick="return validate();" value="회원가입" >회원가입</button></div> 
                        <div> <button type="button" class="btn btn-primary" onClick="window.location.reload()" >취소</button></div>               
                    </div>
                </form>
                </div>
                </div>
            </div>
        </div>
    </div>
        	<script>
        	
	        	$(".checkbox_group").on("click", "#check_all", function () {
	        	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	        	});
	
	        	// 체크박스 개별 선택
	        	$(".checkbox_group").on("click", ".normal", function() {
	        	    var is_checked = true;
	
	        	    $(".checkbox_group .normal").each(function(){
	        	        is_checked = is_checked && $(this).is(":checked");
	        	    });
	
	        	    $("#check_all").prop("checked", is_checked);
	        	});	
        	
				$(function() {
					$("#titleImg").click(function() {
						$("#file1").click();
					})
					/* $("#contentImg1").click(function(){
						$("#file2").click();
					})
					$("#contentImg2").click(function(){
						$("#file3").click();
					})
					$("#contentImg3").click(function(){
						$("#file4").click();
					}) */
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
				 function idCheck(){
					 // 아이디를 입력하는 input요소 얻어오기
					 let inputId = document.getElementById("userId").value;
					 
					   let regExp = /^[a-zA-Z][a-zA-Z0-9]{4,11}$/;	            
					 console.log(inputId);
					 // 비동기 요청 보내기
					  $.ajax({
						 url : "<%= request.getContextPath()%>/idCheck.me",
						 data : {userId : inputId},
						 success : function(result){
							 console.log(result);
							 if(result.isId){
							 	alert("이미 존재하거나 회원 탈퇴한 아이디입니다.");
							 	document.getElementById("userId").focus();
							 }else if(!regExp.test(inputId)){
								 alert("유효한 아이디를 입력해주세요");
								 inputId = "";
								 document.getElementById("userId").focus();
					             return false;
							 }else{
								 
								 if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
									 //아이디값 수정할수 없게 막기
									 document.getElementById("userId").readOnly = true;
									 //회원가입 버튼 활성화
									 document.getElementById("idEnrollment").disabled = false;
								 }else{
									 document.getElementById("userId").value = "";
									 document.getElementById("userId").focus();
								 }
							 }
							 
						 },
						 error : function(){
							 console.log("아이디 중복체크 실패");
						 } 
						 
						 
						 
					 });
				 }
				
				 function emailCheck(){
					 // 아이디를 입력하는 input요소 얻어오기
					 let emailval = document.getElementById("email").value;
					 // 비동기 요청 보내기
					  $.ajax({
						 url : "<%= request.getContextPath()%>/idCheck.me",
						 type : "post",
						 data : {email : emailval},
						 success : function(result){
							 if(result == true){
							alert("이미 존재하는 이메일 입니다.");
							 }else{
								 alert("사용가능한 이메일 입니다.");
							 }
						 },
						 error : function(){
							 console.log("이메일 중복체크 실패");
						 } 
					 });
				 }
				
				 function validate(){
			            
			            // 유효섬 검사 목록 : id , password, name
			            // input 요소 객체들 가져다 놓기
			           
			           /*  let userPwd1 = document.getElementById("userPwd1"); */
			            let userPwd2 = document.getElementById("userPwd2");
			            let userName = document.getElementById("userName");
			            let nickname = document.getElementById("nickname");
			            let email = document.getElementById("email");
				      	let checkbox1 = document.getElementById('check_1');
				      	let checkbox2 = document.getElementById('check_2');
			            
			            // 1) 아이디 값 검사
			            // 첫글자 영문자, 영문자, 숫자로만 총 4~12글자로 이루어져야한다       
			            //5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
			            /*
			            let userId = document.getElementById("id값");
			            let regExp=/^[a-z0-9!_-]{5,20}$/i;
			             if(!regExp.test(Id값.value)){
			                alert("유효한 아이디를 입력해주세요");
			                id값.select();
			                return false;
			            }
			            */     
			         
			            // 2) 비밀번호 검사
			            //    영문자(대소문자), 숫자, 특수문자로 이루어진 총 8~15글자
			            let regExp = /^[a-z0-9!@#$%^]{8,15}$/i;
			             if(!regExp.test(userPwd1.value)){
			                alert("유효한 비밀번호를 입력해주세요");
			                userPwd1.value = "";
			                userPwd1.select();
			                return false;
			            } 
			            
			            
			            // 3) 비밀번호 일치확인
			            if(userPwd1.value !== userPwd2.value){
			                alert("동일한 비밀번호를 입력해주세요.");
			                userPwd2.value = "";
			                uesrPwd2.select();
			                return false;
			            }
			           // 4) 이름검사
			            //    한글(결합)로만 2글자이상
			            regExp = /^[가-힣]{2,}$/;
			            if(!regExp.test(userName.value)){
			                alert("유효한 이름을 입력해주세요");
			                userName.select();
			                return false;
			            } 
			            
			            regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			            if(!regExp.test(email.value)){
			                alert("유효한 이메일을 입력해주세요");
			                email.select();
			                return false;
			            }
						
			      	  // 2. checked 속성을 체크합니다.
			  		    if(document.getElementById("check_1").checked && document.getElementById("check_2").checked) {
			  		    	return true;	    	
						}else{
							alert("필수 항목에 동의해주세요")	
							return false;
						}
						}
					 $("#userPwd1").keyup(function () {
					 let regExp = /^[a-z0-9!@#$%^]{8,15}$/i;
		                if (regExp.test($("#userPwd1").val())) {
		                    $("#passwordid").html("알맞은 비밀번호 입니다.").css("color","green");
		                }
		                else{
		                    $("#passwordid").html("알맞은 비밀번호를 입력해주세요").css("color","red");
		                }
		            })
		            	  	 $("#userPwd2").keyup(function () {
		                if (userPwd1.value !== userPwd2.value) {
		                	 $("#passwordid3").html("동일한 비밀번호를 입력하세요.").css("color","red");
		                }
		                else{
		                    $("#passwordid3").html("알맞은 비밀번호를 입력하셨습니다").css("color","green");
		                }
		            })
		            	 $("#userName").keyup(function () {
		            		  regExp = /^[가-힣]{2,}$/;
		                if (regExp.test($("#userName").val())) {
		                    $("#passwordid2").html("알맞은 이름 입니다.").css("color","green");
		                }
		                else{
		                    $("#passwordid2").html("알맞은 이름을 입력해주세요").css("color","red");
		                }
		            })
		            
			</script>

</body>

</html>