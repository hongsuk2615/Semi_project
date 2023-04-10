<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.khtime.studytime.model.vo.StudyTime" %> 
<% 
	ArrayList <StudyTime> list  = (ArrayList<StudyTime>) request.getAttribute("list");
	int timeAmount = (Integer)request.getAttribute("timeAmount");																			
																			

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/body.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/studyCheck.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <title>KH_TIME 메인페이지</title>
</head>
<style>
    * {
        /* border: 1px solid rgba(128, 128, 128, 0.568); */
    }
    
   
   
</style>

<body>
    
            <%@ include file="../common/header.jsp" %>


      <div id="wrapper">
        <div id="header">
            <div id="header-content">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
                <div id="navbar">
                    <div>게시판</div>
                    <div>친구목록</div>
                    <div>중고책방</div>
                    <div>To Do List</div>
                    <div>관리</div>
                </div>
                <div id="header-right">
                    <button id="login-btn">로그인</button>
                    <button id="enrollment-btn">회원가입</button>
                </div>
            </div>


        </div>


        <div id="body">
            <div class="historyTop">
                <div class="historyContainer">
                    <div class="historyTitleText">홍길동 님의 공부기록</div>
                    <div class="timeContent">
                        <div class="timeBox">
                            <div class="title">목표 시간</div>
                            <div class="timeText">00 : 00 : 00</div>
                        </div>
                        <div class="timeBox">
                            <div class="title">공부 시간</div>
                            <div id='timerBox' class="timerBox">
                                <div id="time" class="time">00:00:00</div>
                            </div>
                        </div>
                        <div class="timeBox">
                            <div class="title">전체 공부 시간</div>
                            <div class="timeText" id="mytimeAmount"></div>
                        </div>
                    </div>
                    <div class="buttonWrapper">
                        <button class="btn-progress" id="startbtn" class="fa fa-play" aria-hidden="true">시작</button>
                        <button id="pausebtn" class="fa fa-pause" aria-hidden="true">중단</button>
                        <button class="btn-initiate" id="stopbtn" class="fa fa-stop" aria-hidden="true">종료</button>
                    </div>
                </div>
            </div>
            <div class="historyBody">
                <div class="historyContainer">
                    <div class="timearea">
                        <div>목표 공부시간을 설정해보세요.</div>
                        <button id="tdl-btn-add">설정</button>
                    </div>
                    <div class="myHistory">
                        <div class="historyTitleText">나의 공부 기록</div>
                        <table class="historyTable">
                            <colgroup>
                                <col width="5%"> 
                                <col width="20%">
                                <col width="20%">
                                <col width="25%">
                            </colgroup> 
                            <thead>
                                <tr>
                                    <th>번호</th> 
                                    <th>목표시간</th>
                                    <th>공부시간</th> 
                                    <th>목표시간 달성률</th>
                                </tr>
                            </thead> 
                            <tbody>
                            <% for(StudyTime s : list) { %>
                                <tr>
                                    <td class="timeNo"><%= s.getStudyTimeNo() %></td>
                                    <td class="studyTarget"><%= s.getTargetTime() %></td>
                                    <td class="studyAmount"><%= s.getTimeAmount() %></td>
                                    <td class="studyPercent"></td>
                                </tr>
                                 <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="historyRanking">
                        <div class="historyTitleText">누적 공부시간 랭킹</div>
                        <div class="rankingWrapper">
                            <ui>
                                <li>
                                    <div class="rank">4위</div>
                                    <div class="name">둘리</div>
                                    <div class="time">04:42:13</div>
                                </li>
                                <li>
                                    <div class="rank">0위</div>
                                    <div class="name">홍길동</div>
                                    <div class="time">00:00:00</div>
                                </li>
                            </ui>
                        </div>
                    </div>
        
                </div>
                
            </div>    



        </div>
        
    </div>
    
    
   <!--  <div class="modal hidden">
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
        </div> -->
    
    <div id="tdl-modal">
                    <div id="modal-wrapper">
                        <div id="modal-head">
                            목표 설정
                        </div>
                        <div id="modal-body">
                            
                            <div id="modal-tdl-content">
                                <div id="modal-tdl-text">
                                    시간&nbsp;&nbsp;<input type="text" maxlength="2" placeholder="0">
                                </div>
                                <div id="modal-tdl-text">
                                    분&nbsp;&nbsp;<input type="text" maxlength="2" placeholder="0">
                                </div>
                            </div>                            
                        </div>
                        <div id="modal-footer">
                            <button type="button" id="cancel-btn">취소</button>
                            <button type="button" id="add-btn">추가</button>
                            
                            
                        </div>
                    </div>

                </div>
    
    <script>
        document.getElementById('tdl-btn-add').addEventListener('click',function(){
            document.getElementById('tdl-modal').style.visibility = 'visible';
        })
        document.getElementById('cancel-btn').addEventListener('click',function(){
            document.getElementById('tdl-modal').style.visibility = 'hidden';
        })
    </script>  
    
    
    <script>
    	function targetStudyTime(){
    		$.ajax
    	}
    
    
    
    </script>
        
    


	<!-- <script>
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
        </script> -->


    
    <script>
        var time = 0;
        var starFlag = true;
        $(document).ready(function(){
        buttonEvt();
        });

        function init(){
        document.getElementById("time").innerHTML = "00:00:00";
        }
        function get_cookie(key) { 
            let cookie_list = document.cookie.split("; ");
            console.log(cookie_list);
            for(i of cookie_list){
            	console.log("i:" + i);
            	   if(i.split("=")[0] == key){
            	          return(i.split("=")[1]);
            	      }
            	   
            }
            return "";
        }

        function buttonEvt(){
        var hour = 0;
        var min = 0;
        var sec = 0;
        var timer;
		
        
        // start btn
        $("#startbtn").click(function(){
			if(get_cookie('time')==''){
				document.cookie = 'time=0';
			}else{
				time = get_cookie('time');
			}
			
            if(starFlag){
            $(".fa").css("color","white")
            this.style.color = "white";
            starFlag = false;

            if(time == 0){
                init();
            }
            
            timer = setInterval(function(){
                time++;
                
                // let ratio = basetime/purposetime*100;
                // console.log(ratio);
                // document.getElementsByClassName("progress-bar")[0].style.width = ratio + "%";
				
                document.cookie='time='+time;
                min = Math.floor(time/60);
                hour = Math.floor(min/60);
                sec = time%60;
                min = min%60;

                var th = hour;
                var tm = min;
                var ts = sec;
                if(th<10){
                th = "0" + hour;
                }
                if(tm < 10){
                tm = "0" + min;
                }
                if(ts < 10){
                ts = "0" + sec;
                }
	
                document.getElementById("time").innerHTML = th + ":" + tm + ":" + ts;
            }, 1000);
            }
        });

        // pause btn
        $("#pausebtn").click(function(){
            if(time != 0){
            $(".fa").css("color","white")
            this.style.color = "white";
            clearInterval(timer);
            starFlag = true;
            }
        });

        // stop btn
        $("#stopbtn").click(function(){
        	<%-- $.ajax({
        		url : '<%=request.getContextPath()%>/timeSave.bo',
        		data : {time : get_cookie('time')},
        		success : function(){
        			
        			
        		}
        			
        			
        			
        			
        		
        		
        		
        	}); --%>
        	
            if(time != 0){
            $(".fa").css("color","white")
            this.style.color = "white";
            clearInterval(timer);
            starFlag = true;
            time = 0;
            init();
            }
            
            
            
            
        });
        }
		
    </script>

    <script>
        // $("#startbtn").click(function(){
        //     $("progress-bar").addClass(".")


        // })
       


    </script>

	<!-- <script>
        const btnProgressElem = document.querySelector('.btn-progress');
        const btnInitiateElem = document.querySelector('.btn-initiate');
        const progressBarElem = document.querySelector('.progress-bar__bar');
        btnProgressElem.addEventListener('click', () => {
            progressBarElem.classList.add('active');
        })
        btnInitiateElem.addEventListener('click', () => {
            progressBarElem.classList.remove('active');
        })
    </script> -->
    <script> // 초단위 숫자값을 넣어주면 00:00:00문자열로 변환 해주는 함수
    	function makeTime(timeAmount){
    	let totalTime = timeAmount;
    	console.log(totalTime);
    	let hour = Math.floor(totalTime/60/60)+'';
    	let min = Math.floor(totalTime%3600/60)+'';
    	console.log(hour);
    	console.log(hour.length);
    	let sec = totalTime%60+'';
    	if(hour.length == 1){
    		hour = '0'+hour;
    	}
    	if(min.length == 1){
    		min = '0'+min;
    	}
    	if(sec.length == 1){
    		sec = '0'+sec;
    	}
    	console.log(hour +':'+min +':'+sec);
    	return hour +':'+min +':'+sec;
    
    }
    $('#mytimeAmount').html(makeTime(<%=timeAmount%>));
    
    
    
    
    </script>
    
    <script>
    $('.studyTarget').each(function(index,item){
    	$(item).html(makeTime($(item).html()));
    })
    $('.studyAmount').each(function(index,item){
    	$(item).html(makeTime($(item).html()));
    })
    </script>


</body>

</html>