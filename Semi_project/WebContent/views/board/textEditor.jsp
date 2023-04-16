<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<style>
   #text-editor tr{
        height: 20px;
   }
   #text-editor table, #text-editor td, #text-editor th  {
    border: 1px solid gray;
        min-width: 40px;
   }
   #text-editor table{
    display: inline-block;
   }
   #text-editor th{
    background-color: yellow;
   }
   input[type='color']{
    width: 0px;
    height: 0px;
    border: 0px solid transparent;
    background-color: white;
    opacity: 0;

   }
   ::-moz-selection {
   background: rgb(226, 221, 221);
    }
    ::selection {
    background: rgb(228, 223, 223);
    }
    *{
        caret-color: #5729e9;
        caret-shape: bar;
    }
    .editor-btns{
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: skyblue;
        border-radius: 10px;
        margin : 0px 0px 10px 0px;
    }
    .editor-btns>button{
        width: 40px;
        height: 40px;
        border: 1px solid transparent;
        border-radius: 10px;
        padding: 10px;
        background-color: white;
        display: inline-block;
        margin: 5px;
    }
    .editor-btns>button>div{
        width: 20px;
        height: 20px;
    }
    #text-color, #text-background-color{
        width: 30px;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
        margin-right: 0px;
        padding-right: 25px;
    }
    #text-color-selector, #background-color-selector{
        width: 10px;
        height: 40px;
        display: inline-block;
        border-radius: 6px;
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }
    #text-color-selector{
        background-color: black;
        width : 10px;
    }

    #background-color-selector, #background-color {
        background-color: #ffff00;
    }
    #horizontal > div{
        background-image: url(resources/IMG/minus-horizontal-straight-line.png);
        background-size: contain;
        background-repeat: no-repeat;
    }
    #justify-full > div{
        background-image: url(resources/IMG/justification.png);
        background-size: contain;
        background-repeat: no-repeat;
    }
    
    #justify-center > div{
        background-image: url(resources/IMG/center-align.png);
        background-size: contain;
        background-repeat: no-repeat;
    }
    #justify-left > div{
        background-image: url(resources/IMG/left-align.png);
        background-size: contain;
        background-repeat: no-repeat;
    }
    #justify-right > div{
        background-image: url(resources/IMG/right-align.png);
        background-size: contain;
        background-repeat: no-repeat;
    }
    #ordered-list > div{
        background-image: url(resources/IMG/list.png);
        background-size: cover;
        background-repeat: no-repeat;
    }
    #unordered-list > div{
        background-image: url(resources/IMG/unList.png);
        background-size: cover;
        background-repeat: no-repeat;
    }

</style>
<body>
    <div>
        
    </div>
    <div class="editor-btns">
        <button id="text-color" type="button" onclick ="document.execCommand('foreColor', false, $('#color').val())">가</button>
        <div style="width:10px;" id="text-color-selector" onclick="$('#color').click()"></div><input type="color" name="색상" id="color" value="#31b1f1">
        <button type="button" onclick ="document.execCommand('bold')"><b>가</b></button>
        <button type="button" onclick ="document.execCommand('italic')"><i>가</i></button>
        <button type="button" onclick ="document.execCommand('underline')"><u>가</u></button>
        <button type="button" onclick ="document.execCommand('strikeThrough')"><s>가</s></button>
        <button type="button" onclick ="document.execCommand('superscript')">e<sup>e</sup></button>
        <button type="button" onclick ="document.execCommand('subscript')">e<sub>e</sub></button>
        <button id="text-background-color" type="button" onclick ="document.execCommand('backColor',false,$('#back-color').val())"><div id="background-color" style="width:20px; padding : 3px;">가</div></button>
        <div style="width:10px;" id="background-color-selector" onclick="$('#back-color').click()"></div><input type="color" name="색상" id="back-color" value="#ffff00">
        <button id="horizontal" type="button" onclick ="document.execCommand('insertHorizontalRule')"><div></div></button>
        <button id="justify-full" type="button" onclick ="document.execCommand('justifyFull')"><div></div></button>
        <button id="justify-center" type="button" onclick ="document.execCommand('justifyCenter')"><div></div></button>
        <button id="justify-left" type="button" onclick ="document.execCommand('justifyLeft')"><div></div></button>
        <button id="justify-right" type="button" onclick ="document.execCommand('justifyRight')"><div></div></button>
        <button id="ordered-list" type="button" onclick ="document.execCommand('insertOrderedList')"><div></div></button>
        <button id="unordered-list" type="button" onclick ="document.execCommand('insertUnorderedList')"><div></div></button>
    </div>
    <script>
        $('#color').change(function(){
            document.execCommand('foreColor', false, $('#color').val());
            let color = $('#color').val()+'';
            $('#text-color').css('color', color);
            $('#text-color-selector').css('backgroundColor', color);
            
        })

        $('#back-color').change(function(){
            document.execCommand('backColor', false, $('#back-color').val());
            let color = $('#back-color').val()+'';
            $('#background-color').css('backgroundColor', color);
            $('#background-color-selector').css('backgroundColor', color);
        })
    </script>
</body>
</html>