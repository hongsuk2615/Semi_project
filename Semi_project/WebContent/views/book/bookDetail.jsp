<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bookMain</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
        * {
        border: 1px solid rgba(128, 128, 128, 0.568);
    }
    </style>
    <link rel="stylesheet" href="resources/CSS/base.css">
    <link rel="stylesheet" href="resources/CSS/book_main.css">
    <link rel="stylesheet" href="resources/CSS/book_detail.css">
</head>
<body>
    <div id="wrapper">
        <div id="book-header">
            <div id="book-header-content">
                <div id="home-logo">
                    <img src="resources/IMG/로고이미지.png" alt="로고이미지">
                </div>
                <div id="book-logo">
                    <img src="resources/IMG/book.png" alt="" style="height: 120px; width: 160px;">중고 책방
                </div>
                <div id="book-header-right">
                    로그인 된 회원 정보
                </div>
            </div>
        </div>
        <div id="book-navbar">
            <div id="book-btn">
                <button id="book-home-btn">
                    <img src="resources/IMG/home.png" id="book-home-btn-img">Home
                </button>
                <button id="book-sell-btn">
                    <img src="resources/IMG/pencil.png" id="book-sell-btn-img">판매하기
                </button>
            </div>
        </div>
        <div id="book-body">
            <div id="book-title">
                <h1>도서 제목</h1>
                <div id="book-inf">
                    <p>저자 : 홍길동</p>
                    <p>출판사 : 꿈나무출판사</p>
                    <p>출판일 : 2023/03/20</p>
                    <p style="font-size: x-large; color: red; font-weight: 1000;">10,000 원</p>
                </div>
            </div>

            <hr>

            <div id="book-direct">
                <div>
                    <h1>판매 정보</h1>
                </div>
                <div>
                    <p>2023 . 03 . 20</p>
                </div>
                <div>
                    <button id="send-mesage">판매자에게 쪽지 보내기.<img src="/resources/IMG/letters.png"></button>
                </div>
            </div>

            <div class="modal hidden">
                <div class="bg"></div>
                <div class="modalBox">
                    <div class="header">
                        <h2>판매자 ID</h2>
                    </div>
                    <div class="addDdayBody">
                        <div class="inputBox">
                            <textarea rows="16" cols="53" style="resize: none;" placeholder="내용을 적어주세요."></textarea>
                        </div>
                    </div>
                    <div class="closeBtn" id="fullBlueBtn1">
                        쪽지 보내기
                    </div>
                </div>
            </div>

            <hr>

            <div id="book-status">
                <div id="book-status">
                    <h1>책 상태</h1>
                    <p>밑줄 흔적 : 없음   &nbsp;  연필/샤프 &nbsp; 볼펜/형광펜</p>
                    <p>필기 흔적 : 있음   &nbsp;  연필/샤프 &nbsp; 볼펜/형광펜</p>
                    <p>겉 표지 : 깨끗함</p>
                    <p>이름 기입 : 없음</p>
                    <div id="book-status-img1">이미지</div>
                    <div id="book-status-img2">이미지</div>
                </div>
            </div>

            <hr>

            <div id="book-trade">
                <div>
                    <h1>거래 방법</h1>
                    <p>택배 : 가능 / 불가능</p>
                    <p>직거래 : 가능 / 불가능</p>
                </div>
            </div>
        </div> 
    </div>

    <script> 
            const open1 = () => { // 쪽지 모달창 오픈
                document.querySelector(".modal").classList.remove("hidden");
            }
            const close = () => {
                document.querySelector(".modal").classList.add("hidden");
            }
            document.querySelector("#send-mesage").addEventListener("click", open1);
            document.querySelector(".closeBtn").addEventListener("click", close);
            document.querySelector(".bg").addEventListener("click", close);

            $(function() {
            $("#book-home-btn-img").click(function(){
                open("http://127.0.0.1:3000/bookMain.jsp")
            })
        })

    </script>
</body>
</html>