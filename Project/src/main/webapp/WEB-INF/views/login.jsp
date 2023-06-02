<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 시작 화면</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/project/resources/css/login.css">

<script>
   function formCheck(frm) {
       let msg = '';
       if (frm.id.value.length === 0) {
           setMessage('아이디를 입력해주세요.', frm.id);
           return false;
       } else if (frm.pw.value.length === 0) {
           setMessage('비밀번호를 입력해주세요.', frm.pw);
           return false;
       } else {
           frm.submit();
       }
       return true;
   }

   function setMessage(msg, tag) {
       alert(msg);
       tag.focus();
   }
</script>
</head>
<body>
<div class="wrap">
<%@ include file="header.jsp" %>
<div class="container">
   <form action="<c:url value='/userLogin'/>" method="post" onsubmit="return formCheck(this);">
       <h3 id="title">Login</h3>
       <div id="msg">
           <!-- 에러 메시지 -->
           <c:if test="${not empty errorMsg}">
               <span class="fa fa-exclamation-circle"></span>
               <span>${errorMsg}</span>
           </c:if>
       </div>
       
       <input type="text" name="id" placeholder="아이디" /><br />
       <input type="password" name="pw" placeholder="비밀번호" /><br />
       <button type="submit">로그인</button>
       <span>아이디가 없으신가요 ? <a href="/project/reg">회원가입</a> </span>     
   
 </form>
   <div class="button-container">
           <p>OR</p>
           <!-- 아이디 찾기 -->
           <button class="small-button1" type="button" onclick="javascript:window.location.href='/project/page'">아이디 찾기</button>
           <!-- 비밀번호 찾기 -->
           <button class="small-button2" type="button" onclick="javascript:window.location.href='/project/page2'">비밀번호 찾기</button>
   </div>
   
 </div>
</div> 
</body>
</html>