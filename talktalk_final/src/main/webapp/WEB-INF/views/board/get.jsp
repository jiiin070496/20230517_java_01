<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardOne</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.content {
	padding: 20px;
}

h2 {
	margin-top: 0;
	font-size: 24px;
	color: #333333;
}

input[type="text"], textarea {
	width: 100%;
	padding: 12px;
	margin-bottom: 10px;
	border: 1px solid #e0e0e0;
	border-radius: 4px;
	background-color: #f7f7f7;
	font-size: 16px;
	color: #333333;
}

button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #007bff;
	color: #ffffff;
	font-size: 16px;
	transition: background-color 0.2s;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
<c:out value="${like_no}" />
	<div class="container">
		<div class="content">
			<div>
				<form action="${pageContext.request.contextPath }/board/update"
					method="get">
					<input type="hidden" name="bno" value="${bvo.bno}"> <label
						for="btitle">제목:</label> <input type="text" id="btitle"
						name="btitle" value="${bvo.btitle}" readonly> <br> <label
						for="bcontent">내용:</label>
					<textarea id="bcontent" rows="10" cols="50" name="bcontent"
						readonly>${bvo.bcontent}</textarea>
					<br>
					<a href="#" id="likeCount">좋아요수: (${data.totalLikeCount })</a>
					
					<a href="${pageContext.request.contextPath}/board/list">
					<button type="submit" id="btn-board-update">글 수정</button>
					</a>
					<button type="button" id="btn-board-delete">글 삭제</button>
					<a href="${pageContext.request.contextPath}/board/list">
					  <button type="button">글 목록으로 이동</button>
					</a>
					<button type="button" id="btn-board-like">좋아요</button>
				</form>
			</div>
					
				
			
	<!-- Comments Section -->
			<div class="card my-4">
			    <h5 class="card-header">댓글 목록</h5>
			    <div class="card-body">
			        <!-- 댓글 목록을 표시할 곳 -->
			        <div id="reply-list">
			            <!-- 댓글이 표시될 영역 -->
			        </div>
			    </div>
			</div>
	<!-- Comments Form -->
			<div class="card my-4">
				<h5 class="card-header">Leave a Comment:</h5>
				<div class="card-body">
					<form id="reply-form">
						<div class="form-group">
							<input type="hidden" name="bno" value="${bvo.bno}" />
							<textarea name="bcontent" class="form-control" rows="3"></textarea>
						</div>
						<button type="submit" class="btn-board-reply">댓글 등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
   $("#btn-board-delete").click(function () {
       var bno = '${bvo.bno}';
       if (confirm("글 삭제하시겠습니까?")==true) {
         $.ajax({
           type: "post",
           url: "${pageContext.request.contextPath}/board/delete",
           data: { bno: bno },
           success: function (response) {
           	console.log(response);
            if(response > 0){
            	alert("삭제되었습니다.");
            }else {
            	alert("삭제 실패했습니다");
            }
			location.href = "${pageContext.request.contextPath}/board/list";
			}
		});
	}
});
   

// 좋아요 버튼 클릭 이벤트 핸들러
   $("#btn-board-like").click(function() {
       var bno = "${bvo.bno}"; // 게시물 번호
       var mid = "jiin0960"; // 사용자 아이디

       // 데이터를 JSON 형식으로 구성
       var requestData = {
           bno: bno,
           mid: mid
       };

       // Ajax 요청
       $.ajax({
           type: "POST",
           url: "${pageContext.request.contextPath}/board/doLike",
           data: JSON.stringify(requestData), // JSON 형식으로 데이터 전송
           contentType: "application/json", // 요청 헤더에 JSON 형식 지정
           success: function(data) {
               if (data.result === "success") {
                   if (data.status === "like") {
                	   console.log("좋아요 성공");
                       // 좋아요 상태이면 좋아요 취소로 변경
                       $("#btn-board-like").text("좋아요 취소");
                   } else {
                	   console.log("좋아요 취소 성공");
                	   // 좋아요 취소 상태이면 좋아요로 변경
                       $("#btn-board-like").text("좋아요");
                   }

               }
           },
           error: function() {
               console.error("좋아요 처리 중 오류 발생");
           }
       });
   });
</script>
</body>
</html>