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
    padding: 1px 4px; /* 수정된 버튼 크기 */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #007bff;
    color: #ffffff;
    font-size: 11px;
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
					<button type="button" class="replyBoard">댓글 달기</button>
					<input type="hidden" id="bno" name="bno" value='<c:out value="${bvo.bno}"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				 	<input type="hidden" name="type" value="${cri.type }">
				 	<input type="hidden" name="keyword" value="${cri.keyword }">
				</form>

			<!-- 댓글 작성란 -->
				<div class="card-body addreply"></div>	
			<!-- 댓글 대댓글 리스트 -->
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

/* ---------- Reply ---------- */
	let replyreplyleftpadding = "";
	window.onload = function () {
	    replyreplyleftpadding = $(".cardwidth").width() * 0.03;
	    $.ajax({
	        type: "get",
	        url: "${pageContext.request.contextPath}/board/readcnt",
	        data: { boardCount: ${bvo.readcnt}, boardNo: ${bvo.bno} },
	        success: function (result) {
	            console.log("readcnt: success(" + result + ")");
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	    var moreReply = "";
	    $.ajax({
	        type: "get",
	        url: "${pageContext.request.contextPath}/replyboard/list",
	        data: { boardNo: ${bvo.bno} },
	        success: function (result) {
	            console.log("list: success");
	            console.log(result);
	            for (var i = 0; i < result.length; i++) {
	                if (result[i].rref == 0) {
	                    var htmlVal = '<div class="card replyCard" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '"><div class="firstReply card" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '"><div class="updatewriter">작성자 : ' + result[i].memberId + '</div><div class="updatereplyContent">내용 : ' + result[i].replyContent + '</div><div class="updatereplyDate">입력날짜 : ' + result[i].replyDate + '</div>' +
	                        '<div class="groupbtn"><button class="updatereply">수정</button><button onclick="deletereplyHandler(\'' + result[i].replyNo + '\');">삭제</button><button class="insertreplyreply">댓글 삽입</button>' +
	                        '<button class="moreReply" data-replyno="' + result[i].replyNo + '">댓글 더보기</button><button class="hideReplies" style="display:none">댓글 숨기기</button>';
                        htmlVal += '</div></div><div class="forAppendArea"></div>';
	                    $(".testappend").append(htmlVal);
	                }
	            }
	            $(".updatereply").click(updatereplyHandler);
	            $(".insertreplyreply").click(insertreplyreplyHandler);
	            $(".moreReply").click(moreReplyHandler);
	            if (${bvo.bno} != 0) {
	            	console.log(${bvo.selectReplyNo});
	                var firstReply = document.getElementsByClassName('firstReply');
	                for (var i = 0; i < firstReply.length; i++) {
	                    if ($(firstReply[i]).data("replyno") == ${bvo.selectReplyNo}) {
	                        firstReply[i].classList.add('text-bg-warning');
	                    }
	                }
	            }
	        },
	        error: function (result) {
	            console.log("error");
	        },
	        dataType: "json"
	    });
	}
	
	function moreReplyHandler(e) {
	    var rrefReplyNo = $(this).data("replyno");
	    var eTarget = e.target;
	    var $replyCard = $(eTarget).parents(".replyCard");
	    var $forAppendArea = $replyCard.find(".forAppendArea");
	    var $hideRepliesBtn = $replyCard.find(".hideReplies");

	    $.ajax({
	        type: "get",
	        url: "${pageContext.request.contextPath}/replyboard/moreReplylist",
	        data: { rref: rrefReplyNo },
	        success: function (result) {
	            $forAppendArea.html("");
	            console.log("moreReplylist: success");
	            console.log(result.length);

	            if (result.length === 0) {
	                alert("답글이 없습니다.");
	            } else {
	                for (var i = 0; i < result.length; i++) {
	                    var htmlVal = '<div class="firstReply card" style="padding-left:' + replyreplyleftpadding + 'px" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '"><div class="updatewriter">작성자 : ' + result[i].memberId + '</div><div class="updatereplyContent">내용 : ' + result[i].replyContent + '</div><div class="updatereplyDate">입력날짜 : ' + result[i].replyDate + '</div>'
	                        + '<div class="groupbtn"><button onclick="deletereplyHandler(' + result[i].replyNo + ');">삭제</button></div>';
	                    $forAppendArea.append(htmlVal);
	                }
	            }
	        },
	        error: function () {
	            console.log("error");
	        },
	        dataType: "json"
	    });
	}

	$(document).on("click", ".moreReply", function() {
	    console.log("보기!");
	    var $card = $(this).closest(".replyCard");
	    var $forAppendArea = $card.find(".forAppendArea");
	    $forAppendArea.show();
	    $(this).hide();
	    $card.find(".hideReplies").show();
	});
	
	$(document).on("click", ".hideReplies", function() {
	    console.log("숨기기!");
	    var $card = $(this).closest(".replyCard");
	    var $forAppendArea = $card.find(".forAppendArea");
	    $forAppendArea.hide();
	    $(this).hide();
	    $card.find(".moreReply").show();
	});
 
$(".replyBoard").click(replyBoardInsertHandler);
	function replyBoardInsertHandler(){
		console.log("댓글버튼 진입");
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
        	   console.log("submitreplyHandler : success");
    		   $(".testappend").html("");
					for (var i = 0; i < result.length; i++) {
	   		   		var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
	   		   		+'<div class="groupbtn"><button class="updatereply">수정</button><button onclick="deletereplyHandler('+result[i].replyNo+');">삭제</button><button class="insertreplyreply">댓글 삽입</button></div></div>';
	   				$(".testappend").append(htmlVal);   
 	   			};
	   	   		$(".addreply").html("");
	   			$(".updatereply").click(updatereplyHandler);
	   			$(".insertreplyreply").click(insertreplyreplyHandler);
 	   		},
	 	   	error: function (request, status, error) {
	            alert("code: " + request.status + "\n" + "error: " + error);
	        },
           dataType: "json"
       });
   }
  
   function deletereplyHandler(forNumber){
		console.log(forNumber);
		 $.ajax({
		       type: "get",
		       url: "${pageContext.request.contextPath}/replyboard/one",
		       data: {replyNo :forNumber},
		       success: function (result) {
		    		   $.ajax({
					       type: "post",
					       url: "${pageContext.request.contextPath}/replyboard/delete",
					       data: {replyNo :forNumber},
					       success: function (result) {
					    	   console.log("deletereplyHandler(forNumber) : success");
					    	   location.reload(true);
				    	   },
						   error : function (){
								 console.log("error");
						   },
						   dataType:"json"
						});
		    	   },
				error : function (){
					 console.log("error");
				},
				dataType:"json"
			});
   		}
	function updatereplyHandler(){
		var replyWriter= $(this).parents(".replyCard").data("writer");

		console.log("updatereplyHandler 진입");
		 
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
		    	   console.log("updateDoBtnHandler : success");
		    	   location.reload(true);
		    	   },
				error : function (){
					 console.log("error");
				},
				dataType:"json"
		});
	}

	function insertreplyreplyHandler() {
		var $replyCard = $(".replyCard");
	    var replyreplywriter = $(this).parents(".replyCard").data("writer");
	    var addreplyreply = '<div class="contenttextarea card replyreplycard" data-writer="${bvo.mid}"><div>↳작성자: ${bvo.mid}</div><div><textarea rows="3" class="col-xl-12 replyContent" name="replyreplyContent">@' + replyreplywriter + '</textarea></div><div><button class="submitreplyreply">답글 저장</button></div></div>';
	    $replyCard.find(".contenttextarea").remove();
	    $(this).parents(".replyCard ").append(addreplyreply);
	    $(".submitreplyreply").click(submitreplyreplyHandler);
	}
/* 	
	function submitreplyreplyHandler() {
	    console.log("submitreplyreplyHandler 진입");
	    var replyreplyContent = $("[name=replyreplyContent]").val();
	    console.log(replyreplyContent);
	    var $replyCard = $(this).parents(".replyCard");
	    var rrefValue = $replyCard.data("replyno"); // rref를 가져오기
	    $.ajax({
	        type: "post",
	        url: "${pageContext.request.contextPath}/replyboard/replyinsert",
	        data: {
	            memberId: "${bvo.mid}",
	            replyContent: replyreplyContent,
	            boardNo: ${bvo.bno},
	            rref: rrefValue // rref 값을 사용
	        },
	        success: function (result) {
	            console.log("submitreplyreplyHandler: success");
	            console.log(result);
	            $(".testtwoappend").html("");
	            for (var i = 0; i < result.length; i++) {
	                var htmlVal = '<div class="card replyCard" data-replyno="' + result[i].rref + '" data-writer="' + result[i].memberId + '"><div class="firstReply card"><div class="updatewriter">작성자 : ' + result[i].memberId + '</div><div class="updatereplyContent">내용 : ' + result[i].replyContent + '</div><div class="updatereplyDate">입력날짜 : ' + result[i].replyDate + '</div>'
	                    + '<div class="groupbtn"><button onclick="deletereplyHandler(' + result[i].replyNo + ');">삭제</button>';
	                $(".testtwoappend").append(htmlVal);
	                $replyCard.find(".contenttextarea").remove();
	            };
	        },
	        error: function () {
	            console.log("error");
	        },
	        dataType: "json"
	    });
	}
 */	
 
	function submitreplyreplyHandler() {
	    console.log("submitreplyreplyHandler");
	    var replyreplyContent = $("[name=replyreplyContent]").val();
	    console.log(replyreplyContent);
	    var $replyCard = $(this).parents(".replyCard");
	    
	    $.ajax({
	        type: "post",
	        url: "${pageContext.request.contextPath}/replyboard/replyinsert",
	        data: {
	            memberId: "${bvo.mid}",
	            replyContent: replyreplyContent,
	            boardNo: ${bvo.bno},
	            rref: $replyCard.data("replyno")
	        },
	        success: function (result) {
	            console.log("result: ", result);
	            console.log("success");
	            $replyCard.find(".contenttextarea").remove();
	        },
	        error: function () {
	            console.log("error");
	        },
	        dataType: "json"
	    });
	}

</script>
</body>
</html>