<%@ page import = "java.util.ArrayList,com.khtime.board.model.vo.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("list");
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
    <link rel="stylesheet" href="resources/CSS/boardlistpage.css">
     <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Document</title>
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
                
                    <div id="margin">
                        <div><input type="text" name="name" placeholder="게시판 검색" id="Board"></div>
                        <button type="button"  onclick="searchBoard();" class="btn btn-primary">검색</button> <br>
                    </div>

                    <br>
                    <div id="searchresult">'게시판 검색 결과'</div>
                 
                        <div  id="keyword">
                     
                        </div>
                   
                   
                    <button type="button" id="boardrequest" class="btn btn-primary">게시판 생성 요청</button>
                    <div id="boardlist">
                    현재 존재하는 게시판입니다.
                    </div>
                    <div id="scroll">
                    	<%
							for (Category c : list) {
						%>
						<div>
							<div id="categoryName<%=c.getCategoryNo() %>" onclick="moveboarddetail(this.id);" class="moveboard">
							<%=c.getCategoryName()%> 게시판
							</div>
							
						</div><br>
					<%
						}
					%>
					</div>
                </form>
            </div>
        </div>
        <div id="footer">



        </div>
    </div>
	
	    <script>
		function searchBoard(){

			let searchBoard = document.getElementById("Board").value;
			
			$.ajax({
				
				url : "<%= request.getContextPath()%>/board.do",
				data : {Board : searchBoard},
				success :function(result){
									$('#searchresult').html(searchBoard+"   검색결과");
							 if(result.length == 0){		
									$('#keyword').html("조회된 게시판은 존재하지 않습니다.");
							 }else{
								 $('#keyword').html('');
								 $(result).each(function(index , item){
									 console.log(item);
									 $('#keyword').append(`<div id="category\${index}">\${item.categoryName}</div>`);
									 $('#category'+index).click(function(){
										 location.href="<%=request.getContextPath() %>/boardDetail.bo?cNo="+item.categoryNo;
									 })
								 })
							 }
							 
						 }	 
					 });
				 }
					document.getElementById("boardrequest").addEventListener("click",function(){
      	 					location.href = "<%= request.getContextPath() %>/boardreq.me";
  							})
				
					 function moveboarddetail(id){
						let cno = id.substr(12);
						 location.href="<%=request.getContextPath() %>/boardDetail.bo?cNo="+cno;
							}
		</script>
                    




</body>
</html>