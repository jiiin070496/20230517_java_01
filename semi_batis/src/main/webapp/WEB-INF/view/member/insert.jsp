<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

    div {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
        margin-bottom: 10px;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    input[type="text"],
    input[type="password"],
    button[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    button[type="submit"] {
        background-color: #007bff;
        border: none;
        color: #fff;
        cursor: pointer;
    }
</style>
</head>
<body>
<h2>회원가입</h2>
<div>
  	<form action="<%=request.getContextPath() %>/member/insert.do" method="get">
        <table>
            <tr>
                <th>아이디</th>
                <td>
                <input type="text" pattern="[a-z0-9]{5,20}" 
                title="영문자 소문자, 숫자 포함 5~20자로 입력해주세요." name="mid" required>
                </td>
            </tr>
      		<tr>
    			<th>비밀번호</th>
   				<td>
        		<input type="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@?*])[a-zA-Z0-9!@?*]{8,30}$" 
	        		title="영문자 대/소문자, 숫자, 특수문자(!,@,?,*)를 하나 이상 포함하여  8~30자로 입력해주세요."
	        		 name="mpwd" 
	        		 required>
			    </td>
			</tr>
            <tr>
                <th>이름</th>
                <td>
                <input type="text" pattern="[가-힣]{1,10}" title="한글로 다시 입력해주세요." name="mname" required>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                <input type="email" name="memail" placeholder="example@gmail.com">
                </td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="tel" pattern="[0-9]{10,11}" title="숫자만 입력해주세요." name="mphoneno" placeholder="-없이 입력해주세요." required></td>
            </tr>
        </table>
        <button type="submit" id="btn-member-signup">회원등록</button>
    </form>
</div>
<script>
	var msg = '${sfMsg}';
	if (msg) {
	    alert(msg);
	}
</script>
</body>
</html>