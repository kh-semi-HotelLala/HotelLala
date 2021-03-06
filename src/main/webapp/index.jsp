<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Hotel LaLa</title>

    <!-- *** 웹 상단에 호텔 아이콘 추가 *** -->
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">

    <link rel="stylesheet" href="resources/css/main-style.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
    
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>

<body>

    <header>
        <!-- 헤더 -->
        <section class="headArea">
            <div></div>
            <div>
                <a href="#">
                    <img src="${contextPath}/resources/images/logo/logo-white-width.png" alt="logo">
                </a>
            </div>

            <c:if test="${empty sessionScope.loginMember}">

                <div>
                    <a href="login">로그인</a>
                    <span>|</span>
                    <a href="signUp">회원가입</a>
                </div>

            </c:if>

            <c:if test="${!empty sessionScope.loginMember}">

                <div>
                    <a href="${contextPath}/member/logout">로그아웃</a>
                    <span>|</span>
                    <a href="${contextPath}/member/myPage/info">마이페이지</a>
                </div>

            </c:if>

        </section>

        <!-- 그라데이션 효과용 div -->
        <div class="gradation"></div>
   
        <!-- 호텔 대표 사진 -->
        <section class="mainPhoto">
            
            <img src="resources/images/main/mainPhoto1.jpg" class="slide" style="z-index: -1;">
            <img src="resources/images/main/mainPhoto2.jpg" class="slide" style="z-index: -2;">
            <img src="resources/images/main/mainPhoto3.jpg" class="slide" style="z-index: -3;">
            <img src="resources/images/main/mainPhoto4.jpg" class="slide" style="z-index: -4;">
            
        </section>
        
    </header>

    <!-- nav -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>
        <section class="mainContent">
            <!-- 호텔 소개 -->
            <section>

                <article class="mainSection1">
                    <div class="mainTitle">
                        <p class="title">Hotel Info</p>
                    </div>
                    
                    <!-- 사진 슬라이드 -->
                    <div id="slideShow">
                        <div class="back">
                            <div class="i_1">
                                <img src="resources/images/main/beach.jpg">
                            </div>
                            <div class="i_2">
                                <img src="resources/images/main/party.jpg" >
                            </div>
                            <div class="i_3">
                                <img src="resources/images/main/restaurant.jpg" >
                            </div>
                            <div class="i_4">
                                <img src="resources/images/main/restaurant2.jpg">
                            </div>
                            <div class="i_5">
                                <img src="resources/images/main/swimming-pool.jpg">
                            </div>
                        </div>
                    </div>
                </article>

            </section>

            <!-- 상품 안내 -->
            <section>

                <article class="mainSection2">
                    <div class="mainTitle">
                        <p class="title">Package & Service</p>
                    </div>

                    <c:if test="${!empty sessionScope.loginMember}">
                        <a href="${contextPath}/reservation/date">▶ Go to offer</a>
                    </c:if>
                    
                    <c:if test="${empty sessionScope.loginMember}">
                        <a href="${contextPath}/login">▶ Go to offer</a>
                    </c:if>

                    <div id="mainProduct">
        
                        <li>
                            <span class="product">
                                <img src="resources/images/main/pool.jpg" alt="수영장"> <br>
                                Pool
                            </span>
                            <div>Hotel LaLa의 실내 수영장은<br>계절에 상관없이 이용하실 수 있습니다.</div>
                        </li>
                        
                        <li>
                            <span class="product">
                                <img src="resources/images/main/dinner.jpg" alt="음식"> <br>
                                Special Breackfast
                            </span>
                            <div>고객님의 여유로운 호텔 스테이를 위해<br>모든 패키지에는 조식이 포함되어 있습니다.</div>
                        </li>
                        
                        <li>
                            <span class="product">
                                <img src="resources/images/main/room.jpg" alt="방"> <br>
                                Room
                            </span>
                            <div>Hotel LaLa의 객실을<br>회원 전용 가격으로 만나보세요.</div>
                        </li>
                        
                    </div>
                </article>
            </section>

            <!-- 회원 가입 -->
            <section>
                <article class="mainSection3">

                    <img class="dividing-line" src="resources/images/main/leaf-dividing-line.png" alt="구분선">
                    
                    <div class="mainTitle">
                        <p class="title">CLUB LaLa</p>
                    </div>
                    
                    <p id="club-text">
                        지금 CLUB LaLa에 가입하셔서<br>회원만을 위한 특별한 혜택을 확인해 보세요
                    </p>

                    <div id="mainBtn">

                        <c:if test="${empty sessionScope.loginMember}">
                            <button id="joinBtn" onclick="location.href = 'signUp'">join</button>
                        </c:if>

                        <c:if test="${!empty sessionScope.loginMember}">
                            <button id="joinBtn" onclick="alert('${loginMember.memberName}님은 HotelLaLa의 소중한 고객입니다:D')">join</button>
                        </c:if>

                    </div>

                    <img class="dividing-line" src="resources/images/main/leaf-dividing-line.png" alt="구분선">

                </article>
            </section>
        </section>
    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="resources/js/main.js"></script>

</body>
</html>