<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/enrollment.css">
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
        }
    </style>
</head>

<body>
    <div id="wrapper">
        <div id="enrollment-wrapper">
            <div>
                <img src="resources/IMG/로고이미지.png" style="width: 100px; height: 100px;">
            </div>
            <div>
                <b style="font-size: xx-large;">KH TIME에 오신걸 환영합니다.</b>
            </div>
            <div>
                <b style="color: darkgray;">KH TIME은 개발자를 위한 지식 공유 플랫폼입니다.</b>
            </div>
            <br><br>
            <div>
                <div>
                    <hr style="width: 80px; height:1px; background-color: black;">
                </div>
                <div><b>&nbsp회원가입에 필요한 기본정보를 입력해주세요.&nbsp</b></div>
                <div>
                    <hr style="width: 80px; height:1px; background-color: black;">
                </div>
            </div>
            <br>
            <div id="form-wrapper">
                <form action="insert.me">
                    <div id="enrollimg">
                        이미지나 사진을 등록해주세요.<br><br>
                        <div>
                            <img id="titleImg" width="150" height="150">
                        </div><br>
                        <div>
                            <button type="submit" style="background-color: skyblue; border: none;">등록하기</button>
                        </div>
                    </div><br>
                    강사/학생<br>
                    <div>
                        <div>
                            <div><input type="radio" name="TeacherStudent" id="teacher">
                                <label for="teacher">강사&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                            </div>
                            <div><input type="radio" name="TeacherStudent" id="student">
                                <label for="student">학생</label>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div id="info">
                        아이디 <br>
                        <input placeholder="특수문자 제외 한글 , 영문 5~12글자로 작성하세요. " type="text" name="userId" id="userId"
                            required>
                        <button id="checkId"> 아이디 중복확인</button>
                        <br><br>
                        <div style="width: 200px; height: 15px;"></div><br>

                        비밀번호 <br>
                        <input placeholder="영문자,숫자,특수문자로 총 8~15자로 작성하세요 " type="password" name="userPwd1" id="userPwd1"
                            required>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        비밀번호 확인 <br>
                        <input placeholder="비밀번호와 일치하게 작성하세요" type="password" id="userPwd2" required>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        이름 <br>
                        <input type="text" name="userName" id="userName" required>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        닉네임 <br>
                        <input placeholder="중복된 닉네임은 사용하실수 없습니다." type="text" name="userId" id="nickname" required>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        이메일 <br>
                        <input placeholder="이메일 형식에 맞게 입력하세요" type="email" name="email" id="email">
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>

                        반이름 &nbsp&nbsp
                        <select name="class">
                            <option value="selected">반선택</option>
                            <option value="A반">A반</option>
                            <option value="B반">B반</option>
                            <option value="C반">C반</option>
                        </select>
                        <br><br>
                        <div style="width: 200px ;height: 15px;"></div><br>
                    </div>
                    <b>약관동의</b><br><br>
                    <div id="agree2">
                        <input type="checkbox" id="agree1" name="agree1" checked>
                        <label for="agree1"><b>아래 약관에 모두 동의합니다.</b></label>
                    </div>
                    <br>
                    <br>
                    <div>
                        <input type="checkbox" id="agree1" name="agree1" checked>
                        <label for="agree1"><b>서비스 이용약관 동의 (필수)</b></label>
                    </div>
                    <br>
                    <br>
                    <div>
                        <input type="checkbox" id="agree1" name="agree1" checked>
                        <label for="agree1"><b>개인정보 수집 및 이용 동의 (필수)</b></label>
                    </div>
                    <br>
                    <br>
                    <div>
                        <input type="checkbox" id="agree1" name="agree1" checked>
                        <label for="agree1"><b>커뮤니티 이용 규칙 확인 (필수)</b></label>
                    </div>
                    <br>
                    <br>
                    <div>
                        <input type="checkbox" id="agree1" name="agree1" checked>
                        <label for="agree1"><b>광고성 정보 수신 동의 (선택)</b></label>
                    </div>
                    <br>
                    <br>
                    <input type="text" id="ad" name="ad">
                    <br><br>
                    <div id="enrollbutton">
                        <div><input type="submit" value="회원가입" onclick="return validate();"></div>
                        <div><input type="reset" value="취소"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>

</html>