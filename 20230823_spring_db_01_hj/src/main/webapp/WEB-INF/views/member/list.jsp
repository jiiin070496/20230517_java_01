<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
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

.btn-container {
    text-align: center;
    margin-top: 20px;
}
.btn-container button {
    padding: 10px 20px;
    background-color: #007bff;
    border: none;
    border-radius: 3px;
    color: #fff;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.2s;
    margin-right: 10px;
}
.btn-container button:last-child {
    margin-right: 0;
}
.btn-container button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <script>
        var msg = '${msg}';
        if (msg) {
            alert(msg);
        }
    </script>    
    <script>
        var msg = '${msg2}';
        if (msg) {
            alert(msg);
        }
    </script>
<div class="title">
	<h2> 쿵's 회원정보 </h2>
</div>
<a href="/board/get/${bno }"></a>
<c:if test="${not empty memberList }">
    <p>총 <c:out value="${fn:length(memberList)}" /> 명의 회원이 있습니다</p>
    <table class="styled-board">
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>이메일</th>
        </tr>
        <c:forEach items="${memberList }" var="vo">
            <tr>
                <td>${vo.mid }</td>
                <td>${vo.mpwd }</td>
                <td>${vo.mname }</td>
                <td>${vo.memail }</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<hr>
[[
${memberList }
]] 
<hr>
</body>
</html>