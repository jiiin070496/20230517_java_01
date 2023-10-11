<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<form id="infoForm" action="${pageContext.request.contextPath }/board/update" method="get">
				<h3><c:out value="${bvo.bno}"/>번글</h3>
					<input type="hidden" name="bno" value="${bvo.bno}"> 
					<label for="btitle">제목:</label> 
					<input type="text" id="btitle" name="btitle" value="${bvo.btitle}" readonly> 
					<br> 
					<label for="bcontent">내용:</label>
					<textarea id="bcontent" rows="10" cols="50" name="bcontent" readonly>${bvo.bcontent}</textarea>
					<br> 
					<label for="likehit">좋아요수: (${bvo.likehit })</label>
					<a href="${pageContext.request.contextPath}/board/list">
						<button type="submit" id="btn-board-update">글 수정</button>
					</a>
					<button type="button" id="btn-board-delete">글 삭제</button>
					<a  class="btn" id="btn-board-list">
						<button type="button">글 목록으로 이동</button>
					</a>
					<button type="button" id="btn-board-like" onclick="updateLike(); return false;">좋아요</button>
				
					<input type="hidden" id="bno" name="bno" value='<c:out value="${bvo.bno}"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				 	<input type="hidden" name="type" value="${cri.type }">
				 	<input type="hidden" name="keyword" value="${cri.keyword }">
				</form>

				<!-- 댓글 입력 폼 -->
				<div class="card">
					<form method="post"
						action="${pageContext.request.contextPath}/replyboard/insert">
						<div class="card-body addaddreply contenttextarea">
							<label>댓글 작성자(로그인한 아이디로 변경) : ${bvo.mid}</label>
							<textarea rows="3" class="col-xl-12" name="replyContent"
								class="replyContent"></textarea>
							<button class="submitreply" type="button">댓글 작성</button>
						</div>
					</form>
				</div>
				<div class="testappend"></div>
			</div>
		</div>
	</div>
<script>
let form = $("#infoForm");

$("#btn-board-list").on("click", function(e){
	form.find("#bno").remove();
	form.attr("action", "/talk/board/list");
	form.submit();
});
$("#btn-board-update").on("click", function(e){
	form.find("#bno").remove();
	form.attr("action", "/talk/board/update");
	form.submit();
});


/* 댓글 삭제 */
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

	var bno = '${bvo.bno}';
	var mid = '${bvo.mid}';
	function updateLike(){ 
	     $.ajax({
	            type : "POST",  
	            url : "${pageContext.request.contextPath}/board/updateLike",       
	            dataType : "json",   
	            data : {'bno' : bno, 'mid' : mid },
	            error : function(){
	               alert("통신 에러");
	            },
	            success : function(likeCheck) {	                
	                    if(likeCheck == 0){
	                    	alert("좋아요");
	                    	$("#btn-board-like").html("좋아요 취소");
	                    	location.reload();
	                    }
	                    else if (likeCheck == 1){
	                     	alert("좋아요 취소");
	                    	$("#btn-board-like").html("좋아요");
	                    	location.reload();
	                    }
	            	}
	        	});
			} 

/* Reply */
   /* let replyreplyleftpadding = ""; */
   window.onload = function () {
       var moreReply = "";
       $.ajax({
           type: "get",
           url: "${pageContext.request.contextPath}/replyboard/list",
           data: { boardNo :${bvo.bno}},
           success: function (result) {
               for (var i = 0; i < result.length; i++) {
                   if (result[i].rref == 0) {
                       var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
                           +'<div class="groupbtn"><button class="updatereply">수정</button><button class="deletereply">삭제</button><button class="insertreplyreply">댓글 삽입</button></div></div>';
                       $(".testappend").append(htmlVal);
                   }
               };
               $(".deletereply").click(deletereplyHandler);
               $(".updatereply").click(updatereplyHandler);
               $(".insertreplyreply").click(insertreplyreplyHandler);
           },
           error: function (result) {
               console.log("error");
           },
           dataType: "json"
       });
   }
   
   $(".submitreply").click(submitreplyHandler);
   function submitreplyHandler() {
       var replyContent = $("[name=replyContent]").val();
       $.ajax({
           type: "post",
           url: "${pageContext.request.contextPath}/replyboard/insert",
           data: {
               memberId: "${bvo.mid}",
               replyContent: replyContent,
               boardNo: $("#boardNo").val(),
               rstep: ${bvo.rstep} + 1,
               rlevel: ${bvo.rlevel} + 1
           },
           success: function (result) {
        	   console.log("서버 응답:", result);
               refreshCommentList(result);
               $("[name=replyContent]").val("");
               location.reload();
           },
           error: function () {
               console.log("error");
           },
           dataType: "json"
       });
   }

   function refreshCommentList(comments) {
       for (var i = 0; i < comments.length; i++) {
           var htmlVal = '<div class="card replyCard" data-replyno="' + comments[i].replyNo + '" data-writer="' + comments[i].memberId + '"><div class="firstReply card"><div class="updatewriter">작성자 : ' + comments[i].memberId + '</div><div class="updatereplyContent">내용 : ' + comments[i].replyContent + '</div><div class="updatereplyDate">입력날짜 : ' + comments[i].replyDate + '</div>'
               + '<div class="groupbtn"><button class="updatereply">수정</button><button class="deletereply">삭제</button><button class="insertreplyreply">댓글 삽입</button></div></div>';
           $(".testappend").append(htmlVal);
       }
       $(".deletereply").click(deletereplyHandler);
       $(".updatereply").click(updatereplyHandler);
       $(".insertreplyreply").click(insertreplyreplyHandler);
   }
   
   function deletereplyHandler() {
	    var replyCard = $(this).parents(".replyCard"); // 댓글 요소를 변수에 저장
	    $.ajax({
	        type: "post",
	        url: "${pageContext.request.contextPath}/replyboard/delete",
	        data: { replyNo: replyCard.data("replyno") },
	        success: function (result) {
	            console.log("삭제");
	            replyCard.hide(); // 댓글 숨기기
	        },
	        error: function () {
	            console.log("error");
	        },
	        dataType: "json"
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
				},
				dataType:"json"
		});
	}
	
	function insertreplyreplyHandler(){
		var replyreplywriter=$(this).parents(".replyCard").data("writer");
		var addreplyreply ='<div class="contenttextarea card replyreplycard" data-writer="${bvo.mid}"><div>↳작성자 : ${bvo.mid}</div><div><textarea rows="3" class="col-xl-12 replyContent" name="replyreplyContent">@'+replyreplywriter+'</textarea></div><div><button class="submitreplyreply">답글 저장</button></div></div>'
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
	    	   console.log("result: ", result);
	    	   console.log("success");
	    	   },
			error : function (){
				 console.log("error");
			},
			dataType:"json"
		});
	}
</script>
</body>
</html>