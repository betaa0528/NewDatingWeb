<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<style>
	


    /* section =================================================== */
    body{
        font-family: 'GmarketSansMedium';
    }
    section{
        /* border: 3px solid rgb(119, 0, 255); */
        width: 100%;
        height: 800px;
    }

    /* ============================================================ */

    #container{
        display: flex;
        margin-top: 20px;
        justify-content: space-around;
    }


    #main_box{
        /* border: 5px solid saddlebrown; */
        /* background-color: rgb(255, 212, 225); */
        width: 600px;
        height: 770px;
        border-radius: 20px 40px;
        box-shadow: 0 1px 1px rgba(0,0,0,0.08), 
                0 2px 2px rgba(0,0,0,0.12), 
                0 4px 4px rgba(0,0,0,0.16), 
                0 8px 8px rgba(0,0,0,0.20);
       
    }

    #main{
        /* border: 2px solid red; */
        text-align: center;
        margin-top: 20px;
    }
    #main_box img{
        border-radius: 10px;
    }
    #aside{
        /* border: 2px solid blue; */
        display: flex;
        justify-content: center;
    }
    #img1{   
        width: 460px;
        height: 470px;
        box-shadow: 0 1px 1px rgba(0,0,0,0.08), 
                    0 2px 2px rgba(0,0,0,0.12), 
                    0 4px 4px rgba(0,0,0,0.16), 
                    0 8px 8px rgba(0,0,0,0.20);
    }
    #img2, #img3{
        width: 225px;
        height: 130px;
        margin: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,0.08), 
                    0 2px 2px rgba(0,0,0,0.12), 
                    0 4px 4px rgba(0,0,0,0.16), 
                    0 8px 8px rgba(0,0,0,0.20);
        }
    #btn{
        /* border: 2px solid black; */
        text-align: center;
    }
    button{
        width: 45%;
        height: 110px;
        font-size: 34px;
        cursor: pointer;
        margin-top: 5px;
    }
    #nope{
        border: 5px solid red;
        background-color: white;
        color: red;
        font-weight: bold;
    }
    #like{
        border: 5px solid greenyellow;
        background-color: white;
        color: greenyellow;
        font-weight: bold;
    }

    /* ========================================================================  */

    #text_box{
        /* border: 1px solid black; */
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 500px;     
        border-radius: 15px;
        box-shadow: 0 1px 1px rgba(0,0,0,0.08), 
                0 2px 2px rgba(0,0,0,0.12), 
                0 4px 4px rgba(0,0,0,0.16), 
                0 8px 8px rgba(0,0,0,0.20);
    }
    table{
        width: 100%;
        height: 600px;
    }
   

    td{
        /* border: 1px solid black; */
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
    }
    
    td:nth-child(1){
        font-weight: bold;
        font-size: 24px;
    }
    td:nth-child(2){
        font-size: 20px;
        border-bottom: 1px dashed #bcbcbc;
        margin: 10px;
    }

    

    /* 팝업창 ======================================================================= */

    #likeup , #nopeup{
        display: none;
        /* display: block; */
        position: fixed;
        width: 100%;
        height: 100%;
        /* background-color: lightpink; */
    }
    
    #likemenu , #nopemenu {
    position: absolute;
    left: 49.5%;
    top: -50%;
    transform: translate(-50%,-50%);
    width: 450px;
    height: 350px;
    text-align: center;
    background: #fff;

    }
    #likemenu{
        border: 5px solid greenyellow;
    }
    #nopemenu{
        border: 5px solid rgb(255, 0, 0);
    }

    #likemenu img{
        width: 450px;
        height: 300px;
        object-fit: contain;
    }
    #nopemenu img{
        width: 450px;
        height: 300px;
        object-fit: contain;
    }
</style>

</head>
<script>
	let result ="${result4}";
	if(result==""){
		alert("저런, 더이상 남은 이성이 없군요.");
		location.href="/project/";

	}
</script>
<!--  
<body>
	
	<button onclick="like_action('Y')">LIKE</button>
	<button onclick="like_action('N')">NOPE</button>
	<input type="hidden" name="cnt">
	
</body>
-->
<body>
    <%@ include file="header.jsp" %>

<section>

<div id="container">

<div id="main_box">
    <div id="main">
        <img src= "/project/resources/images/${result4.getImage().split(',')[0].trim()}" id="img1">
    </div>

    <div id="aside">
        <img src= "/project/resources/images/${result4.getImage().split(',')[1].trim()}" id="img2">
   		<img src= "/project/resources/images/${result4.getImage().split(',')[2].trim()}" id="img3">
    </div>

    <div id="btn">
        <button id="nope" > NOPE <img src="resources/images/NO.png" width="35"></button>
        <button id="like" > LIKE <img src="resources/images/YES.png" width="35"></button>
        <input type="hidden" name="cnt">
    </div>    
</div>

<div id="text_box">
    <div id="info">
    
        <table>
            <tr>
                <td> 🤔 이름 / 나이 🤔 </td>
                <td id="td1"> ${memlist.get(0)} / ${memlist.get(1)} </td>
            </tr>
            <tr>
                <td> 💁 자기소개 💁</td>
                <td id="td2"> ${memlist.get(2)} </td>
            </tr>
            <tr>
                <td> 🤩 MBTI 🤩</td>
                <td id="td3"> ${memlist.get(3)} </td>
            </tr>
            <tr>
                <td> 👏 종교 👏</td>
                <td id="td4"> ${memlist.get(4)} </td>
            </tr>
            <tr>
                <td> ❤️‍🔥 이상형 ❤️‍🔥</td>
                <td id="td5"> ${memlist.get(5)} </td>
            </tr>

        </table>
    </div>
</div>

</div>





    <!-- 팝업창 -->
    <div id="likeup">
        <div id="likemenu">
            <p><img src="resources/images/LIKE.png"></p>
        </div>
    </div>

    <div id="nopeup">
        <div id="nopemenu">
            <p><img src="resources/images/DISLIKE.png"></p>
        </div>
    </div>

</section>

<footer></footer>
</body>

<script>
	
let id = "${result2}"; // 문자열로 인식
let img1= document.querySelector("#img1");
let img2= document.querySelector("#img2");
let img3= document.querySelector("#img3");
	
	function like_action( c){
		
		

		// 여러번 클릭 제어해야해 !!!!!!!!
		let cnt_data = ${result1}; // 숫자열로 인식
		cnt_data++;
		
				
		//alert(id);
		
		$.ajax({
			type:"post",
			url:"/project/test1",  //
			data: {				   //
				"cnt" : cnt_data ,
				"receiver_member_id" : id ,
				//
				// sender_member_id 
				// receiver_member_id 
				"matching_status" : c 
				
				},
				success: function (response){	//() 자리에 s가 들어옴
					if(response[0]==null){
						alert("저런, 더이상 남은 이성이 없군요.");
						location.href="/project/";
					}else{
					
					img1.src= "/project/resources/images/"+response[0].image.split(',')[0].trim();
					img2.src= "/project/resources/images/"+response[0].image.split(',')[1].trim();
					img3.src= "/project/resources/images/"+response[0].image.split(',')[2].trim();
					id = response[0].member_id;
					
					document.querySelector("#td1").innerHTML= response[1][0]+" / "+ response[1][1];
					document.querySelector("#td2").innerHTML= response[1][2];
					document.querySelector("#td3").innerHTML= response[1][3];
					document.querySelector("#td4").innerHTML= response[1][4];
					document.querySelector("#td5").innerHTML= response[1][5];
					}
				},
			error: function(err){
				console.log( err);
			}
		});
	 }
	$(document).ready(function(){
        $("#like").click(function(){
            $("#likeup").fadeIn();
            like_action('Y');
        });
        $("#likeup").click(function(){
            $("#likeup").fadeOut();
        });


        $("#nope").click(function(){
            $("#nopeup").fadeIn();
            like_action('N');
        });
        $("#nopeup").click(function(){
            $("#nopeup").fadeOut();
        });
});
	
</script>
</html>
