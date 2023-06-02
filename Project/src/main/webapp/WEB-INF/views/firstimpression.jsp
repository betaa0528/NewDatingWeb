<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/project/resources/css/firstImpression.css">
</head>
<body>
<%@include file="header.jsp" %>
<section>
<div class="container">
    <form action="<c:url value='/firstimpression' />" method="post">
        <div class="wrap">
            <div class="profile">
            	<c:choose>
	            	<c:when test="${list != null }">
		                <c:forEach var="item" items="${list }">
		               		<img alt="" src="external/회원사진/${item.imgName }">
		               		<div class="introduce">${item.introduce }</div>
		               		<input type="hidden" value="${item.id }" id="showid">
		                </c:forEach>
	                </c:when>
                	<c:when test="${list ==null }">
                		<div class="nullMember">
                			<h2>죄송합니다 ! 평가할 회원이 없네요</h2>
                		</div>
                	</c:when>
                </c:choose>
            </div>
            <div class="btnBox">
                <button value="1" onclick="likeCntUp(this)">신고할뻔, 혼인신고</button>
                <button value="2" onclick="likeCntUp(this)">시원시원, 완전 쿨해보여요</button>
                <button value="3" onclick="likeCntUp(this)">순둥순둥 착할거같아요</button>
                <button value="4" onclick="likeCntUp(this)">푸~근하게 알던사이 같은데요?</button>
            </div>
        </div>
    </form>
</div>
</section>
</body>
</html>
<script>
    function likeCntUp(a){
        var btnVal = a.value;
        var showid = $('#showid').val();
        
        console.log(btnVal);
        $.ajax({ 
            url :'/project/firstimpression/firstimpressionUp',
            type : 'post',
            data : {"btnVal" : btnVal, "showid" : showid}, 
            success: function(data){ 
                console.log("진짜");
            }, error : function(){
            	console.log("실패 ㅠ");
            }
        });
    }
</script>