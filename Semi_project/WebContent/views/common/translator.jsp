<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


    <title>khTime 번역기</title>
</head>


<body>

<textarea id="send_text" class="form-control" name="content" cols="60" rows="7" placeholder="한글"></textarea>
<button id="jsonConvertStringSend" type="button"> 번역하기 </button>
<textarea id="result_text" class="form-control" name="content" cols="60" rows="7" placeholder="영어" readonly></textarea>

</body>


<script>
     //번역을 위해서 button 이벤트를 위해서 사용하는 것
    $('#jsonConvertStringSend').click(function () {
        //번역할 object를 생성 
        var test = {
            "original_str": $("#send_text").val()    
        };
        jsonSend(test);
    });
    
    function jsonSend(test) {
        $.ajax({
            type: "POST",
            url: "<%= request.getContextPath()%>/translator.bo",
            data: test, //json을 보내는 방법
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