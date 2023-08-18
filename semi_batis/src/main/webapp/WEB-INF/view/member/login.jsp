<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin: 20px 0;
        color: #007bff;
    }

    .input-container {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .input-label {
        width: 80px;
        padding-right: 10px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"],
    button[type="submit"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    button[type="submit"] {
        background-color: #007bff;
        border: none;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    button[type="submit"]:hover {
        background-color: #0056b3;
    }

    .signup-button,
    .main-button {
        text-align: center;
        margin-top: 15px;
    }

    .signup-button button,
    .main-button a button {
        background-color: #28a745;
    }

    .main-button a button {
        background-color: #28a745;
    }

    .button-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>
</head>
<body>
<div class="container">
    <h2>로그인</h2>
    <form action="<%=request.getContextPath() %>/login.login" method="post">
        <div class="input-container">
            <label for="mid" class="input-label">아이디:</label>
            <input type="text" id="mid" name="mid" required="required">
        </div>
        <div class="input-container">
            <label for="mpwd" class="input-label">비밀번호:</label>
            <input type="password" id="mpwd" name="mpwd" required="required">
        </div>
        <button type="submit">로그인</button>
    </form>
    <div class="button-container">
        <div class="signup-button">
            <form action="<%=request.getContextPath() %>/member/insert" method="get">
                <button type="submit">회원가입</button>
            </form>
        </div>
        <div class="main-button">
            <a href="<%=request.getContextPath() %>/board/list">
                <button>메인으로</button>
            </a>
        </div>
    </div>
</div>
</body>
</html>