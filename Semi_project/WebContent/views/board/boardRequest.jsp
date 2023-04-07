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
    <link rel="stylesheet" href="resources/CSS/boardmakerequest.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <title>KH_TIME 메인페이지</title>
</head>
<style>
     * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    }

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
   
</style>

<body>
    <div id="wrapper">
     <%@ include file="../common/header.jsp" %>
       
        <div id="body">
            <div id="main-banner">
            </div>
            <div id="content">
                <form id="boardmake">   
                <div>   
                  <div class="title"> 게시판 제목</div>
                  <div><input type="text" name="name" id="boardtitle"></div> <br>
                </div>    
                <br>
                <div>  
                  <div class="title" >신청사유 </div>
                  <div><textarea id="reason"></textarea></div> 
                </div> 
                    <br>
                    <button type="button"class="btn" id="boardrequest" onclick="boardReq();">제출</button>
                  </form>
            </div>
        </div>
        <div id="footer">



        </div>
    </div>
	
						<script >
							function boardReq(){
								
								let bt = document.getElementById("boardtitle").value;
								let rsn = document.getElementById("reason").value;
								console.log(bt);
								console.log(rsn);
								$.ajax({
									
									url : "<%= request.getContextPath()%>/boardreq.me",
									data : {boardtitle : bt , reason : rsn},
									method : "post",
									success :function(result){
										console.log(result);
												 if(result > 0){		
													 alert("성공적으로 요청 했습니다.");
												 }else{
													 alert("성공적으로 요청하지 못했습니다.");	
												 }
												 
											 }	 
										 });
									 }		
						</script>





</body>

</html>