<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.khtime.member.model.vo.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");	
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
    <link rel="stylesheet" href="resources/CSS/messagebox.css">
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/sendmessagemodal.css">
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
    <title>document</title>
</head>
<style>

</style>

<body>
 	<script>
      const msg = "<%= request.getSession().getAttribute("alertMsg") %>";
      
      if(msg != "null") { // "성공적으로 로그인이 되었습니다" / "null"
         alert(msg);
         // 알람창을 띄워준 후 session에 담긴 메세지는 지워줘야함
         // 안그러면 menubar.jsp가 로딩될때마다 매번 alert함수가 실행됨
         <% request.getSession().removeAttribute("alertMsg");%>
         
      }
   	</script>
    <div id="wrapper">
    <!-- 네비영역 헤더-->
		<%@ include file="../common/header.jsp"%>
        <div id="body">
            <div id="content">
                <div id="content1">
                    <div id="messagebox3"> <b style="font-size: xx-large;">쪽지함</b></div>
                    <div id="messagecheck">
                    	
                        <%for(Member m : list) {%>
                        <div id="date">
                            <div><%= m.getNickName() %></div>
                            <div><%= m.getUserNo() %></div>
                        </div>
                        <div id="text"><%=m.getUserNo() %></div>
                        <% } %>
                        
                        
                        
                    </div>
                </div>
                <div id="content2">
                    <div id="messagesend">
                        <div><b style="font-size: xx-large;">교류하는사람 닉네임</b></div>
                        <div id="newfix">
                            <div><button class="openBtn">쪽지보내기</button></div>
                            <div><button>새로고침</button></div>
                        </div>
                    </div>
                    <div id="messagecheck2">
                        <div id="receivemessage">
                            <div>받은쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="receivetext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        
                        <div id="sentmessage">
                            <div>보낸쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="sendtext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="receivemessage">
                            <div>받은쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="receivetext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="sentmessage">
                            <div>보낸쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="sendtext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="receivemessage">
                            <div>받은쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="receivetext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="sentmessage">
                            <div>보낸쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="sendtext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="receivemessage">
                            <div>받은쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="receivetext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="sentmessage">
                            <div>보낸쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="sendtext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="receivemessage">
                            <div>받은쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="receivetext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        <div id="sentmessage">
                            <div>보낸쪽지</div>
                            <div>날짜</div>
                        </div>
                        <div id="sendtext">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용<br>
                            내용내용내용내용내용내용내용내용내용내용내용공백포함최대60자
                        </div>
                        
                    </div>
                </div>
               </div>
              </div>
              
            <div id="footer">

            </div>
            
            
      <!-- 쪽지보내기 모달창 -->
     <form action="<%= request.getContextPath() %>/sendMsg.me" method="post">
	 <div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<div class="header">
				<h2>쪽지보내기</h2>
			</div>
				<div class="addDdayBody">
					<div class="inputBox">
						<h4 class="inputLabel">쪽지보내기</h4>            
              			<input onkeydown='mykeydown()' style="height: 130px; white-space: pre;" maxlength="70" type="textarea" name="content" placeholder="공백포함 최대60자" class="inputField" required /><br>
				  </div>
				<button type="submit" class="closeBtn" id="fullBlueBtn1">보내기</button>			
				</div>
		</div>
	</div>
	</form>
	
	
    <script> <!-- 쪽지보내기모달 textarea 엔터키 감지스크맆트 -->
    function mykeydown() { 
        if(window.event.keyCode==13) //enter 일 경우
        {
            sendServer();
        }
     }
    </script>
    <script> <!--쪽지보내기모달 닫는 스크맆트-->
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
  
  </div>
</body>

</html>