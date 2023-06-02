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
<div class="container2">
<%@ include file="header.jsp" %>


<section>

    <h1>회원정보 변경</h1>
    <form action="/project/form" method="post">
         <div class="form-field">
        <label class="input-label">아이디</label>
        <input type="text" name="member_id" value="${member.member_id}" readonly />
        </div>
        
        <div class="form-field">
        <label class="input-label">이름</label>
        <input type="text" name="mname" value="${member.mname}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">이메일</label>
        <input type="text" name="email" value="${member.email}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">비밀번호</label>
        <input type="text" name="mpassword" value="${member.mpassword}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">나이</label>
        <input type="text" name="age" value="${member.age}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">성별</label>
        <input type="text" name="gender" value="${member.gender}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">전화번호</label>
        <input type="text" name="phone" value="${member.phone}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">자기소개</label>
        <input type="text" name="introduce" value="${member.introduce}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">등급</label>
        <input type="text" name="grade" value="${member.grade}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">mbti</label>
        <input type="text" name="mbti" value="${member.mbti}" />
         </div>
         
        
        <div class="form-field">
        <label class="input-label">종교</label>
        <input type="text" name="religion" value="${member.religion}" />
        </div>
        
        <div class="form-field">
        <label class="input-label">직업</label>
        <input type="text" name="job" value="${member.job}" />
       </div>
       
        <!--  <img src="${member.image}" />-->
        <div class="form-field">
        <label class="input-label">프로필 사진1</label>
        <div class="image-container">
        <img src="/project/resources/images/${selectedImage[0]}" />
        <img src="/project/resources/images/${selectedImage[1]}" />
        <img src="/project/resources/images/${selectedImage[2]}" />
        </div>
       <input type="file" name="image" value="${member.image}" multiple />
        </div>
         
        <div class="form-field">
        <label class="input-label">키</label>
        <input type="text" name="height" value="${member.height}" />
         </div>
         
        <div class="form-field">
        <label class="input-label">몸무게</label>
        <input type="text" name="weight" value="${member.weight}" />
         </div>
         
        <div class="form-field">
        <label class="input-label">이상형</label>
        <input type="text" name="love_type" value="${member.love_type}" />
         </div>
         
        <div class="form-field">
        <label class="input-label">'like' 개수</label>
        <input type="text" name="like_cnt" value="${member.like_cnt}" />
         </div>
         
        <div class="form-field">
        <label class="input-label">게임 포인트</label>
        <input type="text" name="game_point" value="${member.game_point}" />
         </div>
         
         <div class="like-field">
        <input type="hidden" name="like_type1" value="${member.like_type1}" />
         </div>
         <div class="like-field">
        <input type="hidden" name="like_type2" value="${member.like_type1}" />
         </div>
         <div class="like-field">
        <input type="hidden" name="like_type3" value="${member.like_type1}" />
         </div>
         <div class="like-field">
        <input type="hidden" name="like_type4" value="${member.like_type1}" />
         </div>
         
       <div class = "button-box">
       
        <input type="submit" value="회원 정보 수정하기" />
     
         </div>
         
         <div class="button-container">
          <a href="<%=request.getContextPath()%>/userLogin">처음 화면으로 돌아가기</a>         
     </div>
     
    
    </form>
    
      
  </section>


</div>

</body>
</html>