<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/project/resources/css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
	    section{
			margin-top : 40px;
		}
        section table{
            border: 1px solid black;
            border-collapse: collapse;
        }

        section td{
            border: 1px solid black;
        }

  		.id_input_re_1 , .email_input_re_1{
			color : green;
			display : none;
	    }
        /* 중복아이디 존재하는 경우 */
        .id_input_re_2, .email_input_re_2{
            color : red;
            display : none;
        }
        
        #tr_like_cnt, #tr_game_point, #tr_grade_input, .tr_likeType_input{
        	display : none;
        }
    </style>
</head>
<body>
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
			<a href="#">매칭</a>
			<a href="#">평가</a>
			<a href="#">게시판</a>
			<a href="#">게임</a>
			<a href="#">채팅</a>
		</div>
	
	<% 
	}else{
	%>
	<div class="category"> 
			<a href="#">매칭</a>
			<a href="/project/firstimpression">평가</a>
			<a href="/project/board">게시판</a>
			<a href="/project/map2">게임</a>
			<a href="/project/chatting_room2">채팅</a>
		</div>
	<%
	}
	%>
		

		<div class="mypage"> 
			<a href="mypage.html"><img src="resources/images/마이페이지.png"></a>
		</div>
	</div>
</header>
<section>
	<div>
       <form action="<c:url value='/reg' />" method="post" id="join_form" onsubmit="return test()">
           <table>
               <tr>
                   <td>아이디</td>
                   <td><input type="text" name="member_id" class="id_input">
                   <!-- <button onclick="idChk()">중복확인</button>  -->
                   	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				</td>
               </tr>
               <tr>
                   <td>이름</td>
                   <td><input type="text" name="mname" id="mname_input"></td>
               </tr>
               <tr>
                   <td>이메일</td>
                   <td><input type="text" name="email" id="email_input" autocomplete="off">
	                   <span class="email_input_re_1">올바른 형식의 이메일입니다.</span>
						<span class="email_input_re_2">올바른 형식이 이메일주소가 아닙니다.</span>
				   </td>
               </tr>
               <tr>
                   <td>비밀번호</td>
                   <td><input type="password" name="mpassword" id="pw_input"  autocomplete="off"></td>
               </tr>
               <tr>
                   <td>나이</td>
                   <td><input type="text" name="age" id="age_input"></td>
               </tr>
               <tr>
                   <td>성별</td>
                   <td><input type="text" name="gender" id="gender_input" maxlength=1></td>
               </tr>
               <tr>
                   <td>전화번호</td>
                   <td><input type="text" name="phone" id="phone_input" autocomplete="off"></td>
               </tr>
               <tr>
                   <td>자기소개</td>
                   <td><input type="text" name="introduce" id="introduce_input" value=""></td>
               </tr>
               
               <tr>
                   <td>MBTI</td>
                   <td><input type="text" name="mbti" id="mbti_input" value=""></td>
               </tr>

               <tr>
                   <td>종교</td>
                   <td><input type="text" name="religion" id="religion_input" value=""></td>
               </tr>
               <tr>
                   <td>직업</td>
                   <td><input type="text" name="job" id="job_input" value=""></td>
               </tr>
               <tr>
                   <td>사진</td>
                   <td><input type="file" name="image" id="image_input" multiple></td>
               </tr>
               <tr>
                   <td>키</td>
                   <td><input type="text" name="height" id="height_input" value=""></td>
               </tr>
               <tr>
                   <td>몸무게</td>
                   <td><input type="text" name="weight" id="weight_input" value=""></td>
               </tr>
               <tr>
                   <td>좋아하는 타입</td>
                   <td><input type="text" name="love_type" id="love_type_input"></td>
               </tr>
			   <tr id="tr_grade_input">
                   <td>등급</td>
                   <td><input type="text" name="grade" id="grade_input" value="basic"></td>
               </tr>
               <tr id="tr_like_cnt">
                   <td>좋아요수</td>
                   <td><input type="text" name="like_cnt" id="like_cnt_input" value="0"></td>
               </tr>

               <tr id="tr_game_point">
                   <td>게임점수</td>
                   <td><input type="text" name="game_point" id="game_point_input" value="0"></td>
               </tr>

               <tr>
                   <td colspan="2"><input type="submit" value="가입" class="join_button"></td>
               </tr>
               <tr class="tr_likeType_input">
                   <td>등급</td>
                   <td><input type="text" name="like_type1" value="0"></td>
               </tr>
               <tr class="tr_likeType_input">
                   <td>등급</td>
                   <td><input type="text" name="like_type2" value="0"></td>
               </tr>
               <tr class="tr_likeType_input">
                   <td>등급</td>
                   <td><input type="text" name="like_type3" value="0"></td>
               </tr>
               <tr class="tr_likeType_input">
                   <td>등급</td>
                   <td><input type="text" name="like_type4" value="0"></td>
               </tr>
               
               
               
           </table>
       </form>
	</div>
</section>

<script>
	//유효성 검사 변수
	var idchk = false; 
	var namechk = false;
	var passwordchk = false;
	var emailchk = false;
	var genderchk = false;
	var phonechk = false;
	var imagechk = false;


	/* 이미지 업로드 */
	// pom.xml 134줄 servlet추가해줘야함
	// web.xml 2번째줄수정 , upload관련 추가함
	// servlet-context.xml bean추가함
	
	/*
	$("input[type='file']").on("change", function(e){
		console.log("동작");
		let formData = new FormData();
		let fileInput = $('input[name="image"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList;
		let fileAllsize = 0;
		
		for(let i=0; i<fileList.length; i++){
			
			console.log("fileName : " + fileObj[i].name);
			console.log("fileSize : " + fileObj[i].size);
			console.log("fileType(MimeType) : " + fileObj[i].type);
			
			if(!fileCheck(fileObj[i].name, fileObj[i].size)){
				return false;
			}
			
			console.log("통과");
			formData.append("uploadFile", fileList[i]);
			
			fileAllsize += fileObj[i].size;
		}
		fileCheckAll(fileAllsize);
		
		
		console.log("test");
		console.log($('input[name="image"]').val());
		$.ajax({
			url: '/project/reg/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		});	
		
	
	});
	*/
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|jpeg|png)$");
	let maxSize = 3145728; //3MB	
	
	function fileCheck(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	function fileCheckAll(fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		return true;		
		
	}
  //아이디 중복검사
    $('.id_input').on("propertychange change keyup paste", function(){

    	var memberId = $('.id_input').val();			// .id_input에 입력되는 값
    	//var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
    	
    	$.ajax({
    		type : "post",
    		url : "/project/reg/memberIdChk",
    		data : {memberId : memberId},
    		success : function(result){
			 	//console.log("성공 여부" + result);
    			if(result == 'fail'){
    				$('.id_input_re_1').css("display","inline-block");
    				$('.id_input_re_2').css("display", "none");				
    			} else {
    				$('.id_input_re_2').css("display","inline-block");
    				$('.id_input_re_1').css("display", "none");				
    			}
			
			}// success 종료
    	}); // ajax 종

    });// function 종료
    //회원가입 유효성
   	function test(){
		
		if($(".id_input").val()==""){
			alert("아이디는 필수 입력사항입니다");
			return false;
		} else if($("#mname_input").val()==""){
			alert("이름은 필수 입력사항입니다");
			return false;
		} else if($("#age_input").val()==""){
			alert("나이는 필수 입력사항입니다");
			return false;
		} else if($("#email_input").val()==""){
			alert("이메일은 필수 입력사항입니다");
			return false;
		} else if($("#pw_input").val()==""){
			alert("비밀번호는 필수 입력사항입니다");
			return false;
		} else if($("#gender_input").val()==""){
			alert("성별은 필수 입력사항입니다");
			return false;
		} else if($("#phone_input").val()==""){
			alert("전화번호는 필수 입력사항입니다");
			return false;
		} else if($("#image_input").val()==""){
			alert("사진을 첨부해주세요");
			return false;
		} 

		let formData = new FormData();
		let fileInput = $('input[name="image"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList;
		for(let i=0; i<fileList.length; i++){
			console.log("fileName : " + fileObj[i].name);
			console.log("fileSize : " + fileObj[i].size);
			console.log("fileType(MimeType) : " + fileObj[i].type);
			
			if(!fileCheck(fileObj[i].name, fileObj[i].size)){
				alert("최대용량을 초과 하였습니다");
				return false;
			}
			
			//console.log("통과");
			formData.append("uploadFile", fileList[i]);
		}
		
		console.log($('input[name="image"]').val());
		$.ajax({
			url: '/project/reg/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		});	
		return true;
    }
    
    // 메일형식 검사
   	function mailFormCheck(email){
   	    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   	 	return form.test(email);
   	}
    // 메일 형식 검사하여 메시지 출력
   	$('#email_input').on("propertychange change keyup paste", function(){

    	var email = $('#email_input').val();			// .id_input에 입력되는 값
    	//var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
    	
    	
	 	//console.log("성공 여부" + result);
		if(mailFormCheck(email)){
			$('.email_input_re_1').css("display","inline-block");
			$('.email_input_re_2').css("display", "none");				
		} else {
			$('.email_input_re_2').css("display","inline-block");
			$('.email_input_re_1').css("display", "none");				
		}

    });// function 종료
</script>

</body>
</html>

