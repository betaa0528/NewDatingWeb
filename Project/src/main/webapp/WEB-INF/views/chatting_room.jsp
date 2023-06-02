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
    
   
     let wsocket;
    
    	 wsocket = new WebSocket(
         "ws://localhost:8090/project/chat-ws");

 		wsocket.onopen = onOpen;
 		wsocket.onmessage = onMessage;
 		wsocket.onclose = onClose;
	   
    function disconnect() {
        wsocket.close();
    }
        
    
     
    function onOpen(evt) {
    	console.log("연결되었습니다.");
    }
     
    function onMessage(evt) {
        var data = evt.data;
        if (data!="") {
        	receive(data);

        }
    }
    
     
    function onClose(evt) {
      // appendMessage("연결을 끊었습니다.");
      console.log("연결을 끊었습니다");
    }
    
   

    

    
    function  scrollTop(){
    	  var chatAreaHeight = $("#chatArea").height();         
          var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;  
          $("#chatArea").scrollTop(maxScroll);
    }
    


 
  
   $(document).ready( function(){    
	 
           $('#message').keypress(function(event){
		   var keycode =  event.keyCode  ;		            
		  
		       if(keycode == '13'){		    	  
		                send(); 
		       }  		 
		            event.stopPropagation();  // 상위로 이벤트 전파 막음
		        });
       
		        $('#sendBtn').click(function() { send(); });
		        $('#enterBtn').click(function() { connect(); });
		        $('#exitBtn').click(function() { disconnect(); });
	   
	   
   });
</script>

<script>

let id1= "${myInfo[0]}";
let id2= "${opponentInfo[0]}";
let img1 = "${myInfo[1]}";
let img2 = "${opponentInfo[1]}";
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
			<a href="/project/chatting_room2" id="chat_back">
				<img src="resources/images/back.png" width = 30px; >
			</a>
			<span id="opponent"><%=opponentInfo[2]%></span>
			</div>
			
			
			<div>
			<a href="#" id="report_btn">
				<img src="resources/images/siren.png" width = 30px; >
			</a>
			<a href="/project/chatting_room2" >
				<img src="resources/images/exit.png" width = 30px; id="chat_exit">
			</a>
			</div>
			
		</div>
		<div id="chat_section">
			
		</div>
		<div id="chat_footer">
			<input type="text" id="chat_input">
			<input type="button" value="전송" id="chat_btn" onclick="send()">
		</div>
	</div>

	<% if(chatRecord!=null){%>
	<div id="chat_container2">
		
			<div class="white bar1">메세지</div>
			
		<div id="chat_section2">
				<%
					for(int i=0;i<opponentsInfo.size();i++){
				%>
					<a href="<%=request.getContextPath()%>/chatting_room?id=<%=opponentsInfo.get(i)[1]%>">
					
					<div class="member_box">
						<div class="member_img_box">
							<img src="<%=opponentsInfo.get(i)[4]%>" width="65px" height="65px" class="circle" >
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
	
	<% }%>
	
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

	
	function send(){
		let chat_section= document.querySelector("#chat_section");
		let chat_input= document.querySelector("#chat_input");
		let chatBox= document.createElement("div");
		
		chatBox.style.display= "flex";
		chatBox.style.marginBottom="30px";
		chatBox.style.width="360px";
		chatBox.style.height="50px";
		chatBox.style.float="right";
		
		let chatContent= document.createElement("div");
				
		let chatContent2= document.createElement("div");
		chatContent2.innerHTML=chat_input.value;
		chat_input.value="";
		chatContent2.style.boxShadow="1.5px 1.5px 1.5px 1.5px grey" ;
		chatContent.style.display="inline-block"
		chatContent2.style.padding="10px";
		chatContent2.style.color="white";
		chatContent2.style.width="300px";
		chatContent2.style.wordBreak="break-all";
		chatContent2.style.background="#5882FA";
		chatContent2.style.borderRadius="10px";
		chatContent2.style.marginRight="10px";
		
		let chatContentTime= document.createElement("div");
		let date= new Date();
		let when;
		let hour= date.getHours();
		let minutes = date.getMinutes();
		if(hour >=13){
			hour -= 12;
			when="오후";
		}else if(hour >=12){
			when="오후";
		}else{
			when="오전";
		}
		

		if(hour<10){
			hour = "0"+hour;
		}
		if(minutes<10){
			minutes = "0"+minutes;
		}
		hour += "";
		chatContentTime.innerHTML=when+" "+hour+":"+minutes;
		chatContentTime.style.fontSize="10px";
		chatContentTime.style.textAlign="right";
		chatContentTime.style.marginRight="5px";
		chatContentTime.style.marginTop="5px";

		chatContent.appendChild(chatContent2);
		chatContent.appendChild(chatContentTime);
		
		let chatImg= document.createElement("img");
		chatImg.src=img1;
		chatImg.style.width="50px";
		chatImg.style.height="50px";
		chatImg.style.borderRadius="50%";

		chatBox.appendChild(chatContent);
		chatBox.appendChild(chatImg);

		if(chatContent2.innerHTML!="" && chatContent2.innerHTML!=" "){
		chat_section.appendChild(chatBox);
		wsocket.send(chatContent2.innerHTML);  
		goInsert(chatContent2.innerHTML,id1,id2);
		chat_section.scrollTop = chat_section.scrollHeight;
		}
	}
	
	function receive(data){
		let chat_section= document.querySelector("#chat_section");
		let chat_input= document.querySelector("#chat_input");
		let chatBox= document.createElement("div");
		
		chatBox.style.display= "flex";
		chatBox.style.marginBottom="30px";
		chatBox.style.width="360px";
		chatBox.style.height="50px";
		
		let chatContent= document.createElement("div");
		chatContent.style.display="inline-block";
		
		let chatContent3= document.createElement("div");
		chatContent3.innerHTML=data; //이 부분에 상대의 메시지를 넣으면 된다.
		chatContent3.style.boxShadow="1.5px 1.5px 1.5px 1.5px grey" ;
		chatContent3.style.padding="10px";
		chatContent3.style.width="300px";
		chatContent3.style.wordBreak="break-all";
		chatContent3.style.background="aliceblue";
		chatContent3.style.borderRadius="10px";
		chatContent3.style.marginRight="10px";
		
		let chatContentTime= document.createElement("div");
		let date= new Date();
		let when;
		let hour= date.getHours();
		let minutes = date.getMinutes();
		if(hour >=12){
			hour -= 12;
			when="오후";
		}else{
			when="오전";
		}
		if(hour.trim().length==1){
			hour = "0"+hour;
		}
		if(minutes.length==1){
			minutes = "0"+minutes;
		}
		
		chatContentTime.innerHTML=when+" "+hour+":"+minutes;
		chatContentTime.style.fontSize="10px";
		chatContentTime.style.textAlign="left";
		chatContentTime.style.marginTop="5px";

		chatContent.appendChild(chatContent3);
		chatContent.appendChild(chatContentTime);
		
		let chatImg= document.createElement("img");
		chatImg.src=img2;
		chatImg.style.width="50px";
		chatImg.style.height="50px";
		chatImg.style.borderRadius="50%";


		chatBox.appendChild(chatImg);
		chatBox.appendChild(chatContent);

		
		if(chatContent3.innerHTML!="" && chatContent3.innerHTML!=" "){
			chat_section.appendChild(chatBox);
			chat_section.scrollTop = chat_section.scrollHeight;
			}
	}
	
	function send2(oldMsg, oldDate){
		let chat_section= document.querySelector("#chat_section");
		let chat_input= document.querySelector("#chat_input");
		let chatBox= document.createElement("div");
		
		chatBox.style.display= "flex";
		chatBox.style.marginBottom="30px";
		chatBox.style.width="360px";
		chatBox.style.height="50px";
		chatBox.style.float="right";
		
		let chatContent= document.createElement("div");
				
		let chatContent2= document.createElement("div");
		chatContent2.innerHTML=oldMsg;
		chatContent2.style.boxShadow="1.5px 1.5px 1.5px 1.5px grey" ;
		chatContent.style.display="inline-block"
		chatContent2.style.padding="10px";
		chatContent2.style.color="white";
		chatContent2.style.width="300px";
		chatContent2.style.wordBreak="break-all";
		chatContent2.style.background="#5882FA";
		chatContent2.style.borderRadius="10px";
		chatContent2.style.marginRight="10px";
		
		let chatContentTime= document.createElement("div");
		
		chatContentTime.innerHTML=oldDate;
		chatContentTime.style.fontSize="10px";
		chatContentTime.style.textAlign="right";
		chatContentTime.style.marginRight="7px";
		chatContentTime.style.marginTop="5px";


		chatContent.appendChild(chatContent2);
		chatContent.appendChild(chatContentTime);
		
		let chatImg= document.createElement("img");
		chatImg.src=img1;
		chatImg.style.width="50px";
		chatImg.style.height="50px";
		chatImg.style.borderRadius="50%";

		chatBox.appendChild(chatContent);
		chatBox.appendChild(chatImg);

		if(chatContent2.innerHTML!="" && chatContent2.innerHTML!=" "){
		chat_section.appendChild(chatBox);
		chat_section.scrollTop = chat_section.scrollHeight;
		}
	}
	
	function receive2(oldMsg, oldDate){
		let chat_section= document.querySelector("#chat_section");
		let chat_input= document.querySelector("#chat_input");
		let chatBox= document.createElement("div");
		
		chatBox.style.display= "flex";
		chatBox.style.marginBottom="30px";
		chatBox.style.width="360px";
		chatBox.style.height="50px";
		
		let chatContent= document.createElement("div");
		chatContent.style.display="inline-block";
		
		let chatContent3= document.createElement("div");
		chatContent3.innerHTML=oldMsg; //이 부분에 상대의 메시지를 넣으면 된다.
		chatContent3.style.boxShadow="1.5px 1.5px 1.5px 1.5px grey" ;
		chatContent3.style.padding="10px";
		chatContent3.style.width="300px";
		chatContent3.style.wordBreak="break-all";
		chatContent3.style.background="aliceblue";
		chatContent3.style.borderRadius="10px";
		chatContent3.style.marginRight="10px";
		
		let chatContentTime= document.createElement("div");
		
		chatContentTime.innerHTML=oldDate;
		chatContentTime.style.fontSize="10px";
		chatContentTime.style.textAlign="left";
		chatContentTime.style.marginTop="5px";

		chatContent.appendChild(chatContent3);
		chatContent.appendChild(chatContentTime);
		
		let chatImg= document.createElement("img");
		chatImg.src=img2;
		chatImg.style.width="50px";
		chatImg.style.height="50px";
		chatImg.style.borderRadius="50%";


		chatBox.appendChild(chatImg);
		chatBox.appendChild(chatContent);

		
		if(chatContent3.innerHTML!="" && chatContent3.innerHTML!=" "){
			chat_section.appendChild(chatBox);
			chat_section.scrollTop = chat_section.scrollHeight;
			}
	}
	
		function goInsert(chatInfo1,chatInfo2,chatInfo3){
			 $.ajax({
	              url: "/project/insert",
	              type: "POST",
	              dataType: "json",
	              data: {
	            	  info1: chatInfo1,
				    	info2: chatInfo2,
				    	info3: chatInfo3
	              },
	              success: function(data){
	                  console.log(data);
	              },
	              error: function(err){
	                  console.log(err);

	              }
	          });
		}
	
		window.addEventListener('load', function()
				{
			<%
			
			for(int i=0; i<chatRecord.size();i++){
				

				if(chatRecord.get(i)[0].equals(myInfo[0])){
					%>
					send2("<%=chatRecord.get(i)[1]%>", "<%=chatRecord.get(i)[2]%>");
					<%
				}else if(chatRecord.get(i)[0].equals(opponentInfo[0])){
					%>
					receive2("<%=chatRecord.get(i)[1]%>", "<%=chatRecord.get(i)[2]%>");

					<%
				}
			}
		%>
				});
		
		
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
