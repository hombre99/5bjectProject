<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset= " UTF-8" >
<title>game3</title>
<script type="text/javascript" src ="/5bject/jquery.do"></script>
<script type="text/javascript">

	var gameTime;
	var easyGameProblem=4;
	var normalGameProblem = 9;
	var hardGameProblem = 16;
	
	$(document).ready(function(){
		var startBtn = document.createElement("input");
		startBtn.setAttribute("type", "button");
		startBtn.setAttribute("id", "gameStart");
		startBtn.setAttribute("value", "게임시작");
		
		$("div#menu").append(startBtn);
		
		var hr = document.createElement("hr");
		$("#gameStart").after(hr);
		
		var inputWord = document.createElement("input");
		inputWord.setAttribute("type", "text");
		inputWord.setAttribute("id", "inputWord");
		
		var inputBtn = document.createElement("input");
		inputBtn.setAttribute("type", "button");
		inputBtn.setAttribute("id", "inputBtn");
		inputBtn.setAttribute("value", "입력");
		
		$("div#input").append(inputWord);
		$("div#input").append(inputBtn);
		
		var txt = 0;
		var time = "남은시간";
		var firstScore = document.createTextNode(txt);
		var remainTime = document.createTextNode(time);
		
		// 스코어 보드 테이블 생성		
		var scoreTable = document.createElement("table");
		scoreTable.setAttribute("id", "scoreTable");
		
		for ( var i = 1; i < 4; i++ ) {
			var tr = document.createElement("tr");
			tr.setAttribute("id", "scoreTr" + i);
			
			var td = document.createElement("td");
			td.setAttribute("id", "scoreTd" + i);
				
			$(tr).append(td);

			if ( i == 1 )
				$(td).append(firstScore);
			else if ( i == 2 )
				$(td).append(remainTime);

			$(scoreTable).append(tr);
		}

		$("div#score").append(scoreTable);
		
		$("#gameStart").on("click",function(){
			var menu = $("div#menu");			
			menu.empty();
			
			var level = ["hard", "normal", "easy"];

			for ( var i = 0; i < 3; i++ ) {
				var levelBtn = document.createElement("input");
				levelBtn.setAttribute("type", "button");
				levelBtn.setAttribute("id", level[i]);
				levelBtn.setAttribute("value", level[i]);
				menu.append(levelBtn);
			}

			menu.append(hr);
			
			//	난이도 하 게임
			$("#easy").on("click", function() {
				gameTime = 30;
				var timer = setInterval( function (){
						gameTime--;
						$("#easy").on("click", function(){
							clearInterval(timer);
						});

						$("#normal").on("click", function(){
							clearInterval(timer);
						});

						$("#hard").on("click", function(){
							clearInterval(timer);
						});

						if(gameTime<0){
							alert("게임 오버");
							location.href = "start.jsp";
						}
						
						$("#scoreTd2").text(gameTime);						
					}				
				, 1000);

				var game = $("div#display");
				game.empty();
				var gameWords = new Array(4);	
				var randomNum = new Array();				
				randomNum = shuffleRandom(28);
				
				for ( var k = 0; k < gameWords.length; k++ ) {
					gameWords[k] = words[randomNum[k]];
					var lowGameTable = document.createElement("table");
					lowGameTable.setAttribute("id", "lowGameTable");					
					
					for(var idx = 0 ; idx<2 ; idx++){
							var tr = document.createElement("tr");
							var td1 = document.createElement("td");
							td1.setAttribute("id" , "lowGameTd"+idx);
							var td2 = document.createElement("td");
							td2.setAttribute("id", "lowGameTd"+(idx+2));
							
							var lowGameWords1 = document.createTextNode(gameWords[idx]);
							var lowGameWords2 = document.createTextNode(gameWords[idx+2]);
							
							td1.appendChild(lowGameWords1);
							td2.appendChild(lowGameWords2);

							tr.appendChild(td1);
							tr.appendChild(td2);
							
							lowGameTable.appendChild(tr);
					}					
				}
				
				game.append(lowGameTable);
				alert("선택된 난이도는 하 입니다.");
				$("#inputBtn").on("click",function(){
					
					var inputValue = document.getElementById("inputWord").value;
					for(var q = 0 ; q < 4 ; q++){						
						var inputTd = document.getElementById("lowGameTd"+q);
						var inputText = document.getElementById("lowGameTd"+q).innerText;
						var scoreTd = document.getElementById("scoreTd1");
						if(inputText == inputValue){
							inputTd.removeChild(inputTd.firstChild);
							scoreTd.innerHTML =eval(scoreTd.innerText)+10;							
							easyGameProblem--;
							alert("정답입니다.");				
						}
					}				
					if(easyGameProblem==0){
						alert(gameTime);
					}
				});
			});
			
			// 난이도 중 게임
			
			$("#normal").on("click",function(){
				gameTime = 50;
				var timer = setInterval( function(){
						gameTime--;					
						$("#easy").on("click", function(){
							clearInterval(timer);
						});

						$("#normal").on("click", function(){
							clearInterval(timer);
						});

						$("#hard").on("click", function(){
							clearInterval(timer);
						});
						
						if(gameTime<0){
							alert("게임 오버");
							location.href = "start.jsp";
						}
						$("#scoreTd2").text(gameTime);
					}
				, 1000);
				
				var gameWords = new Array(9);
				var randomNum = new Array();
				
				var game = $("div#display");
				game.empty();
				
				randomNum = shuffleRandom(28);
				
				for(var k = 0 ; k < gameWords.length ; k++){
					gameWords[k] = words[randomNum[k]];
					var middleGameTable = document.createElement("table");
					middleGameTable.setAttribute("id", "middleGameTable");
					
					for(var idx = 0 ; idx<3 ; idx++){
						var tr = document.createElement("tr");
							
						var td1 = document.createElement("td");
						td1.setAttribute("id" , "middleGameTd"+idx);
						var td2 = document.createElement("td");
						td2.setAttribute("id", "middleGameTd"+(idx+3));
						var td3 = document.createElement("td");
						td3.setAttribute("id", "middleGameTd"+(idx+6));
							
						var middleGameWords1 = document.createTextNode(gameWords[idx]);
						var middleGameWords2 = document.createTextNode(gameWords[idx+3]);
						var middleGameWords3 = document.createTextNode(gameWords[idx+6]);
						
						td1.appendChild(middleGameWords1);
						td2.appendChild(middleGameWords2);
						td3.appendChild(middleGameWords3);
							
						tr.appendChild(td1);
						tr.appendChild(td2);
						tr.appendChild(td3);
							
						middleGameTable.appendChild(tr);
					}
				}
				
				game.append(middleGameTable);
				alert("난이도 중이 선택되었습니다.");

				$("#inputBtn").on("click",function(){
					var inputValue = document.getElementById("inputWord").value;
					for(var q = 0 ; q < 9 ; q++){											
						var inputTd = document.getElementById("middleGameTd"+q);
						var inputText = document.getElementById("middleGameTd"+q).innerText;
						var scoreTd = document.getElementById("scoreTd1");
						if(inputText == inputValue){
							inputTd.removeChild(inputTd.firstChild);
							scoreTd.innerHTML =eval(scoreTd.innerText)+10;							
							normalGameProblem--;
							alert("정답입니다.");							
						}
					}
					if(normalGameProblem == 0 ){
						alert(gameTime);
					}
				});
			});
			
			$("#hard").on("click",function(){
 				gameTime = 75;
				var timer = setInterval( function(){
						gameTime--;					
						$("#easy").on("click", function(){
							clearInterval(timer);
						});

						$("#normal").on("click", function(){
							clearInterval(timer);
						});

						$("#hard").on("click", function(){
							clearInterval(timer);
						});			
								
						if(gameTime<0){
							alert("게임 오버");
							location.href = "start.jsp";
						}
						$("#scoreTd2").text(gameTime);
					}
				, 1000);
				
				var gameWords = new Array(16);
				var randomNum = new Array();
				
				var game = $("div#display");
				game.empty();
				
				randomNum = shuffleRandom(28);
				
				for(var k = 0 ; k < gameWords.length ; k++){
					gameWords[k] = words[randomNum[k]];
					var highGameTable = document.createElement("table");
					highGameTable.setAttribute("id", "highGameTable");
					
					for(var idx = 0 ; idx<4 ; idx++){
						var tr = document.createElement("tr");

						var td1 = document.createElement("td");
						td1.setAttribute("id" , "highGameTd"+idx);
						
						var td2 = document.createElement("td");
						td2.setAttribute("id", "highGameTd"+(idx+4));
						
						var td3 = document.createElement("td");
						td3.setAttribute("id", "highGameTd"+(idx+8));
						
						var td4 = document.createElement("td");
						td4.setAttribute("id", "highGameTd"+(idx+12));
						
						var highGameWords1 = document.createTextNode(gameWords[idx]);
						var highGameWords2 = document.createTextNode(gameWords[idx+4]);
						var highGameWords3 = document.createTextNode(gameWords[idx+8]);
						var highGameWords4 = document.createTextNode(gameWords[idx+12]);
						
						td1.appendChild(highGameWords1);
						td2.appendChild(highGameWords2);
						td3.appendChild(highGameWords3);
						td4.appendChild(highGameWords4);
						
						tr.appendChild(td1);
						tr.appendChild(td2);
						tr.appendChild(td3);
						tr.appendChild(td4);
						
						highGameTable.appendChild(tr);
					}
				}
				
				game.append(highGameTable);
				alert("난이도 상이 선택되었습니다.");
				
				$("#inputBtn").on("click",function(){
					var inputValue = document.getElementById("inputWord").value;
					for(var q = 0 ; q < 16 ; q++){											
						var inputTd = document.getElementById("highGameTd"+q);
						var inputText = document.getElementById("highGameTd"+q).innerText;
						var scoreTd = document.getElementById("scoreTd1");
						if(inputText == inputValue){
							inputTd.removeChild(inputTd.firstChild);
							scoreTd.innerHTML =eval(scoreTd.innerText)+10;							
							hardGameProblem--;
							alert("정답입니다.");
						}
					}
					if(hardGameProblem == 0){
						alert(gameTime);
					}
					
				});
			});
		});

	// 랜덤으로 뽑아온 숫자 중복방지  기능
	function shuffleRandom(k){
	    var ar = new Array();
	    var temp;
	    var rnum;

	    for(var i=0; i<k; i++){
	        ar.push(i);
	    }

	    for(var i=0; i< ar.length ; i++)
	    {
	        rnum = Math.floor(Math.random() *k);
	        temp = ar[i];
	        ar[i] = ar[rnum];
	        ar[rnum] = temp;
	    }
	    return ar;
	}
	
	function playingGame() {
		gameTime--;
		$("#easy").on("click", function(){
			clearInterval(timer);
		});

		$("#normal").on("click", function(){
			clearInterval(timer);
		});

		$("#hard").on("click", function(){
			clearInterval(timer);
		});

		if(gameTime<0){
			alert("게임 오버");
			location.href = "start.jsp";
		}
		
		$("#scoreTd2").text(gameTime);						
	}	
	
	/*
	function createGameTable() {
		for ( var i = 0; i < 2; i++ ) {
			var tr = document.createElement("tr");
			var td1 = document.createElement("td");
			td1.setAttribute("id" , "lowGameTd"+idx);
			var td2 = document.createElement("td");
			td2.setAttribute("id", "lowGameTd"+(idx+2));
			
			var lowGameWords1 = document.createTextNode(gameWords[idx]);
			var lowGameWords2 = document.createTextNode(gameWords[idx+2]);
			
			td1.appendChild(lowGameWords1);
			td2.appendChild(lowGameWords2);

			for ( var j = 0; j < 2; j++ ) {
				var td = document.createElement("td");
				td.setAttribute("id", "GameTd" + (i + j));

				$(td).append(gameWord);
				$(tr).append(td);
			}
		}	
	}
	*/
	
	var words =["public","void","main","request","response","bean","getter","setter","class","interface","arraylist","hashmap",
	             "list","map","exception","java","a","b","c","d","e","f","g","h","i","j","k","q"];	


});	
	
</script>
<style type="text/css">

#game {
	width: 800px;
	height: 600px;
	border-width: 1px;
}

#display {
	background-color: yellow;
	height: 500px;
}

#score{
	width:150px;
	height : 500px;
	float: right;
	background-color: pink;
	border-width: 1px;
}

#input {
	background-color: skyblue;
	height: 75px;
}

#inputWord{
	position: relative;
	top : 10px;
  	left: 300px;
	width:150px;
	height:45px;
}

#inputBtn{
	position: relative;
	top : 10px;
  	left: 300px;
  	background-color: white;
	width:75px;
	height:30px;
}
tr,td{
	border: 5px solid red;
}

#lowGameTable{
		table-layout:fixed;
		border-collapse:collapse;
		color: black;
		width:500px;
		height:450px;
		margin: auto;		
		text-align : center;	
		font-size: 50px;
		border: 5px solid red;
}


#middleGameTable{
		table-layout:fixed;
		border-collapse:collapse;
		color: black;
		width:500px;
		height:450px;
		margin: auto;
		font-size : 30px;
		text-align: center;
		border: 5px solid red;
}

#highGameTable{
		table-layout:fixed;
		border-collapse:collapse;
		color: black;
		width:500px;
		height:450px;
		margin: auto;	
		font-size : 20px;
		text-align: center;	
		border: 5px solid red;
}

#scoreTable{
		margin: auto;	
		color : black;
		width : 130px;
		border-collapse:collapse;
		height: 400px;
		border: 5px solid black;
		font-size: 25px;
		text-align : center;	
}
#scoreTr1,#scoreTr2,#scoreTr3,#scoreTd1,#scoreTd2,#scoreTd3{
	border: 5px solid black;
}

</style>
</head>
<body>
	<div id="menu">
	</div>
	<div id="game">
		<div id="score">
		</div>
		<div id="display">
		</div>
		<div id="input">
		</div>
	</div>
</body>
</html>