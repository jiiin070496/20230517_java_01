<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Kakao 지도 시작하기</title>
</head>
<body>
	<!-- 이미지 지도를 표시할 div 입니다 -->
	<div id="staticMap" style="width:600px;height:350px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey="></script>
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
</body>
</html>
