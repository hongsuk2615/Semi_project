<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/CSS/header.css">
    <link rel="stylesheet" href="../../resources/CSS/base.css">
    <link rel="stylesheet" href="../../resources/CSS/body.css">
    <link rel="stylesheet" href="../../resources/CSS/footer.css">
    <link rel="stylesheet" href="../../resources/CSS/boardDetail.css">
    <link rel="stylesheet" href="../../resources/CSS/contentDetail.css">
    <title>Document</title>
    <style>
        * {
            /* border: 1px solid rgba(128, 128, 128, 0.568); */
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
            background-color: #f1f4f9;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <%@ include file="../common/header.jsp" %>
        <div id="body">
            
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <div id="content-detail">
                            <div> 자유게시판</div>
                            <div id="content-detail-content"> 
                                <div id="content-header">
                                    <div id="content-header-left">
                                        <div id="content-profile">
                                            프로필
                                        </div>
                                        <div id="content-writer">
                                            <div>
                                                익명
                                            </div>
                                            <div>
                                                작성일자
                                            </div>
                                        </div>
                                        </div>
                                    <div id="content-header-right">
                                        쪽지 신고
                                    </div>
                                </div>
                                <div>
                                    제목
                                </div>
                                <div>
                                    내용
                                </div>
                                <div>
                                    <div>공감</div>
                                    <div>댓글</div>
                                    <div>스크랩</div>
                                </div>
                                <div>
                                    <button>공감</button>
                                    <button>스크랩</button>
                                </div>
                            </div>
                            


                            <!-- 댓글 -->
                            <ul>
                                <li>
                                    <div id="content-detail-comments">
                                        <div id="comments-left">
                                            프로필사진 &nbsp; 작성자 
                                        </div>
                                        <div id="comments-right">
                                            대댓글 공감 쪽지 신고
                                        </div>
                                    </div>

                                    내용1 <br>
                                    작성일자 <br>
                                </li>
                            </ul>      
                    
                    <!-- 댓글달기 -->
                    <div id="createComments">
                        <div>
                            내용
                        </div>
                        <div>
                            <div>
                                익명체크
                            </div>
                            <div>
                                글작성 버튼
                            </div>
                        </div>
                    </div>
                </div>
                    <div id="goto-boardlist">
                       
                        <div>글 목록</div>
                    </div>
                    </div>
    
                </div>

                <%@ include file="../common/body_right.jsp" %>
            </div>
        </div>
        

        <div id="footer">



        </div>
    </div>
<script>
    window.onload = function(){
	document.getElementById("test1").innerHTML("ddddd");
	}
</script>


</body>

</html>