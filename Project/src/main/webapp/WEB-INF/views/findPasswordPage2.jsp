<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'비밀번호 찾기' 결과 출력 화면</title>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #ffffff;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        width: 400px;
        padding: 20px;
        border: 1px solid #89b3ff;
        border-radius: 10px;
        background-color: #ffffff;
    }

    .header {
        text-align: center;
        margin-bottom: 20px;
    }

    .header h1 {
        font-size: 32px;
        color: #333;
        margin: 0;
    }

    .welcome-message {
        font-size: 20px;
        text-align: center;
        margin-bottom: 40px;
    }

    .welcome-message span {
        font-weight: bold;
    }

    .navigation {
        text-align: center;
        margin-bottom: 20px;
    }

    .navigation a {
        display: inline-block;
        margin: 0 10px;
        text-decoration: none;
        color: #333;
        font-weight: bold;
        padding: 5px 10px;
        border: 1px solid #333;
        border-radius: 5px;
        background-color: #fff;
    }

    .navigation a:hover {
        background-color: #333;
        color: #fff;
    }
    
    .button-container {
        text-align: center;
    }

    .button-container a {
        display: inline-block;
        margin: 10px;
        text-decoration: none;
        color: #fff;
        font-weight: bold;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #333;
    }
</style>
</head>
<body>




<div class="container">
    <div class="header">
        <h1>비밀번호</h1>
    </div>

    <div class="welcome-message">
        <c:if test = "${not empty dto.mpassword }">
        <p>  ${dto.getMpassword()}</p>
   </c:if>
    </div>
    
     <div class="button-container">
          <a href="<%=request.getContextPath()%>/userLogin">처음 화면으로 돌아가기</a> 
          
     </div>

 
</div>
</body>
</html>