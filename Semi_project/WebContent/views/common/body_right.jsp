<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userId = (String)request.getAttribute("userId") == null ? "" : (String)request.getAttribute("userId"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/body.css">
     <link rel="stylesheet" href="resources/CSS/dDay.css">
     <link rel="stylesheet" href="resources/CSS/base.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset = "UTF-8"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Document</title>
</head>
<body>
    <div id="body-right">
        <div id="search">
                <img src="<%=request.getContextPath()%>/resources/IMG/searchimg.png" alt="searchimg" width="40" height="40" >
                <form action="<%=request.getContextPath()%>/boDetailSearch.do" method="GET" >
                <input type="search" id="search-input" placeholder="전체 게시글의 글을 검색하세요" name="keyword"> 
            	</form>         
        </div>
        <div id="login">
        	<% if(loginUser == null) {%>
            <form >
                <div id="id-wrapper">
                    <img src="<%=request.getContextPath()%>/resources/IMG/idimg.png" alt="idimg" width="40" height="40">
                    <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력하세요" value="<%=userId%>">
                </div>
                <div id="pwd-wrapper">
                    <img src="<%=request.getContextPath()%>/resources/IMG/pwdimg.png" alt="pwdimg" width="40" height="40">
                    <input type="password" id = "loginPwd" name="loginPwd" placeholder="비밀번호를 입력하세요">
                </div>
                <div id="btn-wrapper">

                    <input type="button" onclick="login()" value="로그인">

                    <input type="button" value="회원가입">
                     <% if(userId.isEmpty()) { %>
			           <input type="checkbox" id="keepId">로그인 유지
			         <% }else{ %>
			           <input type="checkbox" id="keepId" checked="checked">로그인 유지
			         <% } %>
                </div>
            </form>
            <% } else { %>
            <div id="loginuser-profile">
            	<div id="loginuser-profileimg">
                    <img src="<%=request.getContextPath()%><%=loginUser.getUserProfile()%>" alt="로그인유저프사">
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
            <table id="board-7">
            	<thead>
	                <tr>
	                    <th>HOT 게시판</th>
	                </tr>
                </thead>
                <tbody>
	                
                </tbody>
            </table>
        </div>
        
        <div id="best-board">
            <table id="board-8">
                <thead>
	                <tr>
	                    <th>BEST 게시판</th>
	                </tr>
                </thead>
                <tbody>
	                
                </tbody>
            </table>
        </div>
    </div>
    
    
    <script>
        $("#board-7 th").click(function(){
        	let date = new Date();
	    	location.href = "<%=request.getContextPath()%>/best.bo?rcCount=9&year="+date.getFullYear();
	    })
	    
	    $("#board-8 th").click(function(){
	    	let date = new Date();
	    	location.href = "<%=request.getContextPath()%>/best.bo?rcCount=99&year="+date.getFullYear();
	    })
    </script>

    <script>
        $(function(){
        function getHotBestBoardList(recommendCount, num){
            $.ajax({
                url : '<%=request.getContextPath()%>/hotBestBoardlist.get',
                type : 'get',
                data : {
                    rcCount : recommendCount,
                    year : new Date().getFullYear()
                },
                success : function(result){
                    if(result.length == 0 ){
                        $('#board-'+num+' tbody').append('<tr>'+
                                                        '<td style="text-align:center">' + '조회된 게시물이 없습니다' + '</td>'+
                                                   '</tr>');
                    } else {
                        for(let i = 0; i < 6 ; i++){
                            if(result[i] != null){
                                $('#board-'+num+' tbody').append('<tr>'+
                                                                '<td>' + result[i].title + '</td>'+
                                                          '</tr>');
                                $('#board-'+num+' tbody>tr').eq(i).click(function(){
                                    location.href = "<%=request.getContextPath()%>/contentDetail.bo?bNo="+result[i].boardNo;
                                })
                            }else {
                                $('#board-'+num+' tbody').append('<tr>'+
                                                                '<td style="text-align:center">' + '-'+ '</td>'+

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
    getHotBestBoardList(9,7);
    getHotBestBoardList(99,8);
 });
    </script>



  
		<!-- [디데이 설정] 모달창 -->
        <div class="modal hidden">
            <div class="bg"></div>
            <div class="modalBox">
				<button class="closeBtn">X</button>
				<div class="header">
					<p>디데이 설정</p>
				</div>
				<div class="body" id="dDayList" style="overflow: auto;">
                    
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
        <script >
        function insertDday(){
        	console.log("저장버튼클릭");
        	
        	$.ajax({
        		url : '<%=request.getContextPath()%>/ddayInsert.bo',
        		data : { "title" : $('#dDayTitle').val() ,      
        				 "dDay" : $('#datepicker').val()
        		},
        		success : function(result){
        			if(result){
        				console.log(result);
        				alert("저장 성공");
        				
        			}else{
        				alert("저장 실패");
        			}
        			
        		},
        		error : function(result){
        			
        		},
        		complete : function(){
        			close1();
        			getDday();
        		}
        		
        	});
        }
        
        </script>
        
        
        
        <script>
        function makeEvent(){
        	$("#dDayTitle").val("");
        	$("#datepicker").val("");
        	document.getElementsByClassName('closeBtn2')[0].removeEventListener('click',insertDday);
	        document.getElementsByClassName('closeBtn2')[0].addEventListener('click',insertDday);
	        
        } 
        
        
    </script>
    
    
    
    <!-- 디데이 자동 스크롤 스크립트 -->
    <script>

		$('#dDayList').scrollTop($('#dDayList').prop('scrollHeight'));

	</script>

    
    <script>
    	function getDday(){
    		$.ajax({
    			url : '<%=request.getContextPath()%>/dday.me',
    			
    			success : function(Dday){
    				console.log(Dday);
    				if(Dday.length == 0){
                        $('#dDayList').html(`
                        		<div class="openBtn2" id="ddayBox">
        						<div>
        							<p class="titleText">디데이 예시</p>
        							<p class="dateText">2023.09.09(일)</p>
        						</div>
        						<div>
        							<p class="ddayText">D-100</p>
        						</div>
        					</div>`);
                    }else{
                    	$('#dDayList').html('');
                    	$(Dday).each(function(index,item){
                    		let dDaySplit = item.dDay.replace('월',',').split(',');
                    		let dDay = dDaySplit[2]+'/'+dDaySplit[0] + '/' +dDaySplit[1];
               				if(Math.ceil((new Date(dDay)-new Date())/1000/60/60/24) > 0){
	                    		$('#dDayList').append(`
	                    				<div class="openBtn2" id="ddayBox\${index}" data-dno="\${item.dDayNo}">
	            						<div>
	            							<p class="titleText">\${item.title}</p>
	            							<p class="dateText">\${item.dDay}</p>
	            						</div>
	            						<div>
	            							<p class="ddayText">D-\${Math.ceil((new Date(dDay)-new Date())/1000/60/60/24)}일</p>
	            						</div>
	            					</div><br>`);
               				}else {
               					$('#dDayList').append(`
	                    				<div class="openBtn2" id="ddayBox\${index}" data-dno="\${item.dDayNo}">
	            						<div>
	            							<p class="titleText">\${item.title}</p>
	            							<p class="dateText">\${item.dDay}</p>
	            						</div>
	            						<div>
	            							<p class="ddayText">종료</p>
	            						</div>
	            					</div><br>`);
               				}
                    		
                    		$('#ddayBox'+index).click(updateDday(item.dDayNo));
                    		
                    	})
                    	
                    	
                    }
    				
    			}
    			
    		})
    		
    	}
    	
    
    </script>
    
    
    
    <script>
   
    function updateEvent(){
    	console.log("저장버튼클릭");
    	$.ajax({
    		url : '<%=request.getContextPath()%>/updateDday.me',
    		data : { "title" : $('#changeTitle').val() ,      
    				 "dDay" : $('#datepicker1').val(),
    				 "dDayNo" : $('#dDayNo').val()
    		},
    		success : function(result){
    			if(result){
    				console.log(result);
    				alert("저장 성공");
    				
    			}else{
    				alert("저장 실패");
    			}
    			
    		},
    		error : function(result){
    			
    		},
    		complete : function(){
    			close2();
    			getDday();
    			$("#changeTitle").val("");
            	$("#datepicker1").val("");
    			
    		}
    		
    	});
    
    }
    
    </script>
    

        <!-- [디데이 설정] 모달창 스크립트 -->
        <script>
            const open = () => {
                document.querySelector(".modal").classList.remove("hidden");
                getDday();
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
						<input type="text" placeholder="디데이를 입력해주세요" id="dDayTitle" class="inputField"/>
					</div>
					<div class="inputBox">
						<p class="inputLabel">디데이 날짜</p>
						<div class="dayChipWrapper">
							<button class="dayChip" id="plus30">30일 뒤</button>
							<button class="dayChip" id="plus100">100일 뒤</button>
							<button class="dayChip" id="plus180">180일 뒤</button>
							<button class="dayChip" id="plus360">360일 뒤</button>
						</div>
						<input type="text" placeholder="디데이 날짜를 선택해주세요" class="inputField" id="datepicker"/>
					</div>
				</div>
				<div class="closeBtn2" id="fullBlueBtn" >
					저장
				</div>
            </div>
        </div>
        
        <!-- 새 디데이 날짜 플러스 버튼 스크립트 -->
        <script>
        	function makeDate(num){
        		let inputDate = new Date();
        		inputDate.setDate(inputDate.getDate() + num);
        		console.log(inputDate);
        		let result = inputDate.getFullYear() +'-' + (inputDate.getMonth()+1) + '-' + inputDate.getDate();
        		return result;
        	}
        	$('#plus30').click(function(){
        		$('#datepicker').val(makeDate(30));
        	})
        	
        	$('#plus100').click(function(){
        		$('#datepicker').val(makeDate(100));
        	})
        	$('#plus180').click(function(){
        		$('#datepicker').val(makeDate(180));
        	})
        	$('#plus360').click(function(){
        		$('#datepicker').val(makeDate(360));
        	})
        
        
        </script>


        <!-- [새 디데이] 모달창 스크립트 -->
        <script>
            const open1 = () => {
                document.querySelector(".modal1").classList.remove("hidden");
                makeEvent();
            }
            const close1 = () => {
                console.log('cdlose')
                document.querySelector(".modal1").classList.add("hidden");
                
            }
            document.querySelector(".openBtn1").addEventListener("click", open1);
            document.querySelector(".closeBtn1").addEventListener("click", close1);
            /* document.querySelector(".closeBtn2").addEventListener("click", function(){
                close1();
                close();
            }); */
            document.querySelector(".bg1").addEventListener("click", function(){
                close1();
                close();
            });
        </script>



        <!-- [디데이 수정] 모달창 -->
        <div class="modal2 hidden">
            <div class="bg2"></div>
            <div class="modalBox">
				<button id="prevBtn" class="closeBtn4"></button>
                <button id="deleteBtn" class="deleteBtn">삭제</button>
				<div class="header">
					<p>디데이 수정</p>
				</div>
				<div class="addDdayBody">
					<div class="inputBox">
						<p class="inputLabel">디데이</p>
						<input type="hidden" id = "dDayNo" name="dDayNo">
						<input type="text" id="changeTitle" placeholder="디데이를 입력해주세요" class="inputField"/>
					</div>
					<div class="inputBox">
						<p class="inputLabel">디데이 날짜</p>
						<div class="dayChipWrapper">
							<button class="dayChip" id="rplus30">30일 뒤</button>
							<button class="dayChip" id="rplus100">100일 뒤</button>
							<button class="dayChip" id="rplus180">180일 뒤</button>
							<button class="dayChip" id="rplus360">360일 뒤</button>
						</div>
						<input type="text" placeholder="디데이 날짜를 선택해주세요" class="inputField" id="datepicker1"/>
					</div>
				</div>
				<div class="closeBtn3" id="fullBlueBtn" >
					저장
				</div>
            </div>
        </div>

		<script>
        function deleteEvent(){ //// 삭제버튼 이벤트함수
        	let dDayNo = $('#dDayNo').val();
            $.ajax({
                url : '<%=request.getContextPath()%>/deleteDday.me',
                data :{dDayNo},
                success : function(result){
                    if(result){
                        alert("삭제성공");
                        getDday();
                        close2();
                    }else{
                        alert("삭제실패");
                        getDday();
                    }
                },
                error : function(){
                console.log('Dday 삭제 ajax요청 실패')
                }
            })      
        }
        </script>
        
        
        <!-- 디데이 수정 날짜 플러스 버튼 스크립트 -->
        <script>
        	function CorrectionMakeDate(num){
        		let inputDate = new Date();
        		inputDate.setDate(inputDate.getDate() + num);
        		console.log(inputDate);
        		let result = inputDate.getFullYear() +'-' + (inputDate.getMonth()+1) + '-' + inputDate.getDate();
        		return result;
        	}
        	$('#rplus30').click(function(){
        		$('#datepicker1').val(makeDate(30));
        	})
        	
        	$('#rplus100').click(function(){
        		$('#datepicker1').val(makeDate(100));
        	})
        	$('#rplus180').click(function(){
        		$('#datepicker1').val(makeDate(180));
        	})
        	$('#rplus360').click(function(){
        		$('#datepicker1').val(makeDate(360));
        	})
        
        
        </script>






        <!-- [디데이 수정] 모달창 스크립트-->
        <script>
        function updateDday(dDayNo){
            const open2 = () => {
                document.querySelector(".modal2").classList.remove("hidden");
                document.getElementById('dDayNo').value = dDayNo;
                
            }
            return open2;
        }
            const close2 = () => {
                console.log('cdlose')
                document.querySelector(".modal2").classList.add("hidden");
            }
            
            document.querySelector(".closeBtn3").addEventListener("click", updateEvent);
            document.querySelector(".deleteBtn").addEventListener("click", deleteEvent);
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
        
        function login(){
    		$.ajax({
				url : "<%=request.getContextPath()%>/login.me",
				type : "post",
				data :{
					loginId :  $("#loginId").val(),
					loginPwd :  $("#loginPwd").val(),
					keepId : $("#keepId").prop('checked') ? 'Y' : 'N',
					userId : "<%=userId%>"
				}, 
				success : function(result){
					switch(result){
					case '0' : alert("아이디나 비번이 맞지 않습니다!"); location.href="<%= request.getContextPath()%>/login.me"; break;
					case '1' : location.href="<%= request.getContextPath()%>"; break;
					case '2' : alert("밴된 유저입니다!"); $("#loginId").val(""); $("#loginPwd").val(""); break;
					case '3' : alert("승인되지않은 아이디입니다!"); $("#loginId").val(""); $("#loginPwd").val(""); break;
					case '4' : alert("탈퇴한 유저입니다!"); $("#loginId").val(""); $("#loginPwd").val(""); break;
					}
				}, error : function(){
					console.log("ajax통신실패")
				}
			})
    	}
        
        document.getElementById("logoutbtn").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath()%>/logout.me";
	    })
	    
	    document.getElementById("realtime-chat").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath()%>/chatting.do";
	    })
	    
	    document.getElementById("check-study-time").addEventListener("click",function(){
	        location.href = "<%= request.getContextPath()%>/study.me";
	    })
	    
	  	 document.getElementById("mypagebtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/myPage.me";
	    })
	    
	     document.getElementById("user-boards").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/myWriting.bo?bType=1";
	    })
	    
	     document.getElementById("user-replys").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/myComments.bo?bType=2";
	    })
	    
	     document.getElementById("user-scraps").addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/myScrap.bo?bType=3";
	    })
        </script>
        <script> //애니메이션 테스트
        $(window).scroll(function(){
          console.log(document.getElementsByTagName('body')[0].scrollHeight-$(window).scrollTop());

            if($(window).scrollTop() > 290 && $('#main-banner').length > 0 ){
                $('#body-right').css('transform','translateY('+($(window).scrollTop()-285)+'px)');
            }else if($(window).scrollTop() > 57 && $('#main-banner').length == 0 ){
                $('#body-right').css('transform','translateY('+($(window).scrollTop()-45)+'px)');
            }
      
        })
      



        </script>
</body>
</html>