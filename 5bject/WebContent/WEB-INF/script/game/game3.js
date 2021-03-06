$(document).ready(function(){
	var gameTime = 0;				// 난이도 별 게임 시간
	var gameGrade = "";				// 난이도 별 id에 사용될 이름변수
	var gameDifficulty = 0;			// 난이도별 게임 단어 수
	var answerCount = 0;			// 남은 정답 갯수
	var totalScore = 0;				// 죄종 점수
	var easyScore = -1;
	var normalScore = -1;
	var hardScore = -1;

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

	// 게임단어 받는 배열
	var words = new Array();
	
	$.ajax({
		"url" : "/5bject/game/findPlayingWord.do",
		"data" : { "gameNum" : gameNum,
					"difficulty" : difficulty },
		"type" : "POST",
		"dataType" : "json",
		"success" : function(array) {
						words = new Array(array.length);
						for ( var i = 0; i < array.length; i++ ) {
							words[i] = array[i].word;
    					}
						startGame();
					},
		"error" : function(request, status, error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						location.reload();
					}
	});

	// 난이도에 따라 사용될 단어 갯수만큼 저장할 배열
	var gameWords = new Array(gameDifficulty);	
	var display = $("div#display");

	function startGame() {
		var randomNum = shuffleRandom(words.length);

		for ( var i = 0; i < gameWords.length; i++ ) {
			gameWords[i] = words[randomNum[i]];
		}
				
		alert("타자게임을 시작합니다.");
	
		// 게임 단어를 보여줄 테이블 생성
		createGameTable();

		var inputWord = document.createElement("input");
		inputWord.setAttribute("type", "text");
		inputWord.setAttribute("id", "inputWord");
		$(inputWord).css("width", "400px");
	
		var inputBtn = document.createElement("input");
		inputBtn.setAttribute("type", "button");
		inputBtn.setAttribute("id", "inputBtn");
		inputBtn.setAttribute("value", "입력");
	
		$("#display2").append(inputWord);
		$("#display2").append(inputBtn);
	
		$(inputWord).focus();

		var txt = 0;
		var time = "남은시간";
		var firstScore = document.createTextNode(txt);
		var remainTime = document.createTextNode(time);
	
		// 스코어 보드 테이블 생성
		var scoreTable = document.createElement("table");
		scoreTable.setAttribute("id", "scoreTable");
	
		for ( var i = 1; i < 3; i++ ) {
			var tr = document.createElement("tr");
			tr.setAttribute("id", "scoreTr" + i);
		
			var td = document.createElement("td");
			td.setAttribute("id", "scoreTd" + i);
			
			$(td).css("text-align", "center");
			$(tr).append(td);

			if ( i == 1 )		$(td).append(firstScore);
			else if ( i == 2 )	$(td).append(remainTime);

			$(scoreTable).append(tr);
		}
		$(scoreTable).css("width", "100px").css("height", "250px");
		$("div#score").append(scoreTable);
	
		var timer = setInterval( function() {
				if ( gameTime < 1 || totalScore ) {
					alert("게임이 끝났습니다." + (totalScore ? " " + totalScore + "점 입니다." : ""));
					clearInterval(timer);
					if ( !loginId ) {
						alert("비회원은 점수가 저장되지 않습니다.");
						if ( confirm("다시 시작하시겠습니까?") ) {
							location.reload();
						} else {
							location.replace("/5bject/main.do");
						}
					} else {
						if ( difficulty == 2 )
							easyScore = totalScore;
						else if ( difficulty == 3 )
							normalScore = totalScore;
						else if ( difficulty == 4 )
							hardScore = totalScore;

						$.ajax({
							"url" : "/5bject/game/setGameScore.do",
							"data" : { "id" : loginId,
										"gameNum" : gameNum,
										"easy" : easyScore,
										"normal" : normalScore,
										"hard" : hardScore,
										"difficulty" : difficulty },
							"type" : "POST",
							"success" : function() {
											if ( confirm("다시 시작하시겠습니까?") ) {
												location.reload();
											} else {
												location.replace("/5bject/main.do");
											}
										},
							"error" : function(request, status, error) {
											alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
											location.reload();
										}
						});
					}
				}

				$("#scoreTd2").text(gameTime);
				gameTime--;
			} , 1000);
	
		$("#inputBtn").on("click", function() {
			var inputTxtValue = document.getElementById("inputWord");
			var scoreTd = document.getElementById("scoreTd1");

			for ( var i = 0; i < gameDifficulty; i++ ) {
				var inputTd = document.getElementById("GameTd" + i);
				var inputText = document.getElementById("GameTd" + i).innerText;

				if ( inputText == inputTxtValue.value ) {
					if ( inputTd.hasChildNodes() ) {
						inputTd.removeChild(inputTd.firstChild);
						scoreTd.innerHTML = eval(scoreTd.innerText) + 10;							
						answerCount--;
						break;
					}
				}
			}

			$(inputTxtValue).val("").focus();

			if ( answerCount == 0 ) {
				// 점수계산 : (맞춘갯수 * 10) + 남은시간
				totalScore = eval(scoreTd.innerText) + gameTime;
			}
		});

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
							break;
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
	};

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
		var maxTableWidth = 730;
		var maxTableHeight = 250;
		var gameTable = document.createElement("table");
		$(gameTable).css({
			"margin-left": "auto",
			"margin-right": "auto",
			"border-style":"inset"
		});
		$(gameTable).css("word-break", "break-all");

		var gameWordsIndex = 0;
		for ( var i = 0; i < difficulty; i++ ) {
			var tr = document.createElement("tr");
			
			for ( var j = 0; j < difficulty; j++ ) {
				var td = document.createElement("td");
				td.setAttribute("id", "GameTd" + (gameWordsIndex));

				var gameWord = document.createTextNode(gameWords[gameWordsIndex]);
				$(td).css("word-break", "break-all");
				$(td).css("text-align", "center");
				$(td).css("font-weight", "bold");
				$(td).css("width", (maxTableWidth / difficulty) + "px").css("height", (maxTableHeight / difficulty) + "px").append(gameWord);
				$(tr).append(td);
				gameWordsIndex++;
			}
			$(gameTable).append(tr);
		}	
		// display.append(gameTable);
		display.children().eq(0).before(gameTable);
	}
	
	/* 메인페이지 클릭이벤트 등록 */
	$("#link2").on("click", function() {
		window.open("/5bject/game/select_game.do", "ok", "width=880,height=310,top=300,left=300,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	/*width height 설정 수정 20151125*/
	$("#register_link").on("click", function() {
		window.open("/5bject/member/register.do" ,"ok", "width=500, height=900,toolbar=0,location=0,status=0,menubar=0,resizable=0");
	});

	$("#update_link").on("click",function() {
		window.open("/5bject/member/update.do", "ok", "width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	// width, height change. 20151126. CHJ
	$("#language_link").on("click", function() {
		// 웹 브라우저 체크
		var agent = navigator.userAgent.toLowerCase();

		if (agent.indexOf("chrome") != -1)
			window.open("/5bject/language/computer_language.do","ok","width=1220, height=950,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
		else
			window.open("/5bject/language/computer_language.do","ok","width=1220, height=930,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	//  20151125 same
	$("#mypage_link").on("click", function() {
		window.open("/5bject/member/mypage.do", "ok", "width=600, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	// 20151120. ADD KKH - 포인터 발생
	$(".findInfo").css("cursor", "pointer").css("text-decoration", "none !important");

	$("#logout_link").on("click", function() {
		if ( confirm("로그아웃하시겠습니까?") ) {
			location.replace("/5bject/member/logout.do");
		}
	});

	//20151125 width 900으로 change
	$("#memberList").on("click", function() {
		window.open("/5bject/member/memberList.do?pageNo=${param.pageNo}","ok","width=900, height=700");
	});

	/* chj 20151120 link ADD*/
	$("#request_list").on("click", function() {
		window.open("/5bject/member/request_list.do?pageNo=${param.pageNo}", "ok", "width=1000, height=700");
	});

	$("#gameInfo").on("click", function() {
		window.open("/5bject/game/findAllWord.do?pageNo=${param.pageNo}", "ok", "width=1000, height=700");
	})

	// 20151127. ADD. JSJ.
	$("#login").on("click", login);

	$("input#loginPassword").on("keypress", function() {
		if ( event.keyCode == 13 ) {
			login();
		}
	});
});