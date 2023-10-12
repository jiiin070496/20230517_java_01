<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Kakao 지도 시작하기</title>
</head>
<body>
	<script>
	let replyreplyleftpadding="";
		window.onload = function() {
		/* 	const withOuthtmlCode = extractTextFromHTML($("#content").val());
			$("#content").html(withOuthtmlCode);
			console.log(${boardone.boardNo});
			console.log(${boardone.boardCount}); */
			replyreplyleftpadding=$(".cardwidth").width()*0.03;
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/board/plusCount",
		           data: {  boardCount :${boardone.boardCount},boardNo:${boardone.boardNo}  },
		           success: function (result) {
		        	   console.log("plusCount : success");
					},error : function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			 var moreReply ="";
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/replyboard/list",
		           data: { boardNo:${boardone.boardNo}},
		           success: function (result) {
		        	  for (var i = 0; i < result.length; i++) {
		        		  if(result[i].rref==0){
	        			var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
	    		   		+'<div class="groupbtn"><button class="updatereply">수정</button><button onclick="deletereplyHandler("'+result[i].replyNo+'");">삭제</button><button class="insertreplyreply">댓글 삽입</button>'
	    		   		+'<button class="moreReply" data-replyno="'+result[i].replyNo+'">댓글 더보기</button>';
	    		   	 	if(writerHtml=="${member.memberId}"){
	    		   	 		if(!${boardone.selectReplyNo}){
	    		   			htmlVal+='<button class="forPlusRequtation" onclick="forPlusReputationHandler(\''+result[i].replyNo+'\');">채택하기</button>'  		
	    		   	 		}
	        		    }
	    		   	 	htmlVal+='</div></div><div class="forAppendArea"></div>'
	    		   		$(".testappend").append(htmlVal);
		        		  } //if
		        	   }  // for
    		   	
		        	   $(".updatereply").click(updatereplyHandler);
		        	   $(".insertreplyreply").click(insertreplyreplyHandler);
		        	   $(".moreReply").click(moreReplyHandler);
						if(${boardone.selectReplyNo}!=0){	
						//	$(".forPlusRequtation").remove();
							var firstReply = document.getElementsByClassName('firstReply');
		 					for (var i = 0; i < firstReply.length; i++){
					 			if($(firstReply[i]).data("replyno")==${boardone.selectReplyNo}){
									firstReply[i].classList.add('text-bg-warning');
								}   
							} 
						}
					}, //success
					error : (request, status, error) => {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					dataType:"json"
				});
		}

		function moreReplyHandler(e){
			var rrefReplyNo=$(this).data("replyno");
			var eTarget=e.target;
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/replyboard/moreReplylist",
				data: { rref:rrefReplyNo},
				success : function (result) {
					$(".forAppendArea").html("");
					console.log(result.length);
					if(result.length==0){
						alert("답글이 없습니다.");
					}else{
					 for (var i = 0; i < result.length; i++) {
	        			var  htmlVal =  '<div class="firstReply card"  style="padding-left :'+replyreplyleftpadding+'px" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
	    		   		+'<div class="groupbtn"><button onclick="deletereplyHandler('+result[i].replyNo+');">삭제</button></div>';
	    		   		$(eTarget).parents(".replyCard").find(".forAppendArea").append(htmlVal);
					 }
        		      }  
					 
		        },  // success,
				error : function () {
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
						<label>댓글 작성자 : ${member.memberId}</label>
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
		       data: {memberId: "${member.memberId}" ,replyContent: replyContent, boardNo: $("#boardNo").val(),rstep : ${boardone.bstep}+1 ,rlevel : ${boardone.blevel}+1},
		       success: function (result) {
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
				error : function (){
					 console.log("error");
					},dataType:"json"
			});
		}
		
		function deletereplyHandler(forNumber){
			console.log(forNumber);
			 $.ajax({
			       type: "get",
			       url: "${pageContext.request.contextPath}/replyboard/one",
			       data: {replyNo :forNumber},
			       success: function (result) {
			    	   console.log(result.memberId);
			    	   console.log("${member.memberId}");
			    	
			    	  if(result.memberId != "${member.memberId}"){
			    		   alert("작성자가 아닙니다.");
			    	   }else{
			    		   $.ajax({
						       type: "post",
						       url: "${pageContext.request.contextPath}/replyboard/delete",
						       data: {replyNo :forNumber},
						       success: function (result) {
						    	   location.reload(true);
						    	   },
								error : function (){
									 console.log("error");
									},dataType:"json"
							});
			    	   }; 
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		}
		
		function updatereplyHandler(){
			var replyWriter= $(this).parents(".replyCard").data("writer");
			console.log("test123");
			if(replyWriter=="${member.memberId}"){
			$(this).parents(".replyCard").find(".updatereplyContent").html("");
			$(this).parents(".replyCard").find(".updatereplyDate").hide();
			//$(this).parents(".groupbtn").hide();
			var updateContent ='<textarea rows="3" class="col-xl-12 replyContent" name="replyContent1"></textarea>'
				
			$(this).parents(".replyCard").find(".updatereplyContent").html(updateContent);	
			 var updateDoBtn ='<button type="button" class="updateDoBtn">댓글 수정</button>'
			$(this).parents(".groupbtn").html(updateDoBtn); 
			 $(".updateDoBtn").click(updateDoBtnHandler);
			}else{
				alert("작성자가 아닙니다");
			}
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
			var addreplyreply ='<div class="contenttextarea card replyreplycard" style="padding-left :'+replyreplyleftpadding+'px" data-writer="${member.memberId}"><div>↳작성자 : ${member.memberId}</div><div><textarea rows="3" class="col-xl-12 replyContent" name="replyreplyContent">↳@'+replyreplywriter+'</textarea></div><div><button class="submitreplyreply">답글 저장</button></div></div>'
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
			       data: {memberId:"${member.memberId}",  replyContent : replyreplyContent, boardNo:${boardone.boardNo},rref : $(this).parents(".replyCard").data("replyno") },
			       success: function (result) {
			    	   console.log("success");
			    	   location.reload(true);
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		}
	</script>
</body>
</html>
