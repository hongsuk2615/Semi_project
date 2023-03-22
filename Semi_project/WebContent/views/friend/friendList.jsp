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
    <link rel="stylesheet" href="resources/CSS/requestfriend.css">
    <title>KH_TIME 메인페이지</title>
</head>
<style>
    /* * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    } */

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
            <div id="content">
                <form id="boardmake">
                    <div>
                        <div><input type="text" name="name" placeholder="아이디 혹인 이메일 검색으로 친구요청"></div> <br>
                    </div>
                    <br>
                    
                    <div id="keyword">
                        <div>학생이름</div>
                        <div>학생이름</div>
                        <div>학생이름</div>
                        <div>학생이름</div>
                    </div>
                </form>
            </div>
        </div>
        <div id="footer">



        </div>
    </div>


</body>

</html>