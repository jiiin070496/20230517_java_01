<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<form id="repBoard">
		<input type="hidden" name="ref" value="${dto.ref }" />
		<input type="hidden" name="breLevel" value="${dto.rlevel }" />
		<input type="hidden" name="breStep" value="${dto.rstep }" />
		<table>
			<tr>
				<th class="w-px160">제목</th>
				<td><input type="text" name="btitle" class="need"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.mid }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="bcontent" class="need"></textarea></td>
			</tr>
		</table>
			<button type="button" id="btn-board-rinsert">댓글 등록</button>
	</form>
<script>
$("#btn-board-rinsert").click(function() {	
    const btitle = $("input[name='btitle']").val().trim();
    const bcontent = $("textarea[name='bcontent']").val().trim();
    if(btitle ===''){
    	alert("제목을 입력해주세요");
    	return;
    }
    if(bcontent ===''){
    	alert("내용을 입력해주세요");
    	return;
    }
    if (confirm("글을 등록하시겠습니까?")) {
    	/* $("#btn-board-insert").prop("disabled", true); */
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/rinsert?bno=${dto.bno}",
            //dataType: "json",
         	 data: { 
                btitle: btitle,
                bcontent: bcontent
            },
            success: function(response) {
                if (response > 0) {
                    alert("댓글 등록되었습니다.");
                    location.href = "${pageContext.request.contextPath}/board/list";
                } else {
                    alert("댓글 등록에 실패했습니다.");
                }
            }
        });
    }
});
</script>
</body>
</html>