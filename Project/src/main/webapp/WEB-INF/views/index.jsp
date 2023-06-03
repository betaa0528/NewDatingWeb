<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title> Dating Web </title>
<style>
html,body {width:100%;height:100%;margin:0px;padding:0px;overflow:hidden;font-family:sans-serif;}
	
	#fullpage {position:relative;top:0px;z-index:9;width:100%;height:100%;}
	.fullsection{width:100%;height:100%;position:relative;}
	.full1{background:white;}
	.full2{background:yellow;}
	.full3{background:green;}
	.full4{background:blue;}
	.full5{background:rgb(255, 53, 127);}
	#fullpage span{display:block;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);color:#fff;font-size:4em;font-weight:bold;}
	.full2 span{color:#000;}

	ul, li{margin:0;padding:0;list-style:none}
	.quick {position:fixed;right:20px;top:50%;transform:translateY(-50%); z-index:100000}
	.quick li {width:10px;height:10px;margin-bottom:10px; border-radius:15px;border:2px solid #747474;cursor:pointer;}
	.quick .on {background:#b4b4b481;}


	video{
			position: relative;
	 		top: -50px;
		}

	.full5 a{
		text-decoration: none;
		color: rgb(255, 53, 127);
		font-size: 30px;
		font-weight: bold;
		position: relative;
		top: 620px;
		padding: 20px;
		margin: 15px;
		background-color: white;
		border-radius: 40px 80px;
	}
	.full5{
		text-align: center;
	}
	.full5 img{
		width: 38px;
		margin-right: 20px;
	}
</style>
</head>
<body>
	
<%@ include file="header.jsp" %>
	<div id="fullpage">
		<div class='quick'><ul></ul></div>
		<div class="fullsection full1" pageNum="1"><span><video src="resources/images/couple-148598.mp4" controls loop autoplay muted></video></span></div>
		<div class="fullsection full2" pageNum="2"><span><img src="resources/images/2page.png"></span></div>
		<div class="fullsection full3" pageNum="3"><span><img src="resources/images/3page.png"></span></div>
		<div class="fullsection full4" pageNum="4"><span><img src="resources/images/4page.png"></span></div>
		<div class="fullsection full5" pageNum="5">
			<span> 지금 사사모 에서 새로운 <br>인연을 만나보세요  </span>
			<a href="/project/userLogin"><img src="resources/images/회원가입.png">Sign up !</a>
			<a href="/project/reg"><img src="resources/images/로그인.png">Sign in !</a>
		</div>
	</div>
	

</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script>
$(document).ready(function(){
	fullset();
	quickClick();
});
function fullset(){
	var pageindex = $("#fullpage > .fullsection").size(); //fullpage 안에 섹션이(.fullsection) 몇개인지 확인하기
	for(var i=1;i<=pageindex;i++){
		$("#fullpage > .quick > ul").append("<li></li>");
	}
	$("#fullpage .quick ul :first-child").addClass("on"); //일단 화면이 로드 되었을때는 퀵버튼에 1번째에 불이 들어오게
	//마우스 휠 이벤트
	$(window).bind("mousewheel", function(event){
		var page = $(".quick ul li.on");
		//alert(page.index()+1);  // 현재 on 되어있는 페이지 번호
		if($("body").find("#fullpage:animated").length >= 1) return false;
		//마우스 휠을 위로
		if(event.originalEvent.wheelDelta >= 0) {
			var before=page.index();
			if(page.index() >= 0) page.prev().addClass("on").siblings(".on").removeClass("on");//퀵버튼옮기기
			var pagelength=0;
			for(var i=1; i<(before); i++)
			{
				pagelength += $(".full"+i).height();
			}
			if(page.index() > 0){ //첫번째 페이지가 아닐때 (index는 0부터 시작임)
				page=page.index()-1;
				$("#fullpage").animate({"top": -pagelength + "px"},1000, "swing");
			}else{
				//alert("첫번째페이지 입니다.");
			}	
		}else{ // 마우스 휠을 아래로	
			var nextPage=parseInt(page.index()+1); //다음페이지번호
			var lastPageNum=parseInt($(".quick ul li").size()); //마지막 페이지번호
			//현재페이지번호 <= (마지막 페이지 번호 - 1)
			//이럴때 퀵버튼옮기기
			if(page.index() <= $(".quick ul li").size()-1){ 
				page.next().addClass("on").siblings(".on").removeClass("on");
			}
			
			if(nextPage < lastPageNum){ //마지막 페이지가 아닐때만 animate !
				var pagelength=0;
				for(var i = 1; i<(nextPage+1); i++){ 
					//총 페이지 길이 구하기
					//ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
					pagelength += $(".full"+i).height();
				}
				$("#fullpage").animate({"top": -pagelength + "px"},1000, "swing");
			}
			else{ // 현재 마지막 페이지 일때는
				//alert("마지막 페이지 입니다!");
			};		
			
		}
	});
	$(window).resize(function(){ 
		//페이지가 100%이기때문에 브라우저가 resize 될때마다 스크롤 위치가 그대로 남아있는것을 방지하기 위해
		var resizeindex = $(".quick ul li.on").index()+1;
		
		var pagelength=0;
		for(var i = 1; i<resizeindex; i++){ 
			//총 페이지 길이 구하기
			//ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
			pagelength += $(".full"+i).height();
		}

		$("#fullpage").animate({"top": -pagelength + "px"},0);
	});
}
// 사이드 퀵버튼 클릭 이동
function quickClick(){
	$(".quick li").click(function(){
		var gnbindex = $(this).index()+1;
		var length=0;
		for(var i=1; i<(gnbindex); i++)
		{
			length+=$(".full"+i).height();
		}
		if($("body").find("#fullpage:animated").length >= 1) return false;
		$(this).addClass("on").siblings("li").removeClass("on");
		
		$("#fullpage").animate({"top": -length + "px"},800, "swing");
		return false;
	});
}

</script>

</html>
