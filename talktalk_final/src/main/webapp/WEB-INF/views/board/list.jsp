<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@api['api.key']" />" ></script>

<style>
body {
    background-color: #f9f9f9;
    margin: 0;
    padding: 20px;
}

.title {
    text-align: center;
    margin-top: 40px;
    padding-bottom: 10px;
    border-bottom: 2px solid #007bff;
}
.title h2 {
    font-size: 32px;
    color: #333;
}

.styled-board {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    margin-top: 20px;
}
.styled-board th,
.styled-board td {
    padding: 15px;
    font-size: 16px;
}
.styled-board th {
    background-color: #007bff;
    color: #fff;
}
.styled-board td a {
    color: #333;
    text-decoration: none;
}
.styled-board td a:hover {
    text-decoration: underline;
}

.footer {
    text-align: center;
    margin-top: 40px;
    padding-top: 10px;
    border-top: 2px solid #007bff;
    background-color: #f9f9f9;
}
.footer p {
    font-size: 16px;
    color: #555;
}

.btn-container {
    text-align: center;
    margin-top: 20px;
}
.btn-container button {
    padding: 10px 20px;
    background-color: #007bff;
    border: none;
    border-radius: 3px;
    color: #fff;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.2s;
    margin-right: 10px;
}
.btn-container button:last-child {
    margin-right: 0;
}
.btn-container button:hover {
    background-color: #0056b3;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
}

/* 모달 내용 스타일 */
.modal-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
}

/* 지도 컨테이너 스타일 */
#map {
    width: 400px;
    height: 300px;
}

/* 모달 닫기 버튼 스타일 */
.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 15px;
  font-weight: bold;
  cursor: pointer;
  z-index: 3; /* 모달 닫기 버튼의 z-index를 설정하여 다른 요소 위에 표시합니다. */
}
</style>
</head>
<body>
<div class="title">
	<h2> 쿵's 게시판 </h2>
	<h4>API Key: <spring:eval expression="@api['api.key']" /></h4>
</div>
<c:if test="${not empty boardList }">
    <p>총 <c:out value="${fn:length(boardList)}" />개의 게시물이 있습니다</p>
    <table class="styled-board">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>좋아요수</th>
        </tr>
        <c:forEach items="${boardList }" var="vo">
            <tr>
                <td>${vo.bno }</td>
                <td>
                   <a href="<c:url value='/board/get'/>?bno=${vo.bno }">
                   		<c:forEach begin="1" end="${vo.rlevel }">&#8618; </c:forEach>
                        ${vo.btitle }
                   </a>
                </td>
                <td>${vo.mid }</td>
                <td>${vo.bwriteDate }</td>
                <td>${vo.readcnt }</td>
                <td>${likeCount }</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<div class="btnSet">
	<jsp:include page="/WEB-INF/views/board/page.jsp"/>
</div>
<div class="btn-container">
	<a href="<c:url value='/board/insert'/>">
	    <button>글 등록</button>
	</a>
	<button type="button" id="openModalBtn">지도 보기</button>
</div> 
<hr>

<!-- 모달 창 -->
<div id="mapModal" class="modal">
    <div class="modal-content">
        <!-- 지도 컨테이너 -->
      <div id="map"></div>
      <!-- 모달 닫기 버튼 -->
        <button id="closeModalBtn" class="close-button">&times;</button>
    </div>
</div>

<script>
//지도 모달
document.getElementById('openModalBtn').addEventListener('click', function() {
    var modal = document.getElementById('mapModal');
    modal.style.display = 'block';

    // 지도 초기화
    var mapContainer = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.4989968, 127.032821),
        level: 4
    };
    var map = new kakao.maps.Map(mapContainer, options);

    // 마커 추가
    var markerPosition = new kakao.maps.LatLng(37.4989968, 127.032821);
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        text: 'KH정보교육원',
        map: map
    });
    

    // 모달 닫기 이벤트
    var closeModalBtn = document.getElementById('closeModalBtn');
    closeModalBtn.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    });
});


</script>

</body>
</html>