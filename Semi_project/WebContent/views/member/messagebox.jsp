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
    <link rel="stylesheet" href="resources/CSS/messagebox.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset = "UTF-8"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>document</title>
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
                    <button id="messagebox">쪽지함</button>
                    <button id="myinfo">내정보</button>
                </div>
            </div>
        </div>
        <div id="body">
            <div id="content">
                <div id="content1">
                    <div id="messagebox3"> <b style="font-size: xx-large;">쪽지함</b></div>
                    <div id="messagecheck">
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                        <div id="date">
                            <div>닉네임</div>
                            <div>날짜</div>
                        </div>
                        <div id="text">내용</div>
                    </div>
                </div>
                <div id="content2">
                    <div id="messagesend">
                        <div><b style="font-size: xx-large;">닉네임</b></div>
                        <div id="newfix">
                            <div><button>쪽지보내기</button></div>
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
        </div>







</body>

</html>