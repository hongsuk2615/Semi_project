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
    
    #todlist2 >div{
    	display : flex;
    }
</style>

<body>
    <div id="wrapper">
          <%@ include file="../common/header.jsp" %>
        <div id="body">
            <div id="content">
                <div id="content1">
                    <div id="todolist">
                        <div><img src="<%=request.getContextPath() %>/resources/IMG/todolist.PNG"></div>
                        <div id="plus">
                            <div><b style="font-size:x-large;color: skyblue;">우선순위</b></div>
                            <div><img src="<%=request.getContextPath() %>/resources/IMG/+.PNG"></div>
                        </div>
                    </div>
                    <div id="todlist2">
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
                        </div>
                        <div id="checkbox2"><input id="checkbox3"type="text" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <input id="checkbox1" type="checkbox" placeholder="ToDoList1">
                            <img src="<%=request.getContextPath() %>/resources/IMG/bin (2).png" style="color: gray; width: 30px;">
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