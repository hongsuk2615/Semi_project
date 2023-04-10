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
<link rel="stylesheet" href="resources/CSS/base.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>KH_TIME 메인페이지</title>
</head>
<style>
* {
	/* border: 1px solid rgba(128, 128, 128, 0.568);  */
	
}
</style>

<body>

	<div id="wrapper">

		<%@ include file="header.jsp"%>

								<%-- src="<%=request.getContextPath()%>/resources/IMG/mainbanner1.jpg"> 
								https://www.iei.or.kr/work/empl.kh
								https://www.iei.or.kr/edu/curriculumDetailView.kh?no=2
								https://www.iei.or.kr/community/noticeView.kh?no=3530&cpage=1&classify=--%>
		<div id="body">
			<div id="banner-wrapper">
				  <div class="swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <a href="https://www.iei.or.kr/work/empl.kh"><img src="<%=request.getContextPath()%>/resources/IMG/mainbanner1.jpg">
            </a> 
          </div>
          <div class="swiper-slide">
            <a href="https://www.iei.or.kr/edu/curriculumDetailView.kh?no=2"><img src="<%=request.getContextPath()%>/resources/IMG/mainbanner2.jpg"> 
          	</a>
          </div>
          <div class="swiper-slide">
           <a  href="https://www.iei.or.kr/community/noticeView.kh?no=3530&cpage=1&classify=" ><img src="<%=request.getContextPath()%>/resources/IMG/mainbannner3.jpg"> 
          </a>
          </div>
        </div>
        <div class="swiper-pagination"></div>
        <!-- If we need pagination -->
        <!-- If we need navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

        <div class="swiper-scrollbar"></div>
      </div>
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

				<%@ include file="body_right.jsp"%>
			</div>
		</div>

		<div id="footer"></div>
	</div>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
	  var mySwiper = new Swiper('.swiper', {
	        // 슬라이드를 버튼으로 움직일 수 있습니다.
	        navigation: {
	          nextEl: '.swiper-button-next',
	          prevEl: '.swiper-button-prev',
	        },

	        // 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
	        pagination: {
	          el: '.swiper-pagination',
	          type: 'bullets',
	        },

	        // 현재 페이지를 나타내는 스크롤이 생깁니다. 클릭하면 이동합니다.
	        scrollbar: {
	          el: '.swiper-scrollbar',
	          draggable: true,
	        },

	        // 3초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
	        autoplay: {
	          delay: 3000,
	        },
	      });
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
	                                    location.href = "<%=request.getContextPath()%>/contentDetail.bo?bNo="+result[i].boardNo;
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