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
				<div class="mb-3 mt-3">
					<input type="hidden" class="form-control" id="boardNo"
					name="boardNo" value="${bvo.bno}" disabled>
				</div>
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
					<button type="button" class="replyBoard">댓글 달기</button>
				</form>
				<div class="card-body addreply"></div>
				<div class="testappend"></div>
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

/* Reply */
let replyreplyleftpadding="";
		window.onload = function() {
 			var moreReply ="";
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/replyboard/list",
		           data: { bno:${bvo.bno}},
		           success: function (result) {
		        	  for (var i = 0; i < result.length; i++) {
		        		if(result[i].rref==0){
		        			var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
		    		   		+'<div class="groupbtn"><button class="updatereply">수정</button><button class="deletereply">삭제</button><button class="insertreplyreply">댓글 삽입</button></div></div>';
		    		   		$(".testappend").append(htmlVal);
		        		  }else{
		        				   moreReply= `<button class="moreReply">댓글 더보기</button>`;
		        					  $(".replyCard").append(moreReply); 
		        					  console.log("더보기");
		        			  
		        		  } 
		        	   };
		        	   $(".deletereply").click(deletereplyHandler);
		        	   $(".updatereply").click(updatereplyHandler);
		        	   $(".insertreplyreply").click(insertreplyreplyHandler);
					},
					error : function(result){
						console.log("error");
					},
					dataType:"json"
				});
		
		}
		$(".replyBoard").click(replyBoardInsertHandler);
		function replyBoardInsertHandler(){
			$(".addreply").html("");
			var addreplyVal = `
				<div class="card">
				<form method="post" action="${pageContext.request.contextPath}/replyboard/insert">
				<div class="card-body addaddreply contenttextarea">
						<label>댓글 작성자 : ${bvo.mid}</label>
						<textarea rows="3" class="col-xl-12" name="replyContent" class="replyContent"></textarea>
						<button class="submitreply" type="button">댓글 작성</button>
				</form>
				</div>
				`
			$(".contenttextarea").remove();
			$(".addreply").append(addreplyVal);
			$(".submitreply").click(submitreplyHandler);
		}
		function submitreplyHandler(){
			var replyContent=$("[name=replyContent]").val();
			 $.ajax({
		       type: "post",
		       url: "${pageContext.request.contextPath}/replyboard/insert",
		       data: {memberId: "${bvo.mid}" ,replyContent: replyContent, boardNo: $("#boardNo").val(), rstep : ${bvo.rstep}+1 ,rlevel : ${bvo.rlevel}+1},
		       success: function (result) {
		    		   $(".testappend").html("");
						for (var i = 0; i < result.length; i++) {
		    		   		var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
		    		   		+'<div class="groupbtn"><button class="updatereply">수정</button><button class="deletereply">삭제</button><button class="insertreplyreply">댓글 삽입</button></div></div>';
		    				$(".testappend").append(htmlVal);   
		    	   		};
		    	   		$(".addreply").html("");
		    	   		$(".deletereply").click(deletereplyHandler);
		    			$(".updatereply").click(updatereplyHandler);
		    			$(".insertreplyreply").click(insertreplyreplyHandler);
		    	   },
				error : function (){
					 console.log("error");
					},dataType:"json"
			});
			
		}
		function deletereplyHandler(){
			console.log($(this).parents(".replyCard").data("replyno"));
			 $.ajax({
			       type: "post",
			       url: "${pageContext.request.contextPath}/replyboard/delete",
			       data: {replyNo : $(this).parents(".replyCard").data("replyno")},
			       success: function (result) {
			    	   location.reload(true);
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		}
		function updatereplyHandler(){
			console.log("test123");
			$(this).parents(".replyCard").find(".updatereplyContent").html("");
			$(this).parents(".replyCard").find(".updatereplyDate").hide();
			var updateContent ='<textarea rows="3" class="col-xl-12 replyContent" name="replyContent1"></textarea>'
				
			$(this).parents(".replyCard").find(".updatereplyContent").html(updateContent);	
			 var updateDoBtn ='<button type="button" class="updateDoBtn">댓글 수정</button>'
			$(this).parents(".groupbtn").html(updateDoBtn); 
			 $(".updateDoBtn").click(updateDoBtnHandler);
		}
		function updateDoBtnHandler(){
			var replyContent1= $("[name=replyContent1]").val();
			 $.ajax({
			       type: "post",
			       url: "${pageContext.request.contextPath}/replyboard/update",
			       data: {replyNo : $(this).parents(".replyCard").data("replyno"), replyContent : replyContent1},
			       success: function (result) {
			    	   console.log("success");
			    	   location.reload(true);
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		}
		function insertreplyreplyHandler(){
			var replyreplywriter=$(this).parents(".replyCard").data("writer");
			var addreplyreply ='<div class="contenttextarea card replyreplycard" style="padding-left :'+replyreplyleftpadding+'px" data-writer="${bvo.mid}"><div>↳작성자 : ${bvo.mid}</div><div><textarea rows="3" class="col-xl-12 replyContent" name="replyreplyContent">@'+replyreplywriter+'</textarea></div><div><button class="submitreplyreply">답글 저장</button></div></div>'
			$(".contenttextarea").remove();
			$(this).parents(".replyCard ").append(addreplyreply);
			$(".submitreplyreply").click(submitreplyreplyHandler);
		}
	function submitreplyreplyHandler(){
			console.log("submitreplyreplyHandler");
			var replyreplyContent= $("[name=replyreplyContent]").val();
			console.log(replyreplyContent);
		  $.ajax({
			       type: "post",
			       url: "${pageContext.request.contextPath}/replyboard/replyinsert",
			       data: {memberId:"${bvo.mid}",  replyContent : replyreplyContent, boardNo:${bvo.bno},rref : $(this).parents(".replyCard").data("replyno") },
			       success: function (result) {
			    	   console.log("success");
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		}
</script>
</body>
</html>