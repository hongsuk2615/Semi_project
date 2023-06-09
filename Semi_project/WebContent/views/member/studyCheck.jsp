<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.khtime.studytime.model.vo.StudyTime" %> 
<% 
	ArrayList <StudyTime> list  = (ArrayList<StudyTime>) request.getAttribute("list");
	ArrayList <StudyTime> sumList  = (ArrayList<StudyTime>) request.getAttribute("sumList");
	int timeAmount = (Integer)request.getAttribute("timeAmount");																			
	int userNo = (Integer)request.getAttribute("userNo");

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
    
            


      <div id="wrapper">
       <%@ include file="../common/header.jsp" %>
        <div id="body">
            <div class="historyTop">
                <div class="historyContainer">
                    <div class="historyTitleText">나의 공부기록</div>
                    <div class="timeContent">
                        <div class="timeBox">
                            <div class="title">목표 시간</div>
                            <div class="timeText" id="targetText">00 : 00 : 00</div>
                        </div>
                        <div class="timeBox">
                            <div class="title">공부 시간</div>
                            <div id='timerBox' class="timerBox">
                                <div id="time" class="timeStudy">00:00:00</div>
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
                        <button class="btn-initiate" id="stopBtn" class="fa fa-stop" aria-hidden="true">종료</button>
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
                                    <td class="studyPercent"><%= s.getTimeAmount()*100 / s.getTargetTime() %>%</td>
                                </tr>
                                 <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="historyRanking">
                        <div class="historyTitleText">누적 공부시간 랭킹</div>
                        <div class="rankingWrapper">
                            <ui>
                            	<% for(StudyTime s : sumList) { %>
                                <li>
                                    <div class="rank"><%= s.getStudyTimeNo() %>위</div>
                                    <div class="name"><%= s.getNickName() %></div>
                                    <div class="time" id="rankingAmount"><%= s.getTimeAmount() %></div>
                                </li>
                                <% } %>
                                
                                
                                
                            </ui>
                        </div>
                    </div>
        
                </div>
                
            </div>    



        </div>
        
    </div>
    
    			<div id="tdl-modal">
                    <div id="modal-wrapper">
                        <div id="modal-head">
                            목표 설정
                        </div>
                        <div id="modal-body">
                            
                            <div class="timeSet"  id="modal-tdl-content">
                                <div id="modal-tdl-text">
                                    시간&nbsp;&nbsp;<input type="text" maxlength="2" placeholder="0" id="hourSet"
                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                </div>
                                <div id="modal-tdl-text">
                                    분&nbsp;&nbsp;<input type="text" maxlength="2" placeholder="0" id="minSet"
                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                </div>
                            </div>                            
                        </div>
                        <div id="modal-footer">
                            <button type="button" id="cancel-btn">취소</button>
                            <button type="button" id="add-btn" class="add-btn">추가</button>
                            
                            
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
        document.getElementById('add-btn').addEventListener('click',function(){
            document.getElementById('tdl-modal').style.visibility = 'hidden';
        })
    </script>  
    
   
        
        <!-- 모달 추가버튼 클릭시 이벤트 -->
        <script>
        	$('#add-btn').click(function(){
        		let sec = $("#hourSet").val()*3600+	$("#minSet").val()*60;
        		console.log(sec);
        		if(get_cookie('targetTime')=="" && sec != 0){
        			document.cookie = 'targetTime='+sec;
        			document.cookie = 'time=0';
        			$('#targetText').html(makeTime(sec));
        		}else if(sec == 0){
        			khalert('목표시간이 0입니다.');
        		}else{
        			khalert('기존 목표시간이 설정돼있습니다.');
        		}
        		
        	})
        	
        </script>
        
        
        <!-- 종료 버튼 클릭 시 쿠키 삭제 이벤트 -->
        <script>
        	$('#stopBtn').click(function(){
        		console.log('종료버튼');
        		insertStudy();
        	})
        
        
        </script>
        
	
	
    <script>
        var starFlag = true;
        $(document).ready(function(){
        /* buttonEvt(); */
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
     // 초단위 숫자값을 넣어주면 00:00:00문자열로 변환 해주는 함수
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

        // start btn
        $("#startbtn").click(function(){
            if(get_cookie('targetTime')==""){
    			khalert('목표시간을 설정해 주세요.');
    		}else{
			if(get_cookie('time')==''){
				document.cookie = 'time=0';
			}else{
				time = get_cookie('time');
			}
			document.cookie='isPause=N';
            if(starFlag){
            $(".fa").css("color","white")
            this.style.color = "white";
            starFlag = false;

            if(time == 0){
                init();
            }
            
            timer = setInterval(function(){
            	 document.cookie='time='+(get_cookie('time')*1+1);
            	 if(get_cookie('targetTime')== get_cookie('time')){
            		 insertStudy();
            	 }
	             let time = get_cookie('time');
	             document.getElementById("time").innerHTML = makeTime(time);
            }, 1000);
            }
    		}
            
        });
        
        
        
     // 쿠키값이 있는지에 따른 목표/공부시간 
        if(get_cookie('targetTime')!=''){
        	$('#targetText').html(makeTime(get_cookie('targetTime')));
        	if(get_cookie('isPause')=='N'){
	        	timer = setInterval(function(){
	                let time = get_cookie('time');
	                
		
	                document.getElementById("time").innerHTML = makeTime(time);
	            }, 1000);
        	}else{
        		let time = get_cookie('time');	
                document.getElementById("time").innerHTML = makeTime(time);
        	}
        }
     
     
     
        // pause btn
        $("#pausebtn").click(function(){
            
            $(".fa").css("color","white")
            this.style.color = "white";
            clearInterval(timer);
            starFlag = true;
            document.cookie='isPause=Y';
            
        });


    </script>

    
	
    <script> 
    $('#mytimeAmount').html(makeTime(<%=timeAmount%>));
    </script>
    
    <!-- 랭킹 누적시간 -->
    
    <script> 
    $('#userRankingAmount').html(makeTime(<%=timeAmount%>));
    </script>
    
    
    <script>
        function insertStudy(){
        	$.ajax({
        		url : '<%=request.getContextPath()%>/studyInsert.bo',
        		data :{ "time" : get_cookie('time') ,      
					   "targetTime" : get_cookie('targetTime')},
        		success : function(result) {
        			if(result){
        				document.cookie = 'time=';
                		document.cookie = 'targetTime=';
                		document.cookie = 'isPause=Y';
                		location.href="<%=request.getContextPath()%>/study.me";
        			}
        		},
        		error : function(){
        			
        		}
        		
        	});
        }
        
        </script>
        
    <script>
    $('.studyTarget').each(function(index,item){
    	$(item).html(makeTime($(item).html()));
    })
    $('.studyAmount').each(function(index,item){
    	$(item).html(makeTime($(item).html()));
    })
    $('.time').each(function(index,item){
    	let sec = $(item).html();
    	$(item).html(makeTime(sec));
    })
    </script>
</body>

</html>