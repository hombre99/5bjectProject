<%@page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TESTGAME</title>
<style type="text/css">
#body {
	background: #f8f8ff;
}

#dva {
	margin-left: -1px;
	width: 100%;
	height: 20px;
	text-align: center;
	padding: 13px;
	background: #f8f8ff;
}

#dvb {
	width: 100%;
	height: 570px;
	text-align: center;
	padding-top: 65px;
	background: white;
	position: absolute;
}

/*
			#dvc {
				float: left;
				margin: 0px;
				width: 80%;
				height: 150px;
				border-top: 1px solid gray;
				border-bottom: 1px solid gray;
				border-left: 1px solid gray;
				border-right: 1px solid gray;
				text-align: center;
				padding-top: 65px;
				background: rgb(0,0,230)
	 			position: absolute;
				left: 21%;
			}
			*/
#dvd {
	width: 100%;
	height: 100px;
	text-align: center;
	padding: 12px;
	background: #f8f8ff;
	position: relative;
	top: 600px;
	clear: both;
}

#dve {
	float: left;
	margin: 0px;
	width: 60%;
	height: 450px;
	text-align: center;
	padding-top: 65px;
	padding-left: 150px;
	background: white;
	position: absolute;
	left: 0%;
}

#dvf {
	float: left;
	margin: 0px;
	width: 40%;
	height: 450px;
	text-align: center;
	padding-top: 65px;
	background: white;
	position: absolute;
	left: 60%;
}

#dvg {
	margin-top: 10px;
	text-align: center;
	padding-top: 65px;
}

#td2 {
	border: 1px solid black;
	padding: 0px;
	height: 200px;
	width: 300px;
	position: relative;
	text-align: center;
}

#td3 {
	border: 1px solid black;
	padding: 0px;
	height: 130px;
	width: 170px;
	text-align: center;
}

#td4 {
	border: 1px solid black;
	padding: 0px;
	height: 100px;
	width: 150px;
	position: relative;
	text-align: center;
}

table {
	border-collapse: collapse;
}
</style>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript">
		var verificationXLoc;
		var verificationYLoc;
		var step;
		var fishXLoc ;
		var fishYLoc ;
		var catXLoc ;
		var catYLoc ;
		var answerXLoc = 0;
		var answerYLoc = 0;
			
			$(document).ready(function(){
				// var difficulty = 3;  //게임링크로 넘어올때에 난이도값을 받아올 변수
    			var difficulty = '${ sessionScope.difficulty}';
    
				
   				var gameTable = document.getElementById("gameTable");   
   				/*
   				while(gameTable.hasChildNodes()){
         			gameTable.removeChild();
      			}
      			*/

				//난이도에 따라 테이블을 자동생성하는 function
				for ( var j = 1; j <= difficulty; j++ ) {         
					tr = document.createElement("tr");
					$(gameTable).append(tr);  
					for ( var i = 1; i <= difficulty; i++ ) {
						td = document.createElement("td");
						if(difficulty==4){						
							td.setAttribute("id", "td" + difficulty+j+i);	
	         				$(td).css({"border" : "1px solid black",
	    						"padding": "0px",
	    						"height": "100px",
	    						"width": "150px",
	    						"position": "relative",
	    						"text-align": "center"});
							$(tr).append(td);
							
						}else{
							td.setAttribute("id", "td" + difficulty);
	         				$(tr).append(td);
						}
					}
				}
      				//난이도 상에서 랜덤으로 고양이와 생선이미지 배치해주는 로직
					var locCheck = true;
					while(locCheck){
						fishXLoc = Math.floor(Math.random()*4)+1;
						fishYLoc = Math.floor(Math.random()*4)+1;
						catXLoc = Math.floor(Math.random()*4)+1;
						catYLoc = Math.floor(Math.random()*4)+1;
						var max = Math.max((fishXLoc+fishYLoc) ,(catXLoc+catYLoc));
						var min = Math.min((fishXLoc+fishYLoc) ,(catXLoc+catYLoc));
						step = max-min;
						if( (3<step) && (step<7) && !(fishXLoc==catXLoc) ){
							var fishImg = document.createElement("img");
	         				fishImg.setAttribute("src","/5bject/image/game/game2/fish.jpg" );
	         				fishImg.setAttribute("width","150px" );
	         				fishImg.setAttribute("height","100px" );
	         				var id1 = "td4"+fishXLoc+fishYLoc;
							$("#"+id1).append(fishImg);
							
							var catImg = document.createElement("img");
	         				catImg.setAttribute("src","/5bject/image/game/game2/angrycat.jpg" );
	         				catImg.setAttribute("width","150px" );
	         				catImg.setAttribute("height","100px" );
	         				var id2 = "td4"+catXLoc+catYLoc;
	         				$("#"+id2).append(catImg);
	         				locCheck = false;
						}
				} 
      
      			if ( difficulty == 2 ) {
         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);
         			
         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/easy/easy1.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);

         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "1");
         			$("#dvg").append(input);

         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/easy/easy2.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
         			$("#dvg").append(document.createElement("br"));

         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);

         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/easy/easy3.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);

         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);

         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/easy/easy4.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
         			
         			//난이도 하 고양이, 생선 이미지
         			var catImg = document.createElement("img");
         			catImg.setAttribute("src","/5bject/image/game/game2/angrycat.jpg" );
         			catImg.setAttribute("width","200px" );
         			catImg.setAttribute("height","100px" ); 
         			$("td:eq(0)").append(catImg); 
         			
         			var fishImg = document.createElement("img");
     				fishImg.setAttribute("src","/5bject/image/game/game2/fish.jpg" );
     				fishImg.setAttribute("width","150px" );
     				fishImg.setAttribute("height","100px" );
     				$("td:eq(3)").append(fishImg); 
     				
      			} else if ( difficulty == 3 ) {
         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);

         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/normal/normal1.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
         			
         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);
         			
         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/normal/normal2.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
         			$("#dvg").append(document.createElement("br"));
         			
         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "1");
         			$("#dvg").append(input);
         			
         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/normal/normal3.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
         			
         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);
         			
         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/normal/normal4.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
         			
         			//난이도 중 생선, 고양이 이미지
         			var catImg = document.createElement("img");
         			catImg.setAttribute("src","/5bject/image/game/game2/angrycat.jpg" );
         			catImg.setAttribute("width","200px" );
         			catImg.setAttribute("height","100px" ); 
         			$("td:eq(2)").append(catImg); 
         			
         			var fishImg = document.createElement("img");
     				fishImg.setAttribute("src","/5bject/image/game/game2/fish.jpg" );
     				fishImg.setAttribute("width","150px" );
     				fishImg.setAttribute("height","100px" );
     				$("td:eq(3)").append(fishImg); 
     				
     				//난이도 상 보기 생성 로직 
      			}else if ( difficulty == 4 ) {
      				var table = document.createElement("table");
      				$("#dvg").append(table);
    					var tr = document.createElement("tr");
    					$(table).append(tr);   
    					for ( var i = 1; i<5 ; i++){
    						td = document.createElement("td");
    						td.setAttribute("id", "select"+i); //답 선택td에 id 부여
    						var img = document.createElement("img");
    	         			img.setAttribute("src","/5bject/image/game/game2/arrow"+i+".jpg" );
    	         			img.setAttribute("width","100px" );
    	         			img.setAttribute("height","100px" );
    	         			$(td).append(img); 			  	         			
    	         			$(tr).append(td);
    					}
    					var tr = document.createElement("tr");
    					$(table).append(tr); 
    					for(var i = 1 ; i < step+1; i++){
    						td = document.createElement("td");
    						td.setAttribute("id", "result"+i); //답 선택결과td에 id 부여
    						$(td).css({"border" : "1px solid black",
	    						"padding": "0px",
	    						"height": "100px",
	    						"width": "100px",
	    						"position": "relative",
	    						"text-align": "center"});
    						$(tr).append(td);    						
    					}      		
      			}
      			//문제 
      			if(difficulty==4){
      			$("#question").html("<h3>고양이가 생선을 먹고 싶어해요!! <br>다음 중 고양이가 생선까지 "
      					+step+"번 만에 갈 수 있는 알고리즘은 무엇일까요?</h3>");
      			}else{
      				$("#question").html("<h3>고양이가 생선을 먹고 싶어해요!! <br>다음 중 고양이가 생선까지 갈 수 있는 알고리즘은 무엇일까요?</h3>");
      			}
				//정답 체크 버튼 function
				//난이도 상일때
				if(difficulty==4){					
						$("#select1").on("click", function(){   // 답선택 td id별로 클릭이벤트 부여						
							var img = document.createElement("img");
							img.setAttribute("src","/5bject/image/game/game2/arrow1.jpg" );
	         				img.setAttribute("width","100px" );
	         				img.setAttribute("height","100px" );
	         				for(var i = 1; i <= step; i++){
	         					var result = document.getElementById("result"+i);
	         					if(!(result.hasChildNodes())){
	         					$(result).append(img);
	         					answerXLoc = answerXLoc - 1;
	         					break;
	         					}
	         				}				
						});
						$("#select2").on("click", function(){   // 답선택 td id별로 클릭이벤트 부여						
							var img = document.createElement("img");
							img.setAttribute("src","/5bject/image/game/game2/arrow2.jpg" );
	         				img.setAttribute("width","100px" );
	         				img.setAttribute("height","100px" );
	         				for(var i = 1; i <= step; i++){
	         					var result = document.getElementById("result"+i);
	         					if(!(result.hasChildNodes())){
	         					$(result).append(img);
	         					answerXLoc = answerXLoc + 1;
	         					break;
	         					}
	         				}				
						});
						$("#select3").on("click", function(){   // 답선택 td id별로 클릭이벤트 부여						
							var img = document.createElement("img");
							img.setAttribute("src","/5bject/image/game/game2/arrow3.jpg" );
	         				img.setAttribute("width","100px" );
	         				img.setAttribute("height","100px" );
	         				for(var i = 1; i <= step; i++){
	         					var result = document.getElementById("result"+i);
	         					if(!(result.hasChildNodes())){
	         					$(result).append(img);
	         					answerYLoc = answerYLoc - 1;
	         					break;
	         					}
	         				}				
						});
						$("#select4").on("click", function(){   // 답선택 td id별로 클릭이벤트 부여						
							var img = document.createElement("img");
							img.setAttribute("src","/5bject/image/game/game2/arrow4.jpg" );
	         				img.setAttribute("width","100px" );
	         				img.setAttribute("height","100px" );
	         				for(var i = 1; i <= step; i++){
	         					var result = document.getElementById("result"+i);
	         					if(!(result.hasChildNodes())){
	         					$(result).append(img);
	         					answerYLoc = answerYLoc + 1;
	         					break;
	         					}
	         				}				
						});
						//정답 검증 로직
						$("#button").on("click", function(){
							verificationXLoc =  fishXLoc - catXLoc;
							verificationYLoc =   fishYLoc - catYLoc;
							/* alert(answerXLoc+" - "+answerYLoc+" - "+verificationXLoc
									+" - "+verificationYLoc); */
							//정답시
							if((verificationXLoc==answerXLoc)&&(verificationYLoc==answerYLoc)){
								window.open("/game/game2_correctPop.do", "pop", "width=400, height=150, top=50, left=150");
								var catImg = document.createElement("img");
		         				catImg.setAttribute("src","/5bject/image/game/game2/smilecat.jpg" );
		         				catImg.setAttribute("width","150px" );
		         				catImg.setAttribute("height","100px" );
		         				var fishLoc = "td4"+fishXLoc+fishYLoc;
		         				var catLoc = "td4"+catXLoc+catYLoc;
		         				$("#"+catLoc).empty();
		         				$("#"+fishLoc).empty();
		         				$("#"+fishLoc).append(catImg);
							//오답시	
							}else{
								window.open("/game/game2_incorrectPop.do", "pop", "width=400, height=150, top=50, left=150");
								var catImg = document.createElement("img");
		         				catImg.setAttribute("src","/5bject/image/game/game2/cryingcat.jpg" );
		         				catImg.setAttribute("width","150px" );
		         				catImg.setAttribute("height","100px" );
		         				var fishLoc = "td4"+fishXLoc+fishYLoc;
		         				var catLoc = "td4"+catXLoc+catYLoc;
		         				$("#"+catLoc).empty(); 
		         				$("#"+fishLoc).empty();
		         				answerXLoc = answerXLoc + catXLoc;
		         				answerYLoc = answerYLoc + catYLoc;
		         				if(4 < answerXLoc){
		         					answerXLoc = 4;
		         				}else if(4 < answerYLoc){
		         					answerYLoc = 4;
		         				}else if(answerXLoc < 1){
		         					answerXLoc = 1;
		         				}else if(answerYLoc < 1){
		         					answerYLoc = 1;
		         				}
		         				var id = "td4"+answerXLoc+answerYLoc;
		         				$("#"+id).append(catImg);
		         				alert("고양이가 더이상 갈 수 없어요.");
							}
						});
						//지우기버튼
						$("#resetButton").on("click", function(){
							for(var i = 1; i <=step; i++){
							$("#result"+i).empty();
								for(var j = 1; j <5; j++){
									var id1 = "td4"+i+j;
									$("#"+id1).empty();
								}
							}
							answerXLoc = 0;
							answerYLoc = 0;
							var fishImg = document.createElement("img");
	         				fishImg.setAttribute("src","/5bject/image/game/game2/fish.jpg" );
	         				fishImg.setAttribute("width","150px" );
	         				fishImg.setAttribute("height","100px" );
	         				var id1 = "td4"+fishXLoc+fishYLoc;
							$("#"+id1).append(fishImg);
							var catImg = document.createElement("img");
	         				catImg.setAttribute("src","/5bject/image/game/game2/angrycat.jpg" );
	         				catImg.setAttribute("width","150px" );
	         				catImg.setAttribute("height","100px" );
	         				var id2 = "td4"+catXLoc+catYLoc;
	         				$("#"+id2).append(catImg); 
						});
				}else{//난이도 하~중 일때 처리
				$("#button").on("click", function(){
					var answer = $('input[name="answer"]:checked').val();
					//정답시
					if ( answer == 1 ) {
						//alert("정답");   
						window.open("/game/game2_correctPop.do", "pop",
								"width=400, height=150, top=50, left=150");
						var catImg = document.createElement("img");
         				catImg.setAttribute("src","/5bject/image/game/game2/smilecat.jpg" );
         				catImg.setAttribute("width","150px" );
         				catImg.setAttribute("height","100px" );
         				$("td").empty();
         				$("td:eq(3)").append(catImg); 
         			//오답시
					} else if ( answer == 2 ) {
						window.open("/game/game2_incorrectPop.do", "pop",
								"width=400, height=150, top=50, left=150"); 
						// window.open("팝업창 웹페이지","윈도우명","width=350,height=400,top=50,left=150");
						var catImg = document.createElement("img");
         				catImg.setAttribute("src","/5bject/image/game/game2/cryingcat.jpg" );
         				catImg.setAttribute("width","150px" );
         				catImg.setAttribute("height","100px" );
         				$("td").empty();
         				$("td:eq(3)").append(catImg); 
         			} else {
						alert("답을 선택해주세요");
         			}								
      			});
				}
			});
		</script>
</head>
<body id="body">
	<DIV ID="dva">Top</DIV>
	<DIV ID="dvb">
		<DIV id="dve">
			<table id="gameTable">
			</table>
		</DIV>

		<div id="dvf">
			<div id="question"></div>

			<!-- 선택지 div -->
			<div id="dvg"></div>
			<div id="dvg">
				<input type="button" value="제출" id="button">
				<input type="button" value ="초기화" id="resetButton">
			</div>
		</div>
	</DIV>

	<DIV ID="dvd">Bottom</DIV>
</body>
</html>