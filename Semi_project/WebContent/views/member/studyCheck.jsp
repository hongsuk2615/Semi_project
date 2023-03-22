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
    <link rel="stylesheet" href="resources/CSS/studyCheck.css">
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
                    <div class="historyTitleText">홍길동 님의 공부기록</div>
                    <div class="timeContent">
                        <div class="timeBox">
                            <div class="title">목표 시간</div>
                            <div class="timeText">00 : 00 : 00</div>
                        </div>
                        <div class="timeBox">
                            <div class="title">공부 시간</div>
                            <div class="timeText">00 : 00 : 00</div>
                        </div>
                        <div class="timeBox">
                            <div class="title">전체 공부 시간</div>
                            <div class="timeText">00 : 00 : 00</div>
                        </div>
                    </div>
                    <div class="buttonWrapper">
                        <button class="openBtn">시작</button>
                        <button>중단</button>
                        <button>종료</button>
                    </div>
                </div>
            </div>
            <div class="historyBody">
                <div class="historyContainer">
                    <div class="timearea">
                        <div>목표 공부시간을 설정해보세요.</div>
                        <button>설정</button>
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
                                <tr>
                                    <td>1</td>
                                    <td>07 : 00 : 00</td>
                                    <td>04 : 42 : 13</td>
                                    <td>65%</td>
                                </tr>
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


        <div id="footer">



        </div>
    </div>


    <div class="modal hidden">
        <div class="bg"></div>
        <div class="modalBox">
            <div class="header">
                <h2>공부 시작</h2>
            </div>
            <div class="addDdayBody">
                <div class="inputBox">
                    <h4>공부를 시작하시겠습니까?</h4>
                    <div id="fullBlueBtn">
                        <button id="startBtn">확인</button>
                        <button class="closeBtn" id="cancelltBtn">취소</button>
                    </div>
                </div>
            </div>
            
        </div>
    </div>





    
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




</body>

</html>