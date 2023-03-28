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
    <link rel="stylesheet" href="../../resources/CSS/bestBoard.css">
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
                        <div id="board-detail">
                            <div> BEST 게시판</div>
                            <div>
                            <a href="">23년 상반기</a>
                            <a href="">22년 하반기</a>
                            <a href="">22년 상반기</a>
                            <a href="">21년 하반기</a>
                            <a href="">21년 상반기</a>
                            </div>

                            <ul>
                                <li>
                                    프로필 &nbsp; 작성자 &nbsp; 작성일자<br>
                                    내용 or 제목+내용 <br>
                                    <div id="board-detail-bottom"> 
                                        <div>게시판종류</div>
                                        <div id="board-detail-comment">
                                            <div>첨부파일</div>
                                            <div>공감</div>
                                            <div>댓글</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    프로필 &nbsp; 작성자 &nbsp; 작성일자<br>
                                    내용 or 제목+내용 <br>
                                    <div id="board-detail-bottom"> 
                                        <div>게시판종류</div>
                                        <div id="board-detail-comment">
                                            <div>첨부파일</div>
                                            <div>공감</div>
                                            <div>댓글</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    프로필 &nbsp; 작성자 &nbsp; 작성일자<br>
                                    내용 or 제목+내용 <br>
                                    <div id="board-detail-bottom"> 
                                        <div>게시판종류</div>
                                        <div id="board-detail-comment">
                                            <div>첨부파일</div>
                                            <div>공감</div>
                                            <div>댓글</div>
                                        </div>
                                    </div>
                                </li>

                                
                               
                            </ul>
                            
                    </div>
                    <div id="board-detail-search">
                       
                        <div>검색창</div>
                        <div id="board-detail-search-pagebtn">
                        <div>이전</div>
                        <div>다음</div>
                        </div>
                    </div>
                    </div>
    
                </div>

                <%@ include file="../common/body_right.jsp" %>
            </div>
        </div>


        <div id="footer">



        </div>
    </div>



</body>

</html>