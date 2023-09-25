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
					<div class="col">
		   				<label for="exampleFormControlInput1" class="form-label">Like</label>
            			<input type="text" class="form-control" id="exampleFormControlInput1" value="${getLike}" readonly>
		  			</div>
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
   
   // 댓글 목록을 가져오고 표시하는 함수
	 function loadReply() {
	    $.ajax({
	        type: "GET",
	        url: "${pageContext.request.contextPath}/board/get?bno=${bvo.bno}",
	        success: function (replys) { // 변수명 수정
	            var replyList = $("#reply-list");
	            replyList.empty();
	
	            $.each(replys, function (index, reply) { // 변수명 수정
	                var replyDiv = $("<div class='replys'></div>");
	                replyDiv.append("<p>" + reply.bcontent + "</p>"); // 변수명 수정
	                replyList.append(replyDiv);
	            });
	        }
	    });
	}

   // 페이지 로드 시 댓글 목록 로드
   loadReply();
   
   // 댓글 등록 폼 제출 처리
   $("#reply-form").submit(function (event) {
       event.preventDefault();
       var bcontent = $("textarea[name='bcontent']").val().trim();

       if (bcontent === '') {
           alert("내용을 입력해주세요");
           return;
       }
       $.ajax({
           type: "POST",
           url: "${pageContext.request.contextPath}/board/rinsertDo",
           data: {
               bno: "${bvo.bno}",
               bcontent: bcontent
           },
           success: function (response) {
               if (response > 0) {
                   alert("댓글 등록되었습니다.");
                   $("textarea[name='bcontent']").val(''); // 댓글 입력 칸 비우기
                   loadReply(); // 댓글 목록 다시 로드
               } else {
                   alert("댓글 등록에 실패했습니다.");
               }
           }
       });
   });
   
   $(function() { // 스크립트 시작문
       var likeval = ${like};
       var bno = ${bvo.bno};
       var like_type = 1;
       
       if(likeval > 0){
           console.log(likeval + "좋아요 누름");
           $('#btn-board-like').html("좋아요 취소");
           $('#btn-board-like').click(function() {
               $.ajax({
                   type: "post",
                   url: "${pageContext.request.contextPath}/board/likeDown",
                   contentType: 'application/json',
                   data: JSON.stringify(
                       {
                           "bno": bno,
                           "mid": "${bvo.mid}", // mid를 문자열로 감싸야 합니다.
                           "like_type": like_type
                       }
                   ),
                   success: function(data) {
                       alert('취소 성공');
                   }
               });
           });
       } else {
           console.log(likeval + "좋아요 안누름");
           console.log("${bvo.mid}"); // mid를 문자열로 출력합니다.
           $('#btn-board-like').click(function() {
               $.ajax({
                   type: "post",
                   url: "${pageContext.request.contextPath}/board/likeUp",
                   contentType: "application/json",
                   data: JSON.stringify(
                       {
                           "bno": bno,
                           "mid": "${bvo.mid}", // mid를 문자열로 감싸야 합니다.
                           "like_type": like_type
                       }
                   ),
                   success: function(data) {
                       alert('성공');
                   }
               });
           });
       }
   });
</script>
</body>
</html>