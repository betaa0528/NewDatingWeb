<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 화면</title>
<link rel="stylesheet" href="/project/resources/css/logout.css">

</head>
<body>
<%@ include file="header.jsp" %>

<div class = "container2">
   <div class = "container">
      <div class = "message">
         <p>로그아웃됐습니다.</p>
      </div>
      <div class="button-container">
          <a href="<%=request.getContextPath()%>/userLogin">처음 화면으로 돌아가기</a> 
          
     </div>
   </div>
</div>

</body>
</html>