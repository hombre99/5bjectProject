$(document).ready(function() {
	var selectAnswer;
	var step;
	var fishXLoc ;
	var fishYLoc ;
	var catXLoc ;
	var catYLoc ;

	//난이도에 따라 테이블을 자동생성하는 function
	var gameTable = document.createElement("table");
	$("div#gamePannel").append(gameTable);
	
	for ( var j = 1; j <= difficulty; j++ ) {         
		tr = document.createElement("tr");
		$(gameTable).append(tr);  

		for ( var i = 1; i <= difficulty; i++ ) {
			td = document.createElement("td");
			if ( difficulty ==4 ){ 						
				td.setAttribute("id", "td" + difficulty+j+i);
				$(td).css({"border" : "1px solid black",
							"padding": "0px",
							"height": "100px",
							"width": "150px",
							"position": "relative",
							"text-align": "center"});
			} else {
				td.setAttribute("id", "td" + difficulty);
			}

			$(tr).append(td);
		}
	}

	var locCheck = true;

	while ( locCheck ) {
		fishXLoc = Math.floor(Math.random()*4)+1;
		fishYLoc = Math.floor(Math.random()*4)+1;
		catXLoc = Math.floor(Math.random()*4)+1;
		catYLoc = Math.floor(Math.random()*4)+1;

		var max = Math.max((fishXLoc+fishYLoc) ,(catXLoc+catYLoc));
		var min = Math.min((fishXLoc+fishYLoc) ,(catXLoc+catYLoc));

		step = max-min;

		if( ( 3 < step ) && ( step < 7 ) && !( fishXLoc == catXLoc ) ) {
			var fishImg = document.createElement("img");
			fishImg.setAttribute("src", "/5bject/image/game/game2/fish.jpg" );
			fishImg.setAttribute("width", "150px" );
			fishImg.setAttribute("height", "100px" );
			var id1 = "td4" + fishXLoc + fishYLoc;
			$("#" + id1).append(fishImg);

			var catImg = document.createElement("img");
			catImg.setAttribute("src", "/5bject/image/game/game2/angrycat.jpg" );
			catImg.setAttribute("width", "150px" );
			catImg.setAttribute("height", "100px" );
			var id2 = "td4" + catXLoc + catYLoc;
			$("#" + id2).append(catImg);
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
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy1.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);

		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "1");
		$("#dvg").append(input);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy2.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);
		$("#dvg").append(document.createElement("br"));

		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#dvg").append(input);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy3.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);

		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#dvg").append(input);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy4.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);
         			
		/* var catImg = document.createElement("img");
		catImg.setAttribute("src","/5bject/image/game/game2/angrycat.jpg" );
		catImg.setAttribute("width","200px" );
		catImg.setAttribute("height","100px" ); */
		//$().append(catImg); 
         			
	} else if ( difficulty == 3 ) {
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#dvg").append(input);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal1.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);
         			
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#dvg").append(input);
         			
		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal2.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);
		$("#dvg").append(document.createElement("br"));
         			
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "1");
		$("#dvg").append(input);
         			
		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal3.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);
         			
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#dvg").append(input);
         			
		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal4.jpg" );
		img.setAttribute("width", "200px" );
		img.setAttribute("height", "100px" );
		$("#dvg").append(img);
         			
	} else if ( difficulty == 4 ) {
		var table = document.createElement("table");
		$("#answerPannel").append(table);
		var tr = document.createElement("tr");
		$(table).append(tr);   
		for ( var i = 1; i < 5; i++ ) {
			td = document.createElement("td");
			td.setAttribute("id", "select"+i); //답 선택td에 id 부여
			var img = document.createElement("img");
			img.setAttribute("src", "/5bject/image/game/game2/arrow"+i+".jpg" );
			img.setAttribute("width", "100px" );
			img.setAttribute("height", "100px" );
			$(td).append(img); 			
			$(tr).append(td);
		}

		var tr = document.createElement("tr");
		$(table).append(tr); 
		for ( var i = 1 ; i < step + 1; i++ ) {
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
	if ( difficulty == 4 ) {
		$("#question").html("<h3>고양이가 생선을 먹고 싶어해요!! <br>다음 중 고양이가 생선까지 "
		+ step + "번 만에 갈 수 있는 알고리즘은 무엇일까요?</h3>");
	} else {
		$("#question").html("<h3>고양이가 생선을 먹고 싶어해요!! <br>다음 중 고양이가 생선까지 갈 수 있는 알고리즘은 무엇일까요?</h3>");
	}

	//정답 체크 버튼 function
	if ( difficulty == 4 ) {
		for ( var j = 1; j <= 4; j++ ) {
			// 답선택 td id별로 클릭이벤트 부여
			$("#select"+j).on("click", function(){
				var img = document.createElement("img");
				img.setAttribute("src", "/5bject/image/game/game2/arrow"+j+".jpg" );
				img.setAttribute("width", "100px" );
				img.setAttribute("height", "100px" );
				for ( var i = 1; i <= step; i++ ) {
					var result = document.getElementById("result" + i);
					if ( !result.hasChildNodes() ) {
						$(result).append(img);
						break;
					}
				}
			});
		};
	} else {
		$("#button").on("click", function(){
			var answer = $('input[name="answer"]:checked').val();
			if ( answer == 1 ) {
				//alert("정답");   
				window.open("./correct.jsp", "pop", "width=400, height=150, top=50, left=150"); 
				// window.open("팝업창 웹페이지","윈도우명","width=350,height=400,top=50,left=150"); 
			} else if ( answer == 2 ) {
				window.open("./incorrect.jsp", "pop", "width=400, height=150, top=50, left=150"); 
				// window.open("팝업창 웹페이지","윈도우명","width=350,height=400,top=50,left=150"); 
			} else {
				alert("답을 선택해주세요");
			}								
		});
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

	$("#language_link").on("click", function() {
		// TODO? CHJ
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
});