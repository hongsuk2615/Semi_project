<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,java.util.HashMap, com.khtime.member.model.vo.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	HashMap<Integer,ArrayList<ArrayList<String>>> contents = (HashMap<Integer,ArrayList<ArrayList<String>>>) request.getAttribute("contents");
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
                    <div id="messagebox3" class="title-text"> 쪽지함</div>
                    <div id="messagecheck">
                    <script>
                    let opponents = [];
                    </script>
                        <%for(Member m : list) {%>
                        <script>
                        	opponents.push(<%=m.getUserNo()%>);
                        </script>
                        <div class ="opponents1">
                        <div class="date">
                            <div class="opponent-name"><%= m.getNickName() %></div>
                            
                            <div class="msgdate"><%= contents.get(m.getUserNo()).get(0).get(2)
                            %></div>
                        </div>
                        <div class="text"><%= contents.get(m.getUserNo()).get(0).get(1) %></div>
                        </div>
                        <% } %>               
                    </div>
                </div>
                
                
                <div id="content2">
                
                	<!-- 주고받은 쪽지가 없을 경우 아무내용없는 div -->
                	<% if(list.size() == 0){ %>
                		<div class="messagesend" style="display : none">
                		<div class="title-text"></div>
                        <div class="newfix">
                            <div><button class="openBtn" disabled></button></div>            
                        </div>
                    </div>
                    <div class="messagecheck2" style="display : none">                   
                            <div>주고받은 쪽지가 없습니다.</div>
                    </div>
                	<%} %>
                	
                 <!-- 주고받은 메세지가 있을 경우 div -->
                	<% for(Member m : list) {%>
                    <div class="messagesend" style="display : none">
                    	
                        <div class="title-text"><%=m.getNickName() %></div>
                      
                        <div class="newfix">
                            <div><button class="openBtn"></button></div>
                        </div>
                    </div>
                    
                    <div class="messagecheck2" style="display : none">
                    	<% ArrayList<ArrayList<String>> userContents = contents.get(m.getUserNo()); %>
                    	<% for(int i = 0 ; i < userContents.size(); i++){ %>
                        <% if(userContents.get(i).get(0).equals("recieve")){ %>
                        <div class="receivemessage">
                            <div>받은쪽지</div>
                            <div class="msgdate"><%= userContents.get(i).get(2) %></div>
                        </div>   
                             
                        <div class="receivetext">
                                <%= userContents.get(i).get(1) %>

                        </div> 
                        <% }else if(userContents.get(i).get(0).equals("send")){ %>                      
                        <div class="sentmessage">
                            <div>보낸쪽지</div>
                            <div class="msgdate"><%= userContents.get(i).get(2) %></div>
                        </div>
                        <div class="sendtext">
                            <%= userContents.get(i).get(1) %>
                        </div>
                        	<% } %>
                  		<% }%>
                    </div>
                    <% } %>
                </div> 
               </div>
              </div>
              
            <div id="footer">

            </div>
            
            
      <!-- 쪽지보내기 모달창 -->
     <form action="<%= request.getContextPath() %>/sendMsg.me" method="post">
     <input type="hidden" name="opponentNo" value="">
	 <div class="msg-modal hidden">
		<div class="Msgbg"></div>
		<div class="msg-modalBox">
			<div class="header">
				<h2>쪽지보내기</h2>
			</div>
				<div class="sendMsgBody">
					<div class="inputBox">	
						<h4 class="inputLabel">쪽지보내기</h4>            
              			<textarea style="height: 130px;  resize:none;" name="content" placeholder="공백포함 최대60자" class="inputField" required /></textarea><br>
				  </div>
				<button type="submit" class="closeBtn" id="fullBlueBtn4">보내기</button>			
				</div>
		</div>
	</div>
	</form>
	

    <script> <!--쪽지보내기모달 닫는 스크맆트-->
      const open = () => {
          document.querySelector(".msg-modal").classList.remove("hidden");
          
      }
      const close = () => {
          console.log('cdlose')
          document.querySelector(".msg-modal").classList.add("hidden");
      }
      $(".openBtn").each(function(index, item){
    	  let value = opponents[index];
    	  $(item).click(function(){
    		  open();
    		  $('input[name="opponentNo"]').val(value);
    	  })
    	  
      })
      document.querySelector(".closeBtn").addEventListener("click", close);
      document.querySelector(".Msgbg").addEventListener("click", close);
  </script>
  
  <script> <!-- 상대방 블럭을 클릭 시 이벤트 -->
  function hiddenMsg(){
	  $('.messagecheck2').css('display','none');
	  $('.messagesend').css('display','none')
  }
  
  $('.opponents').each(function(index, item){
	    $(item).click(function(){
	  		hiddenMsg();      
	  		$('.messagecheck2').eq(index).css('display','block');
	  		$('.messagesend').eq(index).css('display','flex');
            $('.opponents').each(function(index, item){
                $(item).css('backgroundColor','white');
                $(item).children().css('color','#a6a6a6').children().css('color','black').eq(1).css('color','#a6a6a6');
            })
            $(this).css('backgroundColor','#42A5F5').css('color','white').children().css('color','white').children().css('color','white');
	    })
	    
	})
  $('.opponents').eq(0).css('backgroundColor','#42A5F5').css('color','white').children().css('color','white').children().css('color','white');
  $('.messagecheck2').eq(0).css('display','block');
  $('.messagesend').eq(0).css('display','flex');
  </script>
  </div>
</body>

</html>