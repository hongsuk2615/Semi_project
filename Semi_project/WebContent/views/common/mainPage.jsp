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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <title>KH_TIME 메인페이지</title>
</head>
<style>
    * {
         /* border: 1px solid rgba(128, 128, 128, 0.568);  */
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

<body>
	

    <div id="wrapper">
        <%@ include file="header.jsp" %>
        
        <div id="body">
            <div id="main-banner">

            </div>
            <div id="body-wrapper">
                <div id="body-left">
                    <div id="board-wrapper">
                        <table id="board-1">
                            <thead>
                                <tr>
                                    <th>아무거나</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>

                        </table>
                        <table id="board-2">
                            <thead>
                                <tr>
                                    <th>아무거나</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                        <table id="board-3">
                            <thead>
                                <tr>
                                    <th>아무거나</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                        <table id="board-4">
                            <thead>
                                <tr>
                                    <th>아무거나</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                        <table id="board-5">
                            <thead>
                                <tr>
                                    <th>아무거나</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                        <table id="board-6">
                            <thead>
                                <tr>
                                    <th>아무거나</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                        
                    </div>
                    <div id="books-wrapper">
                        <div id="book-1">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목1</div>
                                <div>책가격1</div>
                            </div>
                        </div>
                        <div id="book-2">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목2</div>
                                <div>책가격2</div>
                            </div>
                        </div>
                        <div id="book-3">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목3</div>
                                <div>책가격3</div>
                            </div>
                        </div>
                        <div id="book-4">
                            <div class="book-img">
                                <img src="resources/IMG/책이미지.jfif" alt="">
                            </div>
                            <div class="book-text">
                                <div>책제목4</div>
                                <div>책가격4</div>
                            </div>
                        </div>
                    </div>
    
                </div>

		 <%@ include file="body_right.jsp" %>
            </div>
        </div>
	
        <div id="footer">



        </div>
    </div>
<script>
	$(function(){
        function getBoardlist(cName, num){
            $.ajax({
                url : '<%=request.getContextPath()%>/boardlist.get?cName='+cName,
                type : 'get',
                success : function(result){
                        $('#board-'+num+' thead th').html(cName+' 게시판');
                        $('#board-'+num+' thead').click(function(){
                            location.href = "<%=request.getContextPath()%>/boardDetail.bo?cNo="+(num-1);
                        })
                    if(result.length == 0 ){
                        $('#board-'+num+' tbody').append('<tr>'+
                                                        '<td style="text-align:center">' + '조회된 게시물이 없습니다' + '</td>'+
                                                   '</tr>');
                    } else {
                        for(let i = 0; i < 6 ; i++){
                            if(result[i] != null){
                                $('#board-'+num+' tbody').append('<tr>'+
                                                                '<td>' + result[i].title + '</td>'+
                                                          '</tr>');
                                $('#board-'+num+' tbody>tr').eq(i).click(function(){
                                    location.href = "<%=request.getContextPath()%>/contentDetail.bo?bno="+result[i].boardNo;
                                })
                            }else {
                                $('#board-'+num+' tbody').append('<tr>'+
                                                                '<td style="text-align:center">' + '-'+ '</td>'+

                                                          '</tr>');
                            }
                        }	
                  }			
            },
            error : function(){
                console.log("ajax통신 실패");
            }				
        });			
    }
        getBoardlist('질문답변',2);
        getBoardlist('프로젝트 및 스터디 모집',3);
        getBoardlist('수료생',4);
        getBoardlist('건의사항',5);
        getBoardlist('공지사항',6);
 });

	
</script>


</body>

</html>