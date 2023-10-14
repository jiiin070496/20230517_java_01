<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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

/* 공통 스타일 */
.btn-container {
  margin: 10px;
}

a.button-link {
  text-decoration: none;
}

/* 키워드가 있는 경우 버튼 스타일 */
.btn-container-keyword {
  margin: 10px;
  float: right; /* 오른쪽으로 이동 */
}

/* 키워드가 없는 경우 버튼 스타일 */
.btn-container-no-keyword {
  margin: 10px;
  float: right; /* 오른쪽으로 이동 */
}

button {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

button.keyword {
  background-color: #4CAF50;
}

button.keyword:hover {
  background-color: #45a049;
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

/* 페이지 버튼 컨테이너 스타일 */
.pageInfo-wrap {
    text-align: center;
    margin-top: 20px;
}

/* 페이지 버튼 스타일 */
.pageInfo_btn {
    display: inline-block;
    margin: 5px;
    padding: 10px 15px;
    background-color: #white;
    color: #fff;
    border-radius: 5px;
    font-weight: bold;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.pageInfo_btn:hover {
    background-color: #0056b3;
}

/* 이전 페이지 버튼 스타일 */
.pageInfo_btn.previous {
    background-color: #ccc;
}

.pageInfo_btn.previous:hover {
    background-color: #bbb;
}

/* 다음 페이지 버튼 스타일 */
.pageInfo_btn.next {
    background-color: #ccc;
}

.pageInfo_btn.next:hover {
    background-color: #bbb;
}

/* 현재 페이지 표시 스타일*/
.active{ 
    background-color: #cdd5ec;
}

/* 검색 */
.search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
 }
 .search_area input{
    height: 30px;
    width: 250px;
 }
 .search_area button{
    width: 100px;
    height: 36px;
 }
 .search_area select{
	height: 35px;
 }
</style>
</head>
<body>
<div class="title">
	<h2> 쿵's 게시판 </h2>
	<h4>API Key: <spring:eval expression="@api['api.key']" /></h4>
</div>
<!-- 검색 -->
<div class="search_wrap">
    <div class="search_area">
        <select name="type">
        	<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택</option>
            <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
            <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
            <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
        </select>   
        <input type="text" name="keyword" placeholder="키워드를 입력해주세요!" value="${pageMaker.cri.keyword }">
        <button>Search</button>
    </div>
</div>   
<c:if test="${not empty boardList }">
    <p>총 ${total } 개의 게시물이 있습니다</p>
    <table class="styled-board">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>좋아요수</th>
        </tr>
        <c:forEach items="${boardList }" var="dto">
            <tr>
                <td>${dto.bno }</td>
                <td>
                   <a class="move" href='<c:out value="${dto.bno}"/>'>
                        ${dto.btitle }
                   </a>
                </td>
                <td>${dto.mid }</td>
                <td>${dto.bwriteDate }</td>
                <td>${dto.readcnt }</td>
                <td>${dto.likehit }</td>
            </tr>
        </c:forEach>
    </table>
<!-- 페이징 및 버튼 -->    
    <div class="pageInfo-wrap">
    	<div class="pageInfo_area">
    		<ul>
		        <!-- Previous -->
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>

                <!-- Page (현재 페이지 표시)-->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                </c:forEach>
	           
	            <!-- Next -->
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if>   
            </ul>
    	</div>
    </div>
    
    <form id="moveForm" method="get">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	    <input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
</c:if>

<!-- 키워드 있을때 -->
	<c:if test="${not empty pageMaker.cri.keyword }">
	    <div class="btn-container btn-container-keyword">
	        <a href="<c:url value='/board/list'/>" class="button-link">
	            <button class="keyword">메인으로</button>
	        </a>
	    </div>
	    <div class="btn-container btn-container-keyword">
	        <a href="<c:url value='/board/insert'/>" class="button-link">
	            <button class="keyword">글 등록</button>
	        </a>
	    </div>
	</c:if>
	
<!-- 키워드 없을때 -->
	<c:if test="${empty pageMaker.cri.keyword }">
	    <div class="btn-container btn-container-no-keyword">
	        <a href="<c:url value='/board/insert'/>" class="button-link">
	            <button>글 등록</button>
	        </a>
	    </div>
	    <div class="btn-container btn-container-no-keyword">
	        <button type="button" id="openModalBtn">지도 보기</button>
	    </div>
	</c:if>
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
/* ------- 페이지 및 검색 ------- */
$(document).ready(function() {
	let moveForm = $("#moveForm");
    $(".pageInfo_btn a").on("click", function(e) {
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	    var pageNum = $(this).attr("href");
        moveForm.find("input[name='pageNum']").val(pageNum);
        moveForm.find("input[name='amount']").val(10); // 보여질 글의 갯수
        moveForm.attr("action", "${pageContext.request.contextPath}/board/list"); // context root를 포함한 URL
        moveForm.submit();
    });
	
	$(".move").on("click", function(e){
		e.preventDefault();
		var bno = moveForm.find("input[name='bno']").val();
		if(bno != ''){
			moveForm.find("input[name='bno']").remove();
		}
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "${pageContext.request.contextPath}/board/get");
		moveForm.submit();
	});
		
/* --- 엔터키 --- */
	$(".search_area button").on("click", function(e) {
	    performSearch();
	});

	$(".search_area input[name='keyword']").on("keyup", function(e) {
	    if (e.keyCode === 13) {
	        performSearch();
	    }
	});
	function performSearch() {
	    var type = $(".search_area select").val();
	    var keyword = $(".search_area input[name='keyword']").val();
	    var sKey = '<c:out value="${pageMaker.cri.keyword}"/>';

	    if (!type) {
	        alert("검색 종류를 선택하세요.");
	        return false;
	    }
	    if (!keyword) {
	        alert("키워드를 입력하세요.");
	        return false;
	    }
	    if (sKey != keyword) {
	        moveForm.find("input[name='pageNum']").val(1);
	    }
	    moveForm.attr("action", "${pageContext.request.contextPath}/board/list");
	    moveForm.find("input[name='type']").val(type);
	    moveForm.find("input[name='keyword']").val(keyword);
	    moveForm.submit();
	}
});
/* --------------------------- */

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