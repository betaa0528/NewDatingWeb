<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공 화면</title>
<link rel="stylesheet" href="/project/resources/css/main.css">


</head>
<body>
<%@ include file="header.jsp" %>
<div class="container2">

<div class="container">
    <div class="header">
        <h1>로그인 이후<br> 이용 가능합니다.</h1>
    </div>


    <div class="button-container">
        <button type="button" onclick="javascript:window.location.href='/project/reg'">회원가입</button>
        <button type="button" onclick="javascript:window.location.href='/project/userLogin'">로그인</button>
    </div>
</div>
</div>
</body>
</html>