<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.acorn.project.service.UserLoginService" %>
<%@ page import="com.acorn.project.DAO.Member_tblDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 수정 화면</title>
<link rel="stylesheet" href="/project/resources/css/update.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container2">

<div class="container">
    <h1>회원정보 변경</h1>
    <form action="/project/form" method="post">
        <label class="input-label">아이디</label>
        <input type="text" name="member_id" value="${member.member_id}" readonly />
        <label class="input-label">이름</label>
        <input type="text" name="mname" value="${member.mname}" />
        <label class="input-label">이메일</label>
        <input type="text" name="email" value="${member.email}" />
        <label class="input-label">비밀번호</label>
        <input type="text" name="mpassword" value="${member.mpassword}" />
        <label class="input-label">나이</label>
        <input type="text" name="age" value="${member.age}" />
        <label class="input-label">성별</label>
        <input type="text" name="gender" value="${member.gender}" />
        <label class="input-label">전화번호</label>
        <input type="text" name="phone" value="${member.phone}" />
        <label class="input-label">자기소개</label>
        <input type="text" name="introduce" value="${member.introduce}" />
        <label class="input-label">등급</label>
        <input type="text" name="grade" value="${member.grade}" />
        <label class="input-label">mbti</label>
        <input type="text" name="mbti" value="${member.mbti}" />
        <label class="input-label">종교</label>
        <input type="text" name="religion" value="${member.religion}" />
        <label class="input-label">직업</label>
        <input type="text" name="job" value="${member.job}" />
       
        <!--  <img src="${member.image}" />-->
     
        <label class="input-label">프로필 사진1</label>
       <img src="/project/resources/images/${selectedImage[0]}" />
       <img src="/project/resources/images/${selectedImage[1]}" />
       <img src="/project/resources/images/${selectedImage[2]}" />
       <input type="file" name="image" value="${member.image}" multiple />
        
        <label class="input-label">키</label>
        <input type="text" name="height" value="${member.height}" />
        <label class="input-label">몸무게</label>
        <input type="text" name="weight" value="${member.weight}" />
        <label class="input-label">이상형</label>
        <input type="text" name="love_type" value="${member.love_type}" />
        <label class="input-label">'like' 개수</label>
        <input type="text" name="like_cnt" value="${member.like_cnt}" />
        <label class="input-label">게임 포인트</label>
        <input type="text" name="game_point" value="${member.game_point}" />
     
        <input type="submit" value="회원 정보 수정하기" />
         <div class="button-container">
          <a href="<%=request.getContextPath()%>/userLogin">처음 화면으로 돌아가기</a> 
          
     </div>
    
    </form>
</div>
</div>
</body>
</html>