<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'아이디 찾기' 결과 출력 화면</title>
<link rel="stylesheet" href="/project/resources/css/findIdPage2.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section>

<div class="container">
    <div class="header">
        <h1>아이디</h1>
    </div>

    <div class="welcome-message">
        <c:if test = "${not empty dto.member_id }">
        <p> ${dto.member_id}</p>
   </c:if>
    </div>
    
     <div class="button-container">
          <a href="<%=request.getContextPath()%>/userLogin">로그인 화면으로 돌아가기</a>           
     </div>

  </div>

</section>

</body>
</html>