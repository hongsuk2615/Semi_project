
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/body.css">
     <link rel="stylesheet" href="resources/CSS/dDay.css">
    <title>Document</title>
</head>
<body>
    <div id="body-right">
        <div id="search">
                <img src="<%=request.getContextPath()%>/resources/IMG/searchimg.png" alt="searchimg" width="40" height="40">
                <input type="search" id="search-input" placeholder="전체 게시글의 글을 검색하세요">         
        </div>
        <div id="login">
        	<% if(loginUser == null) {%>
            <form action="<%= request.getContextPath() %>/login.me" method="post">
                <div id="id-wrapper">
                    <img src="<%=request.getContextPath()%>/resources/IMG/idimg.png" alt="idimg" width="40" height="40">
                    <input type="text" name="login-id" placeholder="아이디를 입력하세요">
                </div>
                <div id="pwd-wrapper">
                    <img src="<%=request.getContextPath()%>/resources/IMG/pwdimg.png" alt="pwdimg" width="40" height="40">
                    <input type="password" name="login-pwd" placeholder="비밀번호를 입력하세요">
                </div>
                <div id="btn-wrapper">

                    <input type="submit" value="로그인">

                    <input type="button" value="회원가입">
                </div>
            </form>
            <% } else { %>
            <div id="loginuser-profile">
            	<div id="loginuser-profileimg">
                    <img src="/Semi_project/resources/IMG/user.png" alt="로그인유저프사">
                </div>
                <div id="loginuser-nickname"><%=loginUser.getNickName() %></div>
                <div id="loginuser-name"><%=loginUser.getUserName() %></div>
                <div id="loginuser-id"><%=loginUser.getUserId() %></div>
                <div id="loginuser-btn">
                    <button id="logoutbtn">로그아웃</button>
                    <button id="mypagebtn">마이페이지</button>
                </div>
            
            
            </div>
            <% } %>
        </div>
        <% if(loginUser != null) {%>
        <div id="user-list">
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/free-icon-billboard-773665.png" alt="" width="20" height="20">
                <div id="user-boards">내가 쓴글</div>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/replyimg.png" alt="" width="20" height="20">
                <div id="user-replys">내가 쓴 댓글</div>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/scrapimg.png" alt="" width="20" height="20">
                <div id="user-scraps">스크랩한 글</div>
            </div>
        </div>
  
        <div id="additional-functions">
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/free-icon-live-chat-5603000.png" alt="" width="20" height="20">
                <div id="realtime-chat">실시간 채팅</div>
            </div>
            <div class="openBtn">
                <img src="<%=request.getContextPath()%>/resources/IMG/free-icon-letter-d-5069823.png" alt="" width="20" height="20">
                <div id="d-day">d-day알림</div>
            </div>
            <div>
                <img src="<%=request.getContextPath()%>/resources/IMG/stopwatch.png" alt="" width="20" height="20">
                <div id="check-study-time">공부량 체크</div>
            </div>
        </div>
        <% } %>
        <div id="hot-board">
            <table id="board-5">
                <tr>
                    <th>HOT 게시판</th>
                </tr>
                <tr>
                    <td>게시물 제목1</td>
                </tr>
                <tr>
                    <td>게시물 제목2</td>
                </tr>
                <tr>
                    <td>게시물 제목3</td>
                </tr>
                <tr>
                    <td>게시물 제목4</td>
                </tr>
                <tr>
                    <td>게시물 제목5</td>
                </tr>
                <tr>
                    <td>게시물 제목6</td>
                </tr>
            </table>
        </div>
        <div id="best-board">
            <table id="board-6">
                <tr>
                    <th>BEST 게시판</th>
                </tr>
                <tr>
                    <td>게시물 제목1</td>
                </tr>
                <tr>
                    <td>게시물 제목2</td>
                </tr>
                <tr>
                    <td>게시물 제목3</td>
                </tr>
                <tr>
                    <td>게시물 제목4</td>
                </tr>
                <tr>
                    <td>게시물 제목5</td>
                </tr>
                <tr>
                    <td>게시물 제목6</td>
                </tr>
            </table>
        </div>
    </div>
  
		<!-- [디데이 설정] 모달창 -->
        <div class="modal hidden">
            <div class="bg"></div>
            <div class="modalBox">
				<button class="closeBtn">X</button>
				<div class="header">
					<p>디데이 설정</p>
				</div>
				<div class="body">
                    
					<div class="openBtn2" id="ddayBox">
						<div>
							<p class="titleText">디데이 예시</p>
							<p class="dateText">2023.09.09(일)</p>
						</div>
						<div>
							<p class="ddayText">D-100</p>
						</div>
					</div>
                
				</div>
				<div class="fotter">
					<div class="openBtn1" id="blueBtn">
						+ 추가
					</div>
				</div>
            </div>
        </div>

        <!-- [디데이 설정] 모달창 스크립트 -->
        <script>
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




		<!-- [새 디데이] 모달창 -->
        <div class="modal1 hidden">
            <div class="bg1"></div>
            <div class="modalBox">
				<button id="prevBtn" class="closeBtn1"><</button>
				<div class="header">
					<p>새 디데이</p>
				</div>
				<div class="addDdayBody">
					<div class="inputBox">
						<p class="inputLabel">디데이</p>
						<input type="text" placeholder="디데이를 입력해주세요" class="inputField"/>
					</div>
					<div class="inputBox">
						<p class="inputLabel">디데이 날짜</p>
						<div class="dayChipWrapper">
							<button class="dayChip">30일 뒤</button>
							<button class="dayChip">100일 뒤</button>
							<button class="dayChip">180일 뒤</button>
							<button class="dayChip">360일 뒤</button>
						</div>
						<input type="text" placeholder="디데이 날짜를 선택해주세요" class="inputField" id="datepicker"/>
					</div>
				</div>
				<div class="closeBtn2" id="fullBlueBtn" >
					저장
				</div>
            </div>
        </div>


        <!-- [새 디데이] 모달창 스크립트 -->
        <script>
            const open1 = () => {
                document.querySelector(".modal1").classList.remove("hidden");
            }
            const close1 = () => {
                console.log('cdlose')
                document.querySelector(".modal1").classList.add("hidden");
            }
            document.querySelector(".openBtn1").addEventListener("click", open1);
            document.querySelector(".closeBtn1").addEventListener("click", close1);
            document.querySelector(".closeBtn2").addEventListener("click", function(){
                close1();
                close();
            });
            document.querySelector(".bg1").addEventListener("click", function(){
                close1();
                close();
            });
        </script>



        <!-- [디데이 수정] 모달창 -->
        <div class="modal2 hidden">
            <div class="bg2"></div>
            <div class="modalBox">
				<button id="prevBtn" class="closeBtn4"><</button>
                <button id="deleteBtn" class="deleteBtn">삭제</button>
				<div class="header">
					<p>디데이 수정</p>
				</div>
				<div class="addDdayBody">
					<div class="inputBox">
						<p class="inputLabel">디데이</p>
						<input type="text" placeholder="디데이를 입력해주세요" class="inputField"/>
					</div>
					<div class="inputBox">
						<p class="inputLabel">디데이 날짜</p>
						<div class="dayChipWrapper">
							<button class="dayChip">30일 뒤</button>
							<button class="dayChip">100일 뒤</button>
							<button class="dayChip">180일 뒤</button>
							<button class="dayChip">360일 뒤</button>
						</div>
						<input type="text" placeholder="디데이 날짜를 선택해주세요" class="inputField" id="datepicker1"/>
					</div>
				</div>
				<div class="closeBtn3" id="fullBlueBtn" >
					저장
				</div>
            </div>
        </div>

        <!-- [디데이 수정] 모달창 스크립트-->
        <script>
            const open2 = () => {
                document.querySelector(".modal2").classList.remove("hidden");
            }
            const close2 = () => {
                console.log('cdlose')
                document.querySelector(".modal2").classList.add("hidden");
            }
            document.querySelector(".openBtn2").addEventListener("click", open2);
            document.querySelector(".closeBtn3").addEventListener("click", close2);
            document.querySelector(".deleteBtn").addEventListener("click", close2);
            document.querySelector(".closeBtn4").addEventListener("click", function(){
                close1();
                close2();
            });
            document.querySelector(".bg2").addEventListener("click", function(){
                close1();
                close2();
                close();
            });
        </script>

        <!-- 새 디데이 달력 스크립트 -->
        <script>
        $(function () {
        $("#datepicker").datepicker({ dateFormat: "yy-mm-dd" });
        });
        </script>
        <script>
        $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
        });
        $(function() {
        $("#datepicker").datepicker();
        });
        </script>

        <!-- 디데이 수정 달력 스크립트 -->
        <script>
            $(function () {
            $("#datepicker1").datepicker({ dateFormat: "yy-mm-dd" });
            });
            </script>
            <script>
            $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
            });
            $(function() {
            $("#datepicker1").datepicker();
            });
        </script>
        
        <!-- 페이지이동스크립트 -->
        <script>
        
        document.getElementById("logoutbtn").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath()%>/logout.me";
	    })
	    
	    document.getElementById("check-study-time").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath()%>/study.me";
	    })
	    
	  	 document.getElementById("mypagebtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/myPage.me";
	    })
        </script>

</body>
</html>