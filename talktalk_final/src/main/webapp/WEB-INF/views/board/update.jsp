<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdate</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    h2 {
        text-align: center;
        margin-top: 20px;
    }

    form {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    form input[type="text"],
    form textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        resize: vertical;
    }

    form input[type="submit"],
    form button {
        padding: 10px 20px;
        background-color: #007bff;
        border: none;
        border-radius: 3px;
        color: #fff;
        cursor: pointer;
    }

    form button#btn-board-list {
        background-color: #ccc;
        margin-left: 10px;
    }
</style>
</head>
<body>
<h2>글 수정</h2>

<form id="frmBoard">
	<h3><c:out value="${dto.bno}"/>번글</h3>
	<input type="hidden" name="bno" value="${dto.bno}">
    제목: <input type="text" name="btitle" value="${dto.btitle}">
    <br>
    내용: <textarea rows="10" cols="50" name="bcontent">${dto.bcontent}</textarea>
    <br>
    <button type="button" id="btn-board-update">수정</button> <!-- submit -> button  -->
    <button type="button" id="btn-board-list">메인으로</button>
</form>

<form id="infoForm" action="${pageContext.request.contextPath}/board/update" method="get">
 	<input type="hidden" id="bno" name="bno" value='<c:out value="${dto.bno}"/>'>
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>

<script>   
	let form = $("#infoForm");
	$("#btn-board-list").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/talk/board/list");
		form.submit();
	});
	
	$("#btn-board-update").click(function(){
/* 		if(btitle === ''){
			alert("제목을 입력해주세요");
		}
		if(bcontent === ''){
			alert("내용을 입력해주세요");
		}
		console.log($("#frmBoard").serialize());
*/
	    if(confirm("글 수정하시겠습니까?")){
	        $.ajax({
	            type: "post",
	            url: "${pageContext.request.contextPath}/board/update",
	            data: $("#frmBoard").serialize(),
	            //dataType: "json",
	            success: function(response){
	            	console.log(response);
	                if(response > 0){
	                    alert("글 수정되었습니다.");
	                    location.href = "${pageContext.request.contextPath}/board/list";
	                }else{
	                    alert("글 수정에 실패했습니다.");
	                }
	            }
	        });
   		}
	});

</script>
</body>
</html>