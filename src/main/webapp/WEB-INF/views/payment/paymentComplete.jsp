<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel LaLa</title>

    <link rel="stylesheet" href="../../resources/css/main-style.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/reservation-style.css" type="text/css">

    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>
        <!-- 헤더 + 네비게이션 -->
        
        <section class="reserveSection">

            <section class="selectionContents" id="completePage">
    
                <!-- 예약 완료 메세지 -->
                <section class="complete-box">
                    <div class="complete-message">
                        예약이 완료되었습니다<br>
                        감사합니다
                    </div>
                </section>
    
                <!-- 객실 정보 -->
                <section class="result-box">
                    <div class="result-tit">객실 정보</div>
                    <div class="result-con">
                        <div class="result-div1">
                            <ul>
                                <li>
                                    <span>예약 일</span>
                                    <span class="result-val">2022.05.27 ~ 2022.05.28 (1박)</span>
                                </li>
                                <li>
                                    <span>예약 인원</span>
                                    <span class="result-val">성인 2 / 어린이 1</span>
                                </li>
                                <li>
                                    <span>예약자명</span>
                                    <span class="result-val">예약자</span>
                                </li>

                                <li>
                                    <span>객실</span>
                                    <span class="result-val">Standard</span>
                                </li>
                            </ul>
                        </div>

                        <div class="result-div2">
                            <ul>
                                <li>추가 옵션</li>

                                <!-- 값이 없으면 안보이는 부분 -->
                                <div class="selected-option">
                                    <ul>
                                        <li>
                                            <span>성인 조식</span>
                                            <span>0</span>
                                        </li>

                                        <li>
                                            <span>어린이 조식</span>
                                            <span>0</span>
                                        </li>

                                        <li>
                                            <span>엑스트라 베드</span>
                                            <span>0</span>
                                        </li>
                                    </ul>
                                </div>

                                <li>요청 사항</li>
                                
                                <!-- 값이 없으면 안보이는 부분 -->
                                <div id="req-result">객실에 베개 한 개 추가해주세요.</div>
                            </ul>
                        </div>
                    </div>
                </section>
    
                <!-- 결제 정보 -->
                <section class="result-box">
                    <div class="result-tit">결제 정보</div>
                    <div class="result-div3">
                        <ul>
                            <li>
                                <span>결제 방법</span>
                                <span class="result-val">신용카드</span>
                            </li>
                            <li>
                                <span>결제 시간</span>
                                <span class="result-val">2022.05.27 17:27:04</span>
                            </li>

                            <!-- 선긋기 -->

                            <li>
                                <span>객실 비용</span>
                                <span class="result-val">110,000 원</span>
                            </li>
                            <li>
                                <span>추가 옵션 비용</span>
                                <span class="result-val">0원</span>
                            </li>
                            <li>
                                <span>포인트 할인</span>
                                <span class="result-val">- 10,000</span>
                            </li>

                        </ul>
                        <div class="complete-pay-box">
                            <span>결제 금액</span>
                            <span class="result-val">100,000 원</span>
                        </div>
                    </div>
                </section>
    
                <!-- 버튼 -->
                <section class="result-btn-area">
                    <button>메인페이지로</button>
                    <button>예약 내역 확인</button>
                </section>
    
            </section>

        </section>

        <!-- footer -->
        <footer>
            <div class="inner">
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
    
    </main>

</body>
</html>