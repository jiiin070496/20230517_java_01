<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<!-- 
<spring:eval expression="@talk['api.key']" />
<script type="text/javascript">
    var apiKey = <spring:eval expression="@talk['api.key']" />;
</script>
 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@talk['api.key']" />" ></script>

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
</style>
</head>
<body>
<div class="title">
	<h2> 쿵's 게시판 </h2>
	<p>API Key: ${api.key}</p>
</div>
<c:if test="${not empty boardList }">
    <p>총 <c:out value="${fn:length(boardList)}" />개의 게시물이 있습니다</p>
    <table class="styled-board">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <c:forEach items="${boardList }" var="vo">
            <tr>
                <td>${vo.bno }</td>
                <td>
                   <a href="<c:url value='/board/get'/>?bno=${vo.bno }">
                   		<c:forEach begin="1" end="${vo.breLevel }">&#8618; </c:forEach>
                        ${vo.btitle }
                   </a>
                </td>
                <td>${vo.mid }</td>
                <td>${vo.bwriteDate }</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<div class="btn-container">
	<a href="<c:url value='/board/insert'/>">
	    <button>글 등록</button>
	</a>
</div> 
<!-- 이미지 지도를 표시할 div 입니다 -->
<hr>
<div id="staticMap" style="width:820; height:350px;"></div>
	<script>
// 이미지 지도에 표시할 마커입니다
	var marker = {
	    position: new kakao.maps.LatLng(37.4989968, 127.032821), 
	    text: 'KH정보교육원' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다
	};
	
	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
	    staticMapOption = { 
	        center: new kakao.maps.LatLng(37.4989968, 127.032821), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	        marker: marker // 이미지 지도에 표시할 마커
	    };
	
	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
	<div>
		<p>주소: 서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층</p>
	</div>
</body>
</html>