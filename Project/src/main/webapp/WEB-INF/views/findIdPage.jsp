<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'아이디 찾기' 결과 출력 화면</title>
<link rel="stylesheet" href="/project/resources/css/findIdPage.css">
</head>
<body>
   
    <%@ include file="header.jsp" %>
    
    <section>
   <form method="post" action="/project/page">
   <div id="title">아이디 찾기</div>
   <div>
   <input type="text" name="myMname" placeholder="이름"> <br>
   <input type="text" name="myEmail" placeholder="이메일"><br>
   <input type="submit" value="아이디 찾기">
   </div>
   
   <div>
        <%-- 오류 메시지가 있는 경우에만 표시 --%>
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>
    </div>
   
   </form>
   
</section>


</body>
</html>