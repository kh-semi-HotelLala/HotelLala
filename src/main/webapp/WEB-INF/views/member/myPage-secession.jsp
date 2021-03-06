<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(회원 탈퇴)</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style.css">
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style1.css">

    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    
<main>
    
    <div class="logo">
        <a href="${contextPath}">
            <img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
        </a>
    </div>

    <section class="myPage-content">
           

    <!-- 사이드 메뉴 include -->
    <jsp:include page="/WEB-INF/views/member/sideMenu.jsp"/>
            

    <!-- 오른쪽 마이페이지 상단  -->
    <section class="myPage-inner">

        <section class="myPage-main">

            <form action="secession" method="POST" name="myPage-form"  onsubmit="return secessionValidate()">
              
                <h1 class="myPage-title">My Page</h1>
                <span class="myPage-explanation">멤버쉽 회원을 위한 다양한 혜택이 준비되어 있습니다.</span>
        
                <h4 class="myPage-subtitle">회원 탈퇴</h4>
                <span class="myPage-subexplanation">정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</span>

                <div class="wrapper">  

                    <div class="myPage-row">
                        <label>PASSWORD*</label>
                        <input type="password" name="memberPw" id="memberPw" maxlength="30">   

                    </div>

                    <span id="secession-subexplanation">*탈퇴를 신청하시기 전에 아래의 유의사항을 한 번 더 확인해주시기 바랍니다.</span>           

                    
                    <div class="myPage-row info-title">
                        <label>유의 사항</label>
                    </div>

                    <pre id="secession-terms">
                        

* 탈퇴를 신청하시면 번복이 불가능하며 보유하신 모든 포인트는 소멸됩니다.

* 개인정보보호법에 따라 고객님의 호텔 이용기록, 개인정보 및 문의내역 기록도 모두 삭제됩니다.

* 탈퇴 신청이 완료되면 즉시 홈페이지 로그인이 제한됩니다.

                    </pre>

                    <div>
                        <input type="checkbox" name="agree" id="agree">
                        <label for="agree">위 유의사항을 확인했습니다.</label>
                    </div>


                    <button id="info-update-btn">탈퇴 신청</button>

                </div> 

            </form>

        </section>

    </section>
        
</section>

</main>


<!-- nav -->
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

 <!-- footer -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


 <!-- js -->
<script src="${contextPath}/resources/js/member/myPage.js"></script>
<script src="${contextPath}/resources/js/menu/nav.js"></script>
        

</body>
</html>