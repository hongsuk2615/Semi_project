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
                    <div class="tdl">
                        <div class="tdl-content">
                            내용입니다.....
                        </div>
                        <div class="priority">
                            <input type="radio" name="priority1"checked>
                            <input type="radio" name="priority1">
                            <input type="radio" name="priority1">
                        </div>
                        <div class="delete-btn">

                        </div>
                    </div>
                    <div class="tdl">
                        <div class="tdl-content">
                            내용입니다.....
                        </div>
                        <div class="priority">
                            <input type="radio" name="priority1"checked>
                            <input type="radio" name="priority1">
                            <input type="radio" name="priority1">
                        </div>
                        <div class="delete-btn">

                        </div>
                    </div>
                    <div class="tdl">
                        <div class="tdl-content">
                            내용입니다.....
                        </div>
                        <div class="priority">
                            <input type="radio" name="priority1"checked>
                            <input type="radio" name="priority1">
                            <input type="radio" name="priority1">
                        </div>
                        <div class="delete-btn">

                        </div>
                    </div>
                    <div class="tdl">
                        <div class="tdl-content">
                            내용입니다.....
                        </div>
                        <div class="priority">
                            <input type="radio" name="priority1"checked>
                            <input type="radio" name="priority1">
                            <input type="radio" name="priority1">
                        </div>
                        <div class="delete-btn">

                        </div>
                    </div>
                    <div class="tdl">
                        <div class="tdl-content">
                            내용입니다.....
                        </div>
                        <div class="priority">
                            <input type="radio" name="priority1"checked>
                            <input type="radio" name="priority1">
                            <input type="radio" name="priority1">
                        </div>
                        <div class="delete-btn">

                        </div>
                    </div>
                    
                    
                    
                    
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
       $('#add-btn').click(function(){ // 비동기 todolist 추가
            let content = $('#modal-tdl-text>input').val();
            let priority = $('#modal-tdl-priority>input:checked').val();
            
            $.ajax({
                url : '/Semi_project/addToDoList.me',
                data : {content,priority},
                success : function(result){
                    console.log(result);
                    if(result){
                        alert('추가 성공');
                    }else{
                        alert('추가 실패');
                    }
                },
                error : function(){
                    console.log('todolist 추가 ajax요청 실패')
                }


            })
        })
    </script>
    <script>
        function getTodolist(){
            $.ajax({
                url : '/Semi_project/getToDoList.me',
                success : function(tdl){
                    if(tdl.length == 0){
                        $('#content').html('to do list가 없습니다.');
                    }else{
                        $(tdl).each(function(index,item){
                            $('#content').html(`
                                <div class="tdl">
                                    <div class="tdl-content">
                                        \${item.content}
                                    </div>
                                    <div class="priority">
                                        <input type="radio" name="priority\${index}">
                                        <input type="radio" name="priority\${index}">
                                        <input type="radio" name="priority\${index}">
                                    </div>
                                    <div class="delete-btn">

                                    </div>
                                </div>`);
                            // $('input[name="priority"+index]').
                            console.log(item);
                            console.log(index);
                        })
                    } 
                },
                error : function(){
                    console.log('todolist 조회 ajax요청 실패')
                }


            })



        }

    </script>
    <script>
        document.getElementById('tdl-btn-add').addEventListener('click',function(){
            document.getElementById('tdl-modal').style.visibility = 'visible';
        })
        document.getElementById('cancel-btn').addEventListener('click',function(){
            document.getElementById('tdl-modal').style.visibility = 'hidden';
        })
    </script>  


</body>

</html>