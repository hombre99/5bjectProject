$(document).ready(function(){
	var gameTime = 0;				// 난이도 별 게임 시간
	var gameGrade = "";				// 난이도 별 id에 사용될 이름변수
	var gameDifficulty = 0;			// 난이도별 게임 단어 수
	var answerCount = 0;			// 남은 정답 갯수
	var totalScore = 0;				// 죄종 점수

	if ( difficulty == 2 ) {
		// 난이도 하
		gameDifficulty = 4;
		gameGrade = "low";
		gameTime = 30;
		answerCount = gameDifficulty;
	} else if ( difficulty == 3 ) {
		// 난이도 중
		gameDifficulty = 9;
		gameGrade = "middle";
		gameTime = 50;
		answerCount = gameDifficulty;
	} else if ( difficulty == 4 ) {
		// 난이도 상
		gameDifficulty = 16;
		gameGrade = "high";
		gameTime = 75;
		answerCount = gameDifficulty;
	}

	// 테스트용 단어 배열
	var words =["public","void","main","request","response","bean","getter","setter","class","interface","arraylist","hashmap",
             	"list","map","exception","java","a","b","c","d","e","f","g","h","i","j","k","q"];	

	// 난이도에 따라 사용될 단어 갯수만큼 저장할 배열
	var gameWords = new Array(gameDifficulty);	
	var randomNum = shuffleRandom(words.length);

	for ( var i = 0; i < gameWords.length; i++ ) {
		gameWords[i] = words[randomNum[i]];
	}
				
	var display = $("div#display");
	
	alert("타자게임을 시작합니다.");
	
	// 게임 단어를 보여줄 테이블 생성
	createGameTable();

	var inputWord = document.createElement("input");
	inputWord.setAttribute("type", "text");
	inputWord.setAttribute("id", "inputWord");
	
	var inputBtn = document.createElement("input");
	inputBtn.setAttribute("type", "button");
	inputBtn.setAttribute("id", "inputBtn");
	inputBtn.setAttribute("value", "입력");
	
	$("div#input").append(inputWord);
	$("div#input").append(inputBtn);
	
	$(inputWord).focus();

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

		if ( i == 1 )		$(td).append(firstScore);
		else if ( i == 2 )	$(td).append(remainTime);

		$(scoreTable).append(tr);
	}

	$("div#score").append(scoreTable);
	
	var timer = setInterval( function() {
			if ( gameTime < 1 || totalScore ) {
				alert("게임이 끝났습니다." + (totalScore ? " " + totalScore + "점 입니다." : ""));
				clearInterval(timer);

				if ( confirm("다시 시작하시겠습니까?") ) {
					location.reload();
				}
			}

			$("#scoreTd2").text(gameTime);
			gameTime--;
		} , 1000);
	
	
	// 엔터 입력시 정답 체크 로직
	$("input#inputWord").on("keypress", function() {
		if ( event.keyCode == 13 ) {
			var inputValue = document.getElementById("inputWord").value;
			var scoreTd = document.getElementById("scoreTd1");

			for ( var i = 0; i < gameDifficulty; i++ ) {
				var inputTd = document.getElementById("GameTd" + i);
				var inputText = document.getElementById("GameTd" + i).innerText;

				if ( inputText == inputValue ) {
					if ( inputTd.hasChildNodes() ) {
						inputTd.removeChild(inputTd.firstChild);
						scoreTd.innerHTML = eval(scoreTd.innerText) + 10;							
						answerCount--;
					}
				}
			}

			$(this).val("");

			if ( answerCount == 0 ) {
				// 점수계산 : (맞춘갯수 * 10) + 남은시간
				totalScore = eval(scoreTd.innerText) + gameTime;
			}
		}
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

	function createGameTable() {
		var gameTable = document.createElement("table");

		var gameWordsIndex = 0;
		for ( var i = 0; i < difficulty; i++ ) {
			var tr = document.createElement("tr");

			for ( var j = 0; j < difficulty; j++ ) {
				var td = document.createElement("td");
				td.setAttribute("id", "GameTd" + (gameWordsIndex));

				var gameWord = document.createTextNode(gameWords[gameWordsIndex]);
				$(td).append(gameWord);
				$(tr).append(td);
				gameWordsIndex++;
			}
			$(gameTable).append(tr);
		}	
		display.append(gameTable);
	}

	/* 메인페이지 클릭이벤트 등록 */
	$("#link2").on("click", function() {
		window.open("/5bject/game/select_game.do","ok","width=880,height=310,top=300,left=300,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	$("#register_link").on("click", function() {
		window.open("/5bject/member/register.do","ok","width=1000, height=1000,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});
	
	$("#update_link").on("click",function(){
		window.open("/5bject/member/update.do","ok","width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	// language_link ADD. 20151116. CHJ
	$("#language_link").on("click", function() {
		window.open("/5bject/language/computer_language.do","ok","width=1000, height=800,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");	
	});

	// mypage_link, logout_link ADD. 20151116. KKH
	$("#mypage_link").on("click", function() {
		window.open("/5bject/member/mypage.do","ok","width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	$("#logout_link").on("click", function() {
		if ( confirm("로그아웃하시겠습니까?") ) {
			location.replace("/5bject/member/logout.do");
		} 
	});

	$("#memberList").on("click", function() {
		window.open("/5bject/member/memberList.do");
	});

	$("#findID").on("click", function() {
		window.open("/5bject/member/findID.do", "ok", "width=400, height=150");
	});
});