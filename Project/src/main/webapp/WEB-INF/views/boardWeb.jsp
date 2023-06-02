<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link href="${path}/resources/css/board.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<div class="titleWrap">
		<div class="community">
			<span>Community</span>
		</div>
		<% if(sessionId!=null){ %>
			<div class="createContent">
				<button onclick="cancelButtonClicked()">나도 글쓰기! &#128289;</button>
			</div>
		<% } %>
	</div>

	<div class="container">
		<c:forEach var="item" items="${boards}">
		    <div class="card">
	            
	           	<c:if test="${item.showLinks}">
	           		<a href="/project/board/delete/${item.memberId }" class="delete">x</a>
	           	</c:if>
	                <c:choose>
		                <c:when test="${item.imgName != null}">
		                	<img src="external/게시판사진/${item.imgName }" class="profile-avatar" alt="">
		                </c:when>
		                <c:when test="${item.imgName == null }">
		                	<div class="noImg"></div>
		                </c:when>
	                 </c:choose>
	            <div class="contentBox">
	               <h4>${item.content }</h4>
				</div>
	        </div>
		</c:forEach>
	</div>
</section>

<script>
    // 이미지가 없는 카드의 배경색을 랜덤으로 변경하는 함수
    function setRandomBackgroundColor() {
        var cards = document.getElementsByClassName("card");

        for (var i = 0; i < cards.length; i++) {
            var card = cards[i];
            var div = card.querySelector(".noImg");
            

            if (div) {
                var randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);
                div.style.backgroundColor = randomColor;
            }
        }
    }

    // 페이지가 로드되었을 때 배경색 변경 함수 호출
    window.onload = function () {
        setRandomBackgroundColor();
    };
    
    function cancelButtonClicked() {
        window.location.href = "/project/board/create";
    }
</script>
</body>
</html>