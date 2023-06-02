<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.acorn.project.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/project/resources/css/chatting_room.css">

<%
	//참고자료: https://joonpyo-hong.tistory.com/entry/Ajax-Ajax-Controller-%EA%B0%92parameter-%EB%84%98%EA%B8%B0%EA%B8%B0-%EB%B0%9B%EA%B8%B0
%>
</head>

<%
	String[] myInfo= (String[]) request.getAttribute("myInfo");
	String[] opponentInfo= (String[]) request.getAttribute("opponentInfo");
	ArrayList<String[]> opponentsInfo= (ArrayList<String[]>) request.getAttribute("opponentsInfo");
	ArrayList<String[]> chatRecord= (ArrayList<String[]>) request.getAttribute("chatRecord");
%>

<script type="text/javascript">
    

</script>

<script>

let id1= "<%=myInfo[0]%>";
let img1 = "<%=myInfo[1]%>";
</script>
<%
	request.setCharacterEncoding("UTF-8");

%>
<body>
<%@ include file="header.jsp" %>

<section>
		<div class="side_box">
			<div class="side side_small left">
			</div>
			<div class="side side1">
			현재 날짜는?
			</div>
			<div class="side side_small left">
			</div>
		</div>
	
		<div id="chat_container">
		<div id="chat_header">
			<div id="container_1">
			<a href="#" id="chat_back">
				<img src="resources/images/back.png" width = 30px; >
			</a>
			<span id="opponent">채팅 상대를 고르세요</span>
			</div>
			
			
			<div>
			<a href="#" id="report_btn">
				<img src="resources/images/siren.png" width = 30px; >
			</a>
			<a href="#" >
				<img src="resources/images/exit.png" width = 30px; id="chat_exit">
			</a>
			</div>
			
		</div>
		<div id="chat_section">
			
		</div>
		<div id="chat_footer">
		</div>
	</div>

	<div id="chat_container2">
		
			<div class="white bar1">메세지</div>
			
		<div id="chat_section2">
				<%
					for(int i=0;i<opponentsInfo.size();i++){
				%>
					<a href="<%=request.getContextPath()%>/chatting_room?id=<%=opponentsInfo.get(i)[1]%>">
					
					<div class="member_box">
						<div class="member_img_box">
							<img src="<%=opponentsInfo.get(i)[4]%>" width="70px" height="70px" class="circle" >
						</div>
						<div>
							<div class="size14 member_img_box_1"><%=opponentsInfo.get(i)[3]%></div>
							<div class="size12 member_img_box_2"><%=opponentsInfo.get(i)[2]%></div>
						</div>
					</div>
					</a>
				<%
					}
				%>
		</div>
		
	</div>
	
		<div class="side_box">
	<div class="side side_small right">
			</div>
	<div class="side side2">
			현재 시간은?
		</div>
		<div class="side side_small right">
			</div>
	</div>
	
	
	
	
</section>
<footer>
</footer>
</body>
<script>
setInterval(()=>{
	let allDate= new Date();
	let month = allDate.getMonth()+1;
	let side1= document.querySelector(".side1");
	let side2= document.querySelector(".side2");
	side1.innerHTML="현재날짜: "+allDate.getFullYear()+"년"+month+"월"+allDate.getDate()+"일";
	side2.innerHTML="현재시간: "+allDate.getHours()+"시"+allDate.getMinutes()+"분"+allDate.getSeconds()+"초";
},1000);
			</script>
</html>
