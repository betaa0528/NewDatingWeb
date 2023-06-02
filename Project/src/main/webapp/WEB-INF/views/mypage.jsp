<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>

    /* section =================================================== */

    body{
        font-family: 'GmarketSansMedium';
    }
    section{
        border: 3px solid rgb(119, 0, 255);
        width: 100%;
        height: 800px;
    }



    #box {
        border: 2px solid black;
        display: flex;
        justify-content: center;
        gap: 100px;
    }

    #imgbox {
        border: 1px solid red;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        gap: 30px;
        width: 30%;
    }
    #imgbox img{
        border-radius: 50%;
        width: 250px; 
        height: 250px; 
    }
    span a{
        text-decoration: none;
        color: white;
        background-color: lightpink;
        font-weight: bold;
        font-size: 22px;
        padding: 10px;
        border-radius: 30px;
        padding-left: 25px;
        padding-right: 25px;
    }
    #info {
        border: 2px solid blue;
        /* text-align: center; */
        font-size: 24px;
        width: 30%;
    }
     /* ================================================================ */ 

    #test {
        border: 2px solid violet;
        /* text-align: center; */

    }
    
    /* Progress Bar Container */
    .progress-bar {
            width: 85%;
            height: 32px;
            background-color: #e4e4e4;
            border-radius: 15px;
            overflow: hidden;
    }

    /* Progress Bar Value */
    .progress-bar-value {
            height: 100%;
            background-color: #ff00bb;
            width: 0;
            transition: width 0.3s ease-in-out;
    }
	.container{
	display:flex;
	align-items: center;
	}

</style>


</head>
<body>

    <%@ include file="header.jsp" %>

<section>
    <div id="box">
        <div id="imgbox">
            <img src="/project/resources/images/${list2.get(1).split(',')[0].trim()}">
            <span><a href="/project/form">프로필 수정</a></span>
        </div>

        <div id="info">
            <h2> 내 정보 </h2>
            <p>🧐 이름 : ${list2.get(0)}</p>
            <p>🎮 보유 게임포인트 : ${list2.get(3)}</p>
            <p>💓 받은 LIKE 수 : ${list2.get(2)}</p>
        </div>
    </div>

        <hr>

        <div id="test">
            <h1> 내 첫인상 어때요? </h1>
            <button> 평가 받으러 가기 </button>
        </div>

        <div id="bar">

            <p> 신고할뻔 혼인신고ㅎ </p>
            <div class="container">
            <div class="progress-bar">
                <div id="liketype1" class="progress-bar-value"></div>
            </div>
                <div class="c1"></div>
            </div>


            <p> 시원시원, 완전 쿨해보여요 </p>
            <div class="container">
            <div class="progress-bar">
                <div id="liketype2" class="progress-bar-value"></div>
            </div>
            <div class="c2"></div>
			</div>
			
            <p> 순둥순둥 착할거같아요 </p>
            <div class="container">
            <div class="progress-bar">
                <div id="liketype3" class="progress-bar-value"></div>
            </div>
            <div class="c3"></div>
			</div>
			
            <p> 푸~근하게 알던사이 같은데요? </p>
             <div class="container">
            <div class="progress-bar">
                <div id="liketype4" class="progress-bar-value"></div>
            </div>
            <div class="c4"></div>
			</div>
        
    </div>
    
</section>

<footer></footer>
</body>

<script>

	let like1 = ${list.get(0).getLike_type1()};
	let like2 = ${list.get(0).getLike_type2()};
	let like3 = ${list.get(0).getLike_type3()};
	let like4 = ${list.get(0).getLike_type4()};

	let liketot = like1 + like2 + like3 + like4 ;
	
	let liketype1 = document.getElementById("liketype1");
	let liketype2 = document.querySelector("#liketype2");
	let liketype3 = document.getElementById("liketype3");
	let liketype4 = document.querySelector("#liketype4");
	
	let c1 = document.querySelector(".c1");
	let c2 = document.querySelector(".c2");
	let c3 = document.querySelector(".c3");
	let c4 = document.querySelector(".c4");
	

	
	if(liketot==0){
		
		liketype1.style.width = "0%" ; 
		liketype2.style.width = "0%" ; 
		liketype3.style.width = "0%" ; 
		liketype4.style.width = "0%" ; 
		
		c1.innerHTML="0%";
		c2.innerHTML="0%";
		c3.innerHTML="0%";
		c4.innerHTML="0%";
	}else{
		
	liketype1.style.width = (like1 / liketot * 100)+"%" ; 
	c1.innerHTML= (like1 / liketot * 100)+"%";
	liketype2.style.width = (like2 / liketot * 100)+"%" ; 
	c2.innerHTML= (like2 / liketot * 100)+"%";
	liketype3.style.width = (like3 / liketot * 100)+"%" ; 
	c3.innerHTML= (like3 / liketot * 100)+"%";
	liketype4.style.width = (like4 / liketot * 100)+"%" ; 
	c4.innerHTML= (like4 / liketot * 100)+"%";
	


	}

</script>

</html>
