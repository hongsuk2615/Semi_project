<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>khTime 번역기</title>
</head>
<style>
	.contextmenu {
  display: none;
  position: absolute;
  width: 200px;
  margin: 0;
  padding: 0;
  background: #FFFFFF;
  border-radius: 5px;
  list-style: none;
  box-shadow:
    0 15px 35px rgba(50,50,90,0.1),
    0 5px 15px rgba(0,0,0,0.07);
  overflow: hidden;
  z-index: 999999;
}

.contextmenu li {
  border-left: 3px solid transparent;
  transition: ease .2s;
}

.contextmenu li a {
  display: block;
  padding: 10px;
  color: #B0BEC5;
  text-decoration: none;
  transition: ease .2s;
}

.contextmenu li:hover {
  background: #CE93D8;
  border-left: 3px solid #9C27B0;
}

.contextmenu li:hover a {
  color: #FFFFFF;
}


/* 모달 */
.transmodal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index : 1000;
}


/* 모달 닫기 버튼 */
.transmodal .transcloseBtn {
    position: absolute;
    top: 20px;
    right: 30px;
    background-color : #87ceeb00;
    border: none;
    font-size: 24px;
    color:white;
}




/* 공통 모달창 css */
.transBox {
    position: absolute;
    width: 400px;
    height: 420px;
    border-radius: 16px;
    background-color : navy;
    
}
.transBox .transheader{
    width: 100%;
    height: 44px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.transBox .tbody1{
    width: 100%;
    height: 400px;
    padding: 20px 20px;
}

.hidden {
    display: none;
}

#send_text, #result_text {
	background-color : white;
	 margin-bottom : 4px;
	 border: solid 1px #1e90ff3d;
	border-radius: 5px;
	resize : none;
}




#transName {
	font-size : 22px;
	padding-top: 22px;
	color: white;
	
}


.ui-draggable{
	width: 600px;
	height : 430px;
}


select {
  { ... }
  width: 150px;
  height: 25px;
  background-size: 20px;
  padding: 5px 30px 5px 10px;
  border-radius: 4px;
  outline: 0 none;
  margin-bottom: 5px;
}
select option {
  background: black;
  color: #fff;
  padding: 3px 0;
}

</style>


<body>


	<ul class="contextmenu">
  	<li><a href="#" class="transopenBtn">khTime 번역기</a></li>
	</ul>
	
	
	
	<div class="transmodal hidden">
            <div class="transBox">
				<button class="transcloseBtn">X</button>
				<div class="transheader">
					<p id="transName">KHTime 번역기</p>
				</div>
				<div class="tbody1" style="overflow: auto;">
                    
				<div class="translatorBody">
				<select id="national">
				    <option id="ko" value="ko,en">한국어 -> 영어</option>
				    <option id="en" value="en,ko">영어 -> 한국어</option>
				</select>
				
				</div>
				<div id="box1">
				<textarea id="send_text" class="form-control" name="content" cols="37" rows="9" ></textarea>
				<textarea id="result_text" class="form-control" name="content" cols="37" rows="9" readonly></textarea>
				
				</div>
                
				</div>
				<div class="transfooter">
				
				</div>
				
            </div>
        </div>
</body>




<!-- 우클릭 메뉴 스크립트 -->
<script>
$(document).ready(function(){
	  //Show contextmenu:
	  $(document).contextmenu(function(e){
	    //Get window size:
	    var winWidth = $(document).width();
	    var winHeight = $(document).height();
	    //Get pointer position:
	    var posX = e.pageX;
	    var posY = e.pageY;
	    //Get contextmenu size:
	    var menuWidth = $(".contextmenu").width();
	    var menuHeight = $(".contextmenu").height();
	    //Security margin:
	    var secMargin = 10;
	    //Prevent page overflow:
	    if(posX + menuWidth + secMargin >= winWidth
	    && posY + menuHeight + secMargin >= winHeight){
	      //Case 1: right-bottom overflow:
	      posLeft = posX - menuWidth - secMargin + "px";
	      posTop = posY - menuHeight - secMargin + "px";
	    }
	    else if(posX + menuWidth + secMargin >= winWidth){
	      //Case 2: right overflow:
	      posLeft = posX - menuWidth - secMargin + "px";
	      posTop = posY + secMargin + "px";
	    }
	    else if(posY + menuHeight + secMargin >= winHeight){
	      //Case 3: bottom overflow:
	      posLeft = posX + secMargin + "px";
	      posTop = posY - menuHeight - secMargin + "px";
	    }
	    else {
	      //Case 4: default values:
	      posLeft = posX + secMargin + "px";
	      posTop = posY + secMargin + "px";
	    };
	    //Display contextmenu:
	    $(".contextmenu").css({
	      "left": posLeft,
	      "top": posTop
	    }).show();
	    //Prevent browser default contextmenu.
	    return false;
	  });
	  //Hide contextmenu:
	  $(document).click(function(){
	    $(".contextmenu").hide();
	  });
	});

</script>

<script>
	
	$('.transmodal').draggable({
	    handle: ".transBox"
	  });

</script>





<script>

const transopen = () => {
    document.querySelector(".transmodal").classList.remove("hidden");
    getDday();
}
const transclose = () => {
	console.log('cdlose')
    document.querySelector(".transmodal").classList.add("hidden");
}
document.querySelector(".transopenBtn").addEventListener("click", transopen); 
document.querySelector(".transcloseBtn").addEventListener("click", transclose);




</script>









<script>
     //번역을 위해서 button 이벤트를 위해서 사용하는 것
     
     
     $('#send_text').keyup(function () {
    if (window.event.keyCode == 13) {
    	var test = $("#send_text").val();
        jsonSend(test);
    }
	});
   /*  $('#jsonConvertStringSend').click(function () {
        //번역할 object를 생성 
        var test = $("#send_text").val();
        jsonSend(test);
    }); */
    
    function jsonSend(test) {
    	let selector = $('select').val();
    		$.ajax({
                type: "POST",
                url: "<%= request.getContextPath()%>/translator.bo",
                data: {"original_str" : test, 
                		"selector" : selector}, //json을 보내는 방법
                success: function (data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
                    console.log(data);
                    //alert(data);

                    //string의 값을 object 형식으로 변환합니다.
                    var resulut_obj = JSON.parse(data);
                    
                    //결과값을 textarea에 넣기 위해서
                    $("#result_text").val(resulut_obj.message.result.translatedText);
                },
                error: function (e) {
                    console.log(e);
                    alert('실패했습니다.');
                }
            });
    	
    }
</script>