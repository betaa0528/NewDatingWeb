<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/project/resources/css/createBoard.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<section>
    <div class="container">
        <form action="<c:url value='/board/create' />" enctype="multipart/form-data" method="post" onsubmit="return postBoard();">
            <div class="form-row">
                <div class="form-column">
                    <input type="text" name="boardText" id="board_Input" placeholder="게시글 작성">
                    <input type="submit" value="저장">
                    <input type="button" value="취소" onclick="cancelButtonClicked()">
                </div>
                <div class="form-column">
                    <div class="preview-container">
                        <img id="preview" />
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-column">
                    <input type="file" name="image" id="image_Input" onchange="readURL(this);">
                </div>
            </div>
        </form>
    </div>
</section>


<script>

	function fileCheck(fileName, fileSize){
		
		let regex = new RegExp("(.*?)\.(jpg|jpeg|png)$");
		let maxSize = 3145728; //3MB	
		
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
	

	
    function postBoard(){
		let board_Input = $('#board_Input').val();
		if(board_Input==""){
			alert("게시글을 작성해주세요");
			return false;
		}
        let formData = new FormData();
		let fileInput = $('input[name="image"]');
		//alert(fileInput.val());
		
		if(fileInput.val()!=""){
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			if(!fileCheck(fileObj.name, fileObj.size)){
				return false;
			}
				
			formData.append("uploadFile", fileObj);
				
			
			
			console.log($('input[name="image"]').val());
			$.ajax({
				url: '/project/board/create',
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json'
			});	
		} 

		
		return true;
    }
    
    function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();
    	    reader.onload = function(e) {
    	      document.getElementById('preview').src = e.target.result;
    	    };
    	    reader.readAsDataURL(input.files[0]);
    	  } else {
    	    document.getElementById('preview').src = "";
    	  }
    }
    
    function cancelButtonClicked() {
        window.location.href = "/project/board"; // 취소 버튼 클릭 시 이동할 페이지의 URL을 설정합니다.
    }
	
</script>
</body>
</html>

