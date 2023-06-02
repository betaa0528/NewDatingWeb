<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'비밀번호 찾기' 시작 화면</title>
<style>
   * {
       box-sizing: border-box;
   }
   a {
       text-decoration: none;
   }
   form {
       width: 400px;
       height: 500px;
       display: flex;
       flex-direction: column;
       align-items: center;
       justify-content: center;
       position: absolute;
       top: 50%;
       left: 50%;
       transform: translate(-50%, -50%);
       border: 1px solid rgb(89, 117, 196);
       border-radius: 10px;
   }
   input[type='text'] {
       width: 300px;
       height: 40px;
       margin-bottom: 10px;
   }
   input[type='password'] {
       width: 300px;
       height: 40px;
       border: 1px solid rgb(89, 117, 196);
       border-radius: 5px;
       padding: 0 10px;
       margin-bottom: 10px;
   }
   button {
       background-color: rgb(89, 117, 196);
       color: white;
       width: 300px;
       height: 50px;
       font-size: 17px;
       border: none;
       border-radius: 5px;
       margin: 20px 0 30px 0;
   }
   #title {
       font-size: 50px;
       margin: 40px 0 30px 0;
   }
   #msg {
       height: 30px;
       text-align: center;
       font-size: 16px;
       color: red;
       margin-bottom: 20px;
   }
   .fa-exclamation-circle {
       display: inline-block;
       margin-right: 5px;
   }
   </style>
</head>
<body>


    <form method="post" action="/project/page2">
    <div id="title">비밀번호 찾기</div>
    <div id="errorMsg">
    <input type="text" name="myMember_id" placeholder="아이디"><br>
    <input type="text" name="myEmail2" placeholder="이메일"><br>
    <input type="submit" value="비밀번호 찾기">
    </div>
    
    <div>
        <%-- 오류 메시지가 있는 경우에만 표시 --%>
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>
    </div>
    
    </form>
    
    
    
    

</body>
</html>