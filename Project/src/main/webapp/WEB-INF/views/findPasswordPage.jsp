<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'비밀번호 찾기' 시작 화면</title>
<link rel="stylesheet" href="/project/resources/css/findPasswordPage.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section>

    <form method="post" action="/project/page2">
    <div id="title">비밀번호 찾기</div>
    <div id="errorMsg">
    <input type="text" name="myMember_id" placeholder="아이디"><br>
    <input type="text" name="myEmail2" placeholder="이메일"><br>
    <input type="submit" value="비밀번호 찾기">
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