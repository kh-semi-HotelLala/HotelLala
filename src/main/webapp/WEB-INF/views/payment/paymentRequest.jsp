<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel LaLa</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservation-style.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">

    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>
<body>

    <!-- 헤더 비슷한 거 -->
    <a href="${contextPath}">
        <img src="${contextPath}/resources/images/logo/logo-black.png" class="hotelLogo" alt="logo">
    </a>

    <!-- nav -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>

        <section class="reserveSection" id="pageBarSection">
            <!-- 페이지 표시 -->
            <ul id="pagination">
                <li class="pageNum">1</li>
                <li class="pageNum">2</li>
                <li class="pageNum currentPage">3</li>

                <div class="reserveTitle" id="pageDef-3">결제</div>
            </ul>

        </section>

        <!-- 결제 정보 form -->
        <section class="reserveSection">

            <!-- 예약 정보 -->
            <section id="order-box" class="selectionContents">
                <div class="payment-tit">결제 정보</div>
                
                <div class="payment-con" id="info-div">
                    
                    <div>
                        <ul>
                            <li>
                                <div class="payment-list">객실</div>
                                <div class="unbundling">
                                    <span class="payment-list">${reservation.roomType} / ${reservation.dateRange}박</span>
                                    <span class="payment-list" id="r-price"></span>
                                </div>
                            </li>
                        </ul>

                        <ul class="option-result">
                            <li class="payment-list">선택한 옵션(옵션 / 수량 / 가격)</li>
                            
                            <li>
                                <span class="payment-list">성인 조식(30,000원)</span>
                                <span class="payment-list">|</span>
                                <span class="payment-list">${op.adultBreakfast}</span>
                                <span class="payment-list">|</span>
                                <span class="payment-list" id="ab-price"></span>
                            </li>
                            
                            <li>
                                <span class="payment-list">어린이 조식(25,000원)</span>
                                <span class="payment-list">|</span>
                                <span class="payment-list">${op.childBreakfast}</span>
                                <span class="payment-list">|</span>
                                <span class="payment-list" id="cb-price"></span>
                            </li>
                            
                            <li>
                                <span class="payment-list">엑스트라 베드(65,000원)</span>
                                <span class="payment-list">|</span>
                                <span class="payment-list">${op.extraBed}</span>
                                <span class="payment-list">|</span>
                                <span class="payment-list" id="e-price"></span>
                            </li>
                        </ul>
                    </div>

                    <div class="dividing-col"></div>

                    <div>
                        <div class="req-result">
                            <div class="payment-list">추가 요청사항</div>
                            <div class="textBox">${reservation.extraRequest}</div>
                        </div>

                        <div class="req-result-message">* 기타 문의사항은 Q&A게시판 또는 객실 예약과(010-0000-000)로 <br> 문의주세요.</div>
                    </div>
                </div>
            </section>

            <!-- 결제 방법 선택 -->
            <!-- API 필수 -->
            <section id="pay-option-box" class="selectionContents">
                <div class="payment-tit">결제 방법</div>
                
                <div class="payment-con pay-option-con">
                    
                    <!-- 카드 -->
                    <label>
                        <div class="option-btn">
                            <i class="fa-solid fa-credit-card"></i>
                            <div>카드 결제</div>
                        </div>
                        <input type="radio" name="pay-option" value="card" class="removeResource">
                    </label>
                    
                    <!-- 실시간 계좌이체 -->
                    <label>
                        <div class="option-btn">
                            <i class="fa-solid fa-money-bill-transfer"></i>
                            <div>실시간 계좌이체</div>
                        </div>
                        <input type="radio" name="pay-option" value="trans" class="removeResource">
                    </label>
                    
                    <!-- 가상계좌 -->
                    <!-- <label>
                        <div class="option-btn">
                            <i class="fa-solid fa-money-check-dollar"></i>
                            <div>가상계좌</div>
                        </div>
                        <input type="radio" name="pay-option" value="vbank" class="removeResource">
                    </label> -->
                     
                    <!-- 핸드폰 -->
                    <label>
                        <div class="option-btn">
                            <i class="fa-solid fa-mobile-screen"></i>
                            <div>핸드폰 결제</div>
                        </div>
                        <input type="radio" name="pay-option" value="phone" class="removeResource">
                    </label>
                    
                </div>
            </section>
            
            <!-- 유의사항 & 환불 규정 -->
            <jsp:include page="/WEB-INF/views/common/ruleBox.jsp"/>

        </section>

        <!-- 최종 결제 금액 -->
        <section class="payment-area">
            <div>
                <div class="payment-div1">
                    최종 금액 <span class="room-price" id="sum-price"></span>           
                </div>
    
                <div class="payment-div2">
                    <button type="button" onclick="history.back();">이전 페이지로</button>

                    <button type="button" id="iamportPayment">결제하기</button>
                </div>
            </div>
        </section>

    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        const contextPath = "${contextPath}";

        const adultBreakfast = "${op.adultBreakfast}";
        const childBreakfast = "${op.childBreakfast}";
        const extraBed = "${op.extraBed}";

        const roomRates = "${roomRates}";
        const dateRange = "${reservation.dateRange}";
        const roomType = "${reservation.roomType}";
        const requestNo = "${reservation.requestNo}"

        const memberName = "${loginMember.memberName}"
    </script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <script src="${contextPath}/resources/js/payment/payment.js"></script>

</body>
</html>