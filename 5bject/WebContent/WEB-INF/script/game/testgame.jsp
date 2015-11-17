<%@page contentType = "text/html;charset=UTF-8" %>

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
			$(document).ready(function(){
				// var difficulty = 3;  //게임링크로 넘어올때에 난이도값을 받아올 변수
    			var difficulty = '${ sessionScope.difficulty}';
    
				/*
   				var gameTable = document.getElementById("gameTable");   
      			while(gameTable.hasChildNodes()){
         			gameTable.removeChild();
      			}
      			*/

				//난이도에 따라 테이블을 자동생성하는 function
				for ( var j = 0; j < difficulty; j++ ) {         
					tr = document.createElement("tr");
					$(gameTable).append(tr);
					//gameTable.appendChild(tr);      
					for ( var i = 0; i < difficulty; i++ ) {
						td = document.createElement("td");
						td.setAttribute("id", "td" + difficulty);
						$(tr).append(td);
						// gameTable.appendChild( document.createElement("td"));
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
      			} if ( difficulty == 3 ) {
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
      			} if ( difficulty == 4 ) {
         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "1");
         			$("#dvg").append(input);
         			
         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/hard/hard1.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);

         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);
         			
         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/hard/hard2.jpg" );
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
         			img.setAttribute("src","/5bject/image/game/game2/hard/hard3.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
         			
         			var input = document.createElement("input");
         			input.setAttribute("type", "radio");
         			input.setAttribute("name", "answer");
         			input.setAttribute("value", "2");
         			$("#dvg").append(input);
         			
         			var img = document.createElement("img");
         			img.setAttribute("src","/5bject/image/game/game2/hard/hard4.jpg" );
         			img.setAttribute("width","200px" );
         			img.setAttribute("height","100px" );
         			$("#dvg").append(img);
      			}
      
				//정답 체크 버튼 function
				$("#button").on("click", function(){
					var answer = $('input[name="answer"]:checked').val();

					if ( answer == 1 ) {
						//alert("정답");   
						alert("a");
						window.open("./correct.jsp", "pop", "width=320, height=570, top=50, left=150"); 
						// window.open("팝업창 웹페이지","윈도우명","width=350,height=400,top=50,left=150"); 
         			} else if ( answer == 2 ) {
						alert("b");
						window.open("./incorrect.jsp", "pop", "width=320, height=570, top=50, left=150"); 
						// window.open("팝업창 웹페이지","윈도우명","width=350,height=400,top=50,left=150"); 
         			} else {
						alert("답을 선택해주세요");
         			}
      			});
			});
		</script>
	</head>
	<body id="body">
		<DIV ID="dva">Top</DIV>
		<DIV ID="dvb">
			<DIV id="dve">
				<table id="gameTable" >   
				</table>
			</DIV>

			<div id="dvf">   
			<div>
         		다음 중 고양이가 생선에게 갈 수 있는 알고리즘은 무엇일까요?<p>
			</div>

			<!-- 선택지 div -->
			<div id ="dvg">
         
				<!-- <input type="radio" name="answer" value="2">
				<img src="/5bject/image/game/game2/easy/easy1.jpg" width="200px" height="100px">
				<input type="radio" name="answer" value="1">
				<img src="/5bject/image/game/game2/easy/easy2.jpg"  width="200px" height="100px">
				<br>
				<input type="radio" name="answer" value="2">
				<img src="/5bject/image/game/game2/easy/easy3.jpg"  width="200px" height="100px">
				<input type="radio" name="answer" value="2">
				<img src="/5bject/image/game/game2/easy/easy4.jpg" width="200px" height="100px" >
				<p> -->
          
			</div>
			<div id="dvg">
				<input type="button" value="제출" id="button">
			</div>
		</div>
	</DIV>

	<DIV ID="dvd">Bottom</DIV>
	</body>
</html>