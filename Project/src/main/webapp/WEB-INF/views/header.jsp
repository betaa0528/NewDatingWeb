<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/project/resources/css/header.css">

	<header>
	
			<div class="contain">
				<div class="logo">
					<a href="/project ">
					<img src="resources/images/로고.png"></a>
				</div>
		<%
		HttpSession session2 = request.getSession();
		String sessionId = (String)session.getAttribute("sessionId");
		if(sessionId==null){
			%>
			<div class="category"> 
					<a href="/project/main">매칭</a>
					<a href="/project/main">평가</a>
					<a href="/project/main">게시판</a>
					<a href="/project/main">게임</a>
					<a href="/project/main">채팅</a>
				</div>
				<div class="mypage"> 
					<a href="/project/userLogin">로그인</a>
					
					<a href="/project/mypage">마이페이지</a>
				</div>
			
			<% 
		}else{
			%>
			<div class="category"> 
					<a href="/project/test22">매칭</a>
					<a href="/project/firstimpression">평가</a>
					<a href="/project/board">게시판</a>
					<a href="/project/map2">게임</a>
					<a href="/project/chatting_room2">채팅</a>
				</div>
				<div class="mypage"> 
					<a href="/project/userLogout">로그아웃</a>
					<a href="/project/mypage">마이페이지</a>
				</div>
			<%
		}
		%>
				
		
			
			</div>
	</header>
