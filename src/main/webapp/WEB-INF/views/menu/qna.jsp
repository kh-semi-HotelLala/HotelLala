<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/nav.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">

        <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
        <a href="./index.html" class="header fixed">Hotel LaLa</a>
        <div class="first">
            <div class="first-in">
              <p style="margin-left:130px">Q&A</p><br><br>
                <ul>
                    <li>
                        <p>문의내용</p><br>
                        <div class="d-1">
                            <span>제목</span>
                            <span>유형</span><br>
                            <input type="text" placeholder="제목을 입력해주세요.">
                            <!-- <input type="text"><br> -->
                            <select name=active"qna" class="qna"><br>
                                <option value="client">고객문의</option>
                                <option value="client1">객실문의</option>
                                <option value="client2">기타문의</option>
                                <option selected>선택하세요.</option>
                            </select><br>
                            <span>내용</span><br>
                            <p><textarea class="text"cols="100" rows="5" placeholder="내용을 입력해주세요."></textarea></p>
                            <span>첨부파일</span><br>
                            <div class="file-wrap">
                                <input type="file" name="filename" id="file">
                                <input class="upload-name" placeholder="파일 찾아보기를 통해 첨부해주세요." required>
                                <label for="file" class="file_label cursor">파일 찾아보기</label>
                            </div>
                        </div>


                        
                    </li>
                    <br><br>
                    <li>
                        <p>작성자 정보</p><br>
                        <div class="d-1">      
                            <span>이름</span>
                            <span>휴대전화</span><br>
                            <input type="text" placeholder="성함을 입력해주세요.">
                            <input type="text" placeholder="숫자만 입력해주세요."><br>
                            <span>이메일</span><br>
                            <input type="text" placeholder="수신가능한 이메일을 적어주세요.">  
                        </div>   
                    </li>
                    <li>
                        <p>개인정보 수집 및 이용</p>
                        <div class="d-1">
                            <input type="checkbox" class="c-1">
                            <span class="c-1in">[필수]개인정보처리방침안내의 내용에 동의합니다.</span>
                        </div>
                    </li>
                        
                    <br><br>
                    <div class="sub">
                        <div class="div1 cursor">취소</div>
                        <div class="div1 cursor">문의하기</div>
                    </div>
                </ul>
            </div>
        </div>
        
        <div class="seconds">
            <a href="#" class="first_bar">
                <i class="fa-solid fa-x cursor"></i>
                <p class="cursor" style="">close</p>
                <a href="login.html"><p class="login cursor">Login</p></a>
                <a href="signup.html"><p class="signup cursor">signUp</p></a>
                
            </a>

            <div class="nav_bar">
                <ul class="list1">
                    <h4>Contact</h4>
                    <li><a href="notice.html">공지사항</a></li>
                    <li><a href="qna.html">Q&A</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                </ul>
                <br><br>
                <ul class="list2">
                    <h4>Location</h4>
                    <li><a href="location.html">오시는 길</a></li>
                    <!-- <li><a href="#">층별안내</a></li> -->
                    <li><a href="room.html">호텔라라 소개</a></li>
                </ul>
                <br><br><br>

                <ul class="list3">
                    <h1><a href="#" class="white">예약하기</a></h1>
                </ul><br>
                <ul class="list3">
                    <h1><a href="#" class="white">예약확인</a></h1>
                </ul><br>
            </div> 
        </div>

        <div class="third">
                <a href="#" class="seconds_bar">
                    <i class="fa-solid fa-bars cursor"></i>
                    <p class="cursor">MENU</p>
                
                </a>
            <a href="#"><div class="menu-btn-title01 cursor-horver">예약하기</div></a>
            <a href="notice.html"><div class="menu-btn-title02 cursor-hover">공지사항</div></a>
        </div>

    </div>
    <footer>
        <div class="footert-inner">
            <div class="upper">
                <h1>Hotel LaLa</h1>
                <ul>
                    <li><a href="#">Policy</a></li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Family Site</a></li>
                    <li><a href="#">Sitemap</a></li>
                </ul>
            </div>

            <div class="lower">
                <address>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas, facere.<br>
                    TEL : 02-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2022 Hotel LaLa &copy; copyright all right reserved.
                </p>
            </div>
        </div>
    </footer>    
    <script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>