<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- map에 저장된 값을 각각 변수에 저장 -->
<c:set var="boardName" value="${map.boardName}" />
<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CUSTOMER SERVICE-문의하기</title>

    <!-- <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css"> -->
    <link rel="stylesheet" href="${contextPath}/resources/css/qnaCheck.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style.css">
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">

    <script src="https://kit.fontawesome.com/a5538decc7.js" crossorigin="anonymous"></script>
</head>
<body>

    <div class="container">
        <div class="logo">
	        <a href="${contextPath}">
				<img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
	        </a>
        </div>
    <main>

        
        
    <%-- 검색을 진행한 경우 key,query를 쿼리스트링 형태로 저장한 변수 생성 --%>
    <c:if test="${!empty param.key}">
        <c:set var="sURL" value="&key=${param.key}&query=${param.query}" />
        
    </c:if>

    <section class="myPage-content">  
        
        
        <!-- 사이드 메뉴 include -->
        <jsp:include page="/WEB-INF/views/member/sideMenu.jsp"/>
        
        <!-- 게시판 목록 조회 (몸통) -->
        <section class="board-list">
            
            
            
            
            <h1 class="board-name">CUSTOMER SERVICE-문의하기</h1>
            
            <c:if test="${!empty param.key}">
                <h3 style="margin-left:30px;">"${param.query}" 검색결과</h3>
                    <!--"게시글" 검색결과-->
            </c:if>
            

            <div class="list-wrapper">
                
                <table class="list-table">
                
                    <thead>
                        <tr>
                            <th>상담 구분</th>
                            <th>상담 제목</th>
                            <!-- <th>작성자</th> -->
                            <th>작성일</th>
                            <th>문의 답변</th>
                        </tr>
                    </thead>
                
                    <tbody>
                        <!-- 
                            if문은 else문을 사용할수없다 
                            choose문은 else문을 사용할수 있다.
                         -->
                        <c:choose>
                            <c:when test="${empty boardList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면  -->
                                <tr>
                                <th colspan="5">게시글이 존재하지 않습니다.</th>
                                <!-- td태그가 5개 이기때문에 colspan="5" -->
                                </tr>
                            </c:when>

                            <c:otherwise>
                            <!-- 게시글 목록 조회 결과가 비어있지 않다면 -->
                            
                            <!-- 향상된 for문처럼 사용 -->
                            <c:forEach var="board" items="${boardList}">
                               
                                <tr>
                                    <td>${board.boardNo}</td>
                                    <td>
                                        <c:if test="${!empty board.thumbnail}">
                                            <img class="list-thumbnail" src="${contextPath}${board.thumbnail}">
                                        </c:if>
                                        <a href="detail?no=${board.boardNo}&cp=${pagination.currentPage}&type=${param.type}${sURL}">${board.boardTitle}</a>
                                    </td>
                                    <td>${board.memberNickname}</td>
                                    <td>${board.createDate}</td>
                                    <td>${board.readCount}</td>
                                </tr>

                            </c:forEach>
                            </c:otherwise>
                        </c:choose>



                    </tbody>

                </table>
            </div>


            <div class="btn-area">
                
                <c:if test="${!empty loginMember}"></c:if>
                <!-- /community/board/write -->
                <button id="insertBtn" onclick="location.href='write?mode=insert&type=${param.type}'">글쓰기</button>
            </div>

            ${param.type}

            <div class="pagination-area">

                <!-- 페이지네이션 a 태그에 공통 주소를 저장한 변수 선언 -->
                <c:set var="url" value="list?type=${param.type}&cp="/>

                ${pagination}

                <ul class="pagination">
                    <!-- 첫페이지로 이동 -->
                    <li><a href="${url}1${sURL}">&lt;&lt;</a></li>
                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>
                 
                   
                    
                    <!-- 범위가 정해진 일반 for문 사용 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                    
                    <c:choose>
                            <c:when test="${i==pagination.currentPage}">
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <!-- list?type=1&cp=i -->
                                <li><a href="${url}${i}${sURL}">${i}</a></li>
                        </c:otherwise>
                    
                    </c:choose>  

                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동  -->
                    <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>
                    <!-- 끝페이지로 이동 -->
                    <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>



                </ul>
            </div>
            
            <!-- /board/list?type=1&cp=3 -->
            <!-- /board/list?type=1&cp=3 &key=t&query=안녕  : 검색을 했을때 key,query 추가된다.-->
            <form action="list" method="get" id="boardSearch" onsubmit="return searchValidate()">
                 <input type="hidden" name="type" value="${param.type}">
                <select name="key" id="search-key">
                    <option value="t">제목</option>
                    <option value="c">내용</option>
                    <option value="tc">제목+내용</option>
                </select>

                <input type="text" name="query" id="search-query"placeholder="검색어를 입력해주세요.">
                <button>검색</button>
            </form>



        </section>

    </section>
    </main>


    <div class="modal">
        <span id="modal-close">&times;</span>
        <img id="modal-image" src="${contextPath}/resources/images/user.png">
    </div>


    <!-- nav -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- <script src="${contextPath}/resources/js/board/board.js"></script> -->

    <script src="${contextPath}/resources/js/menu/nav.js"></script>
        

</body>
</html>