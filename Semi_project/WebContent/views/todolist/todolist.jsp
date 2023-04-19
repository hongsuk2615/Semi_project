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
    <link rel="stylesheet" href="resources/CSS/todolist.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <title>KH_TIME 메인페이지</title>
</head>
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

<body>
    <div id="wrapper">
         <%@ include file="../common/header.jsp" %>
        
        <div id="body">
            <div id="tdl-wrapper">
                <div id="title">
                    <div id="title-left">
                        <img src="resources/IMG/correct.png" alt="뭘까" width="80" height="80">
                        <div>TO DO LIST</div>
                    </div>
                    <div id="title-right">
                        <div id="priority">
                            우선순위
                        </div>
                        <div id="tdl-btn-add">
                        
                        </div>
                    </div>     
                </div>
                <div id="content">
                    
                </div>
                <div id="tdl-modal">
                    <div id="modal-wrapper">
                        <div id="modal-head">
                            To Do List 추가
                        </div>
                        <div id="modal-body">
                            <div id="modal-tdl-title">
                                <div>내용</div>
                                <div>우선순위(상,중,하 순)</div>
                            </div>
                            <div id="modal-tdl-content">
                                <div id="modal-tdl-text">
                                    <input type="text" maxlength="35" placeholder="to do list에 추가할 내용을 적으세요">
                                </div>
                                <div id="modal-tdl-priority">
                                    <input name="modal-priority" type="radio" value="3"checked>
                                    <input name="modal-priority" type="radio" value="2">
                                    <input name="modal-priority" type="radio" value="1">
                                </div>
                            </div>                            
                        </div>
                        <div id="modal-footer">
                            <button type="button" id="cancel-btn">취소</button>
                            <button id="add-btn">추가</button>
                            
                        </div>
                    </div>

                </div>
            </div>    
        </div>


        <div id="footer">



        </div>
        
    </div>
    <script>
        function deleteEvent(number){ // 삭제버튼 이벤트함수
            $('#delete-btn'+number+'').click(function(){
                let toDoListNo = $(this).attr('data-tdl');
                console.log(toDoListNo);
                $.ajax({
                    url : '/Semi_project/deleteToDoList.me',
                    data :{toDoListNo},
                    success : function(result){
                        if(result){
                            khalert("삭제성공");
                            getTodolist();
                        }else{
                            khalert("삭제실패");
                            getTodolist();
                        }
                    },
                    error : function(){
                    console.log('todolist 삭제 ajax요청 실패')
                    }
                })      
            })
        }
    </script>
    <script>
        function changePriorityEvent(number){ // 우선순위 변경 이벤트 함수
            $('input[name=priority'+number+']').click(function(){
                let priority = $('input[name=priority'+number+']:checked').val();
                let toDoListNo = $(this).attr('data-tdl');
                $.ajax({
                    url : '/Semi_project/changePriority.me',
                    data :{toDoListNo, priority},
                    success : function(result){
                        if(result){
                            getTodolist();
                        }else{
                            getTodolist();
                        }
                    },
                    error : function(){
                    console.log('todolist 삭제 ajax요청 실패')
                    }
                })      
            })
        }
    </script>
    <script>
        function getTodolist(){ // todolist 조회 및 요소 생성 함수
            $.ajax({
                url : '/Semi_project/getToDoList.me',
                success : function(tdl){
                    if(tdl.length == 0){
                        $('#content').html(`
                            <div class="tdl" style="display:flex; justify-content : center; text-align: center;">
                                <div class="tdl-content">
                                   to do list가 없습니다.
                                </div>
                            </div>`);
                    }else{
                        $('#content').html('');
                        $(tdl).each(function(index,item){
                            $('#content').append(`
                                <div class="tdl">
                                    <div class="tdl-content">
                                        \${item.content}
                                    </div>
                                    <div class="priority">
                                        <input type="radio" name="priority\${index}" value="3" data-tdl ="\${item.toDoListNo}">
                                        <input type="radio" name="priority\${index}" value="2" data-tdl ="\${item.toDoListNo}">
                                        <input type="radio" name="priority\${index}" value="1" data-tdl ="\${item.toDoListNo}">
                                    </div>
                                    <div class="delete-btn" id="delete-btn\${index}" data-tdl ="\${item.toDoListNo}">

                                    </div>
                                </div>`);
                            switch(item.priority){
                                case 1 : $('input[name=priority'+index+']').eq(2).prop('checked','true'); break;
                                case 2 : $('input[name=priority'+index+']').eq(1).prop('checked','true'); break;
                                case 3 : $('input[name=priority'+index+']').eq(0).prop('checked','true'); break;
                            }
                            deleteEvent(index);
                            changePriorityEvent(index);
                            console.log(typeof(item.priority));
                            console.log(index);
                        })
                    } 
                },
                error : function(){
                    console.log('todolist 조회 ajax요청 실패')
                }


            })



        }
        getTodolist();

    </script>
    
    <script>
       $('#add-btn').click(function(){ // 비동기 todolist 추가
            let content = $('#modal-tdl-text>input').val();
            let priority = $('#modal-tdl-priority>input:checked').val();
            
            $.ajax({
                url : '/Semi_project/addToDoList.me',
                data : {content,priority},
                success : function(result){
                    console.log(result);
                    if(result){
                        khalert('추가 성공');
                        getTodolist();
                        $('#modal-tdl-text>input').val("");
                    }else{
                        khalert('추가 실패');
                    }
                },
                error : function(){
                    console.log('todolist 추가 ajax요청 실패')
                },
				beforeSend : function(){
					if(content == ''){
						khalert("내용을 입력해주세요!");
						$('#modal-tdl-text>input').focus();
						return false;
					}
				}


            })
        })
    </script>
    
    <script>
        document.getElementById('tdl-btn-add').addEventListener('click',function(){
            document.getElementById('tdl-modal').style.visibility = 'visible';
        })
        document.getElementById('cancel-btn').addEventListener('click',function(){
            document.getElementById('tdl-modal').style.visibility = 'hidden';
        })
    </script>  
	<%@ include file="../common/MessageModal.jsp"%>

</body>

</html>