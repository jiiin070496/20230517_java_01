<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
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
<div class="title">
    <h2>게시판</h2>
</div>
<div>
	<br>
    <c:choose>
        <c:when test="${not empty SsLoginId}">
            [<%= request.getSession().getAttribute("SsLoginId") %>]님 반갑습니다
        </c:when>
        <c:otherwise>
            게시글을 읽으시려면 로그인이 필요합니다.
        </c:otherwise>
    </c:choose>
    	
    <script>
        var msg = '${successFailMsg}';
        if (msg) {
            alert(msg);
        }
    </script>
</div>
<c:if test="${not empty boardList }">
    <p>총 <c:out value="${fn:length(boardList)}" />개의 게시물이 있습니다</p>
    <table class="styled-board">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <c:forEach items="${boardList }" var="vo">
            <tr>
                <td>${vo.bno }</td>
                <td>
                    <a href="<c:url value='/board/read'/>?bno=${vo.bno }">
                        <c:forEach begin="1" end="${vo.breLevel }">&#8618; </c:forEach>
                        ${vo.btitle }
                    </a>
                </td>
                <td>${vo.mid }</td>
                <td>${vo.bwriteDate }</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<div class="btn-container">
    <c:choose>
        <c:when test="${not empty SsLoginId}">
            <button onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>
        </c:when>
        <c:otherwise>
            <button onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${not empty SsLoginId}">
            <a href="<c:url value='/board/insert'/>">
                <button>글 등록</button>
            </a>
        </c:when>
    </c:choose>
</div>
<div class="footer">
    <p>copyright (c) FOOTER</p>
</div>
</body>
</html>