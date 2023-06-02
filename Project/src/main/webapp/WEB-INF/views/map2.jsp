<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.acorn.project.DTO.*" %>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html lang="en">
<link rel="stylesheet" href="/project/resources/css/game.css">
<%@ include file="header.jsp" %>
<%
	TileMap[] tileMaps= (TileMap[])request.getAttribute("tileMap");
	String member_id= (String)session2.getAttribute("sessionId");
	TileMap tileMap= tileMaps[1];
%>	
<script>
let map_num=<%=tileMaps.length%>;
let member_id="<%=member_id%>";
let name1=member_id;
    
	
	<%= tileMap.all_tile_script()%>
</script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <!-- ////////////////////////////////////////////////// -->
    
</head>

<body>
    <section>
    
    <div id="title">
	<h1>물건 찾기 게임</h1>
	</div>
	
	<div id="old_section">
		<div class="big_box">
    <svg xmlns="http://www.w3.org/2000/svg" width="150px" height="200px" version="1.1">
       <polygon points="0,0 50,50 100,50 150,0 150,150 75,200 0,150" style="fill: #eeccdd; stroke:#ffefff; stroke-width:10;"></polygon>
    </svg>
    
    <div class="item_box item_box1">
    	<img id="guess_item" src="resources/images/drawer1.png">
    	<h2>위 사진과 동일한 물체를 찾으세요!</h2>
    </div>
    <svg xmlns="http://www.w3.org/2000/svg" width="150px" height="200px" version="1.1">
       <polygon points="50,150 0,200 0,50 75,0 150,50 150,200 100,150" style="fill: #eeccdd; stroke:#ffefff; stroke-width:10;"></polygon>
    </svg>
    </div>
    
    <div class="background map">
    	<div class="real_map">
    	</div>
    	<div class="player_map">
    	</div>
    	
    </div>
    <div class="big_box">
    <svg xmlns="http://www.w3.org/2000/svg" width="150px" height="200px" version="1.1">
       <polygon points="0,0 50,50 100,50 150,0 150,150 75,200 0,150" style="fill: #eeccdd; stroke:#ffefff; stroke-width:10;"></polygon>
    </svg>
    
    <div class="item_box item_box2">
            	<h2 id="time">남은 시간: 60초</h2>
            	<h3 id="score">점수: 0점</h3>
    </div>
    
    <svg xmlns="http://www.w3.org/2000/svg" width="150px" height="200px" version="1.1">
       <polygon points="50,150 0,200 0,50 75,0 150,50 150,200 100,150" style="fill: #eeccdd; stroke:#ffefff; stroke-width:10;"></polygon>
    </svg>
    
    </div>
	</div>
    
    </section>
    
    <script>
    	function timer(last){
    		let time = document.querySelector("#time");
    		let cur_score =document.querySelector("#score");
    		score=0;
    		cur_score.innerHTML="점수: 0점";
    		time.innerHTML="남은 시간: "+last+"초";
    		document.querySelector(".item_box1").style.visibility = "visible";
    		document.querySelector(".item_box2").style.visibility = "visible";
			
    		let lasting = setInterval(
    				function(){
    					last--;

    					if(last>=0){
    		time.innerHTML="남은 시간: "+last+"초";
    					}else{
    		miniGame1=false;
    		time.innerHTML="종료!!";
    		clearInterval(lasting);
    		setScore();
    					}
    					
    					if(miniGame1==false){
    						
    	    				clearInterval(lasting);
    	    				}
    					
    				},1000
    		);
    		
    	}
    	
    </script>
   

    <script>
        //------------------------------아래는 맵 설정------------------------------------
        let tile_map=[]; //json 파일집합 (타일)
        let player_map=[]; //json 파일집합 (플레이어타일)
        let tile_div=[]; //타일내부의 이미지 집합
        let nextInts=[];
        let miniGame1= false;
        let item_catalog=[];
        let object;
        let score=0;
        let loc=1;
        let direction ="down";
        let map = document.querySelector(".real_map");
        let player_map_div = document.querySelector(".player_map");
        let battle = document.querySelector(".battle");
        let nav =document.querySelector("nav")
        let width= <%= tileMap.getWidth()%>;
        let height= <%= tileMap.getHeight()%>;
        let player_location={
            x:1,
            y:1
        }
        function shake(){
            object = item_catalog[Math.floor(Math.random()*item_catalog.length)];
        }
        
        <%int[] item_nums= new int[]{0,1,2,3,4,5,32,21,12,13,17,9,10,11,18,19,20,48,23,30};
			for(int i=0;i<item_nums.length;i++){
				%>
				item_catalog.push(make_<%=item_nums[i]%>());
				<%
        	}
        %>
        shake();
        document.querySelector("#guess_item").src= object.url;

        
        function correct(){
        	if(miniGame1){
        		shake();
            	let guess_img = document.querySelector("#guess_item");
            	let score_h2 = document.querySelector("#score");
            	guess_img.src= object.url;
            	score +=50;
            	score_h2.innerHTML= "점수: "+score+"점";
        	}
        	
        }
        	
        
        function loc_return(){
            return (player_location.x+player_location.y*width);
        }
       
        
       
        
        
       <%
       	for(int a=0;a<tileMaps.length;a++){
       		tileMap= tileMaps[a];
       		%>
       		function fill_map<%=a%>(){
       			
    			tile_map=[]; 
    	        player_map=[]; 
    	        tile_div=[]; 
    	        nextInts=[];
    	        
    	        width= <%= tileMap.getWidth()%>;
    	        height= <%= tileMap.getHeight()%>;
    	        
    	        document.querySelector(".real_map").innerHTML="";
    	        document.querySelector(".player_map").innerHTML="";
    	        
            	<%
            		for(int i=0;i<tileMap.getHeight();i++){
            			for(int j=0;j<tileMap.getWidth() ;j++){
            				
            				for(int k=0;k<200;k++){
            					if(Integer.toString(k).equals(Integer.toString(tileMap.getTileInt()[i*tileMap.getWidth()+j]))){
            						%>
                					tile_map.push(make_<%=k%>());
                					<%
            					}
            				}
            			}
            		}
            	%>
                for(let i=0;i<<%=tileMap.getHeight() %>;i++){
                    let tile_line =  document.createElement("div");
                    let player_line =  document.createElement("div");
                    tile_line.style.height="24px";
                    player_line.style.height="24px";
                    for(let j=0;j<<%=tileMap.getWidth() %>;j++){
                        let tile =  document.createElement("div");
                        let player_tile= document.createElement("div");
                        
                        tile.style.display="inline-block";
                        tile.style.width ="24px";
                        tile.style.height = "24px";
                        
                        player_tile.style.display="inline-block";
                        player_tile.style.width ="24px";
                        player_tile.style.height = "24px";
                        player_tile.style.position="relative";
                        player_map.push(player_tile);
                        
                        let img = document.createElement("img");
                        
                        tile.style.background="url('"+tile_map[i*width+j].background+"')";
                        if(tile_map[i*width+j].code== "101"){
                        	player_location.x=j;
                        	player_location.y=i;
                        	player_tile.style.background="url('"+tile_map[i*width+j].url+"')";
                        	
                        	let name= document.createElement("b");
                        	name.style.position="absolute";
                        	name.style.fontSize="10px";
                        	name.style.width="50px";
                        	name.style.top="-10px";
                        	name.innerHTML=name1;
                        	player_tile.appendChild(name);
                        	
                        	tile_map[i*width+j].pass= true;
                        	img.style.visibility="hidden";

                        }else{
                        	player_tile.style.background="transparent";
                        	img.src= tile_map[i*width+j].url;
                        }
                        
                        
                        player_tile.style.backgroundSize="cover";
                        tile.style.backgroundSize="cover";
                        img.style.width ="24px";
                        img.style.height = "24px";


                        tile.appendChild(img);
                        
                        tile.style.backgroundPosition="center";
                        tile_line.appendChild(tile);
                        player_line.appendChild(player_tile);
                        tile_div.push(img);
                        
                    }
                    map.appendChild(tile_line);
                    player_map_div.appendChild(player_line);
                }
                <%
    	        for(int b=0;b<tileMap.getNextInts().length;b++){
    	        	%>
    	        	tile_map[<%=tileMap.getNextInts()[b]%>].nextMap= <%=tileMap.getNextMaps()[b]%>;
    	        	<%
    	        }
    	        %>
                //set_monster(10);
                if(<%=a%>==1){
                	miniGame1=true;
                	timer(60);
                }else{
            		document.querySelector(".item_box1").style.visibility = "hidden";
            		document.querySelector(".item_box2").style.visibility = "hidden";
                	miniGame1=false;
                }
            }
       		<%
       	}
       %>
        		
        
        
        function set_monster(num){
            let count=0;
            while(count<num){
                let ran= make_random();
                if(tile_map[ran].pass){
                    count++;
                    tile_map[ran] = make_monster_tile();
                    tile_div[ran].src = make_monster_tile().url;
                    tile_div[ran].style.visibility="visible";
                }
            }
        }
        
        fill_map0();
        //---------------------------------------------------------
        function go_next(how){
        	<%
    		for(int i=0;i<tileMaps.length;i++){
    			%>
    			if(tile_map[loc_return()+how].nextMap=="<%=i%>"){
            		fill_map<%=i%>();
            	}
    			<%
    		}
    	%>
        }
        function stickName(){
        	let name= document.createElement("b");
        	name.style.position="absolute";
        	name.style.fontSize="10px";
        	name.style.width="50px";
        	name.style.top="-10px";
        	name.innerHTML=name1;
        	player_map[loc_return()].appendChild(name);
        	
        }
        //-----------------------맵 부분: 아래는 동작---------------------
        function move_up(){
        	go_next(-width);
            if(tile_map[loc_return()-width].pass ){
            player_map[loc_return()].style.visibility="hidden";
            player_map[loc_return()].innerHTML="";
            
            player_location.y -= 1;
            
            player_map[loc_return()].style.visibility="visible";
            
            stickName();
        }
        player_map[loc_return()].style.background="url('"+make_101("up").url+"')";
            player_map[loc_return()].style.backgroundSize="cover";
        direction ="up"
        }
        function move_left(){
        	go_next(-1);
            if(tile_map[loc_return()-1].pass){
            	player_map[loc_return()].style.visibility="hidden";
                player_map[loc_return()].innerHTML="";

            player_location.x -= 1;

            player_map[loc_return()].style.visibility="visible";
            stickName();
        }
            player_map[loc_return()].style.background="url('"+make_101("left").url+"')";
            player_map[loc_return()].style.backgroundSize="cover";
        direction ="left"

        }
        function move_right(){
        	go_next(1);
            if(tile_map[loc_return()+1].pass){
            		player_map[loc_return()].style.visibility="hidden";
                    player_map[loc_return()].innerHTML="";

            	player_location.x += 1;

                player_map[loc_return()].style.visibility="visible";
                stickName();
        }
                player_map[loc_return()].style.background="url('"+make_101("right").url+"')";
                player_map[loc_return()].style.backgroundSize="cover";
        direction ="right"

        }
        function move_down(){
        	go_next(width);
            if(tile_map[loc_return()+width].pass){
            		player_map[loc_return()].style.visibility="hidden";
                    player_map[loc_return()].innerHTML="";

            player_location.y += 1;

                player_map[loc_return()].style.visibility="visible";
                stickName();
        }
                player_map[loc_return()].style.background="url('"+make_101("down").url+"')";
                player_map[loc_return()].style.backgroundSize="cover";
        direction ="down"

        }
        document.addEventListener('keydown', (event) => {
        switch(event.key){
            case "ArrowUp":
            event.preventDefault();
                move_up();
                break;
            case "ArrowLeft":
            event.preventDefault();
                move_left();
                break;
            case "ArrowRight":
            event.preventDefault();
                move_right();
                break;
            case "ArrowDown":
            event.preventDefault();
                move_down();
                break;
            case "z":
            case "Z":
                search();

        }
        
    });
    function search(){
            let next_tile=null;
            let index=0;
            switch(direction){
                case "up":
                    index = loc_return()-width;
                    
                    break;
                case "left":
                    index = loc_return()-1;
                    
                    break;    
                case "right":
                    index = loc_return()+1;
                    break;
                case "down":
                    index = loc_return()+width;
                    
                    break;
            }
            next_tile =tile_map[index];
            if(next_tile.battle){
                set_monster(1);
                go_battle();
                tile_map[index] =make_0;
                next_tile.style.background ="transparent";
                next_tile.style.visibility="hidden";
            }else{
            	for(let i=0; i<item_catalog.length;i++){
            		if(object.code==next_tile.code){
            			correct();
            		}
            	}
            }
            
            
        }
    function setScore(){
    	  $.ajax({
              url: "/project/insert_point",
              type: "POST",
              dataType: "json",
              data: {
            	  point :(score/5),
            	  id: member_id
              },
              success: function(data){
                  console.log(data);
              },
              error: function(err){
                  console.log(err);

              }
          });
    }


       
    </script>
    
    
</body>

</html>