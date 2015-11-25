$(document).ready(function() {
	var verificationArray = new Array();//정답 검증용 배열 
	var step;
	var startLoc;
	var paintLoc;
	var LocArray = new Array(); //전체 좌표 배열
	var paintLocArray  = new Array(); //검은색 좌표 배열
	var answerLoc;
	var painting = 1;
	var gameImgPath = "/5bject/image/game/game1";
	
	//난이도에 따라 테이블을 자동생성하는 function
	var gameTable = document.createElement("table");

	$("div#gamePannel").append(gameTable);

	for ( var j = 1; j <= difficulty; j++ ) {
		tr = document.createElement("tr");

		$(gameTable).append(tr);  

		for ( var i = 1; i <= difficulty; i++ ) {
			td = document.createElement("td");
			td.setAttribute("id", "td" + difficulty + j + i);         
			//수정요망. 난이도별 CSS 변경기능 추가
			$(td).css({"border" : "1px solid black",
						"padding" : "0px",
						"height" : "100px",
						"width" : "150px",
						"position" : "relative",
						"text-align" : "center"});
			$(tr).append(td);
		}
	}

	//난이도별로 랜덤으로 시작점과 색칠된 칸을 배치해주는 로직      
	for ( var i = 1; i <= difficulty; i++ ){
		var XLoc = i * 10;
		for ( var j= 1; j <= difficulty; j++ ){
			var YLoc = j;
			Loc = XLoc + YLoc;
			LocArray.push( Loc ); 
		}	
	}
	for ( var i = 0; i < difficulty; i++ ){
		var idx = Math.floor( Math.random() * LocArray.length ) ;
		var val = LocArray[idx];
		paintLocArray.push( val );
		verificationArray.push( val );
		LocArray.splice( idx,1 );
	}	
	startLoc = verificationArray.shift();
	paintLocArray.shift();
		for ( var i = 0; i < paintLocArray.length; i++ ) {
			var tdIdx = paintLocArray[i];	
			var tdId = "td" + difficulty + tdIdx;
			$("#" + tdId).attr("bgcolor", "black");
		}					

	step = Math.pow(difficulty,2) - 1;

	var startImg = document.createElement("img");
	startImg.setAttribute("src", gameImgPath + "/start.jpg");
	startImg.setAttribute("width", "150px"); //난이도별 이미지크기 체크 필요할듯?
	startImg.setAttribute("height", "100px");

	var id2 = "td" + difficulty + startLoc;
	$("#" + id2).append(startImg);

	answerLoc = startLoc;
	alert("answerLoc=" + answerLoc);
	//난이도 별 보기 및 선택답패널 생성로직
	var table = document.createElement("table");
	$("#selectPannel").append(table);

	var tr = document.createElement("tr");
	$(table).append(tr);   

	for ( var i = 1; i <= 5; i++ ) {
		td = document.createElement("td");
		td.setAttribute("id", "select" + i); //답 선택td에 id 부여
		var img = document.createElement("img");
		img.setAttribute("src", gameImgPath + "/arrow" + i + ".jpg");
		img.setAttribute("width", "100px");
		img.setAttribute("height", "100px");
		$(td).append(img);          
		$(tr).append(td);
	}

	var tr = document.createElement("tr");
	$(table).append(tr); 
	for ( var i = 1 ; i < step + 1; i++ ) {
		if ( difficulty==4 && i == 9 ) {
			var tr = document.createElement("tr");    
			$(table).append(tr); 
		}
			td = document.createElement("td");
			td.setAttribute("id", "result" + i); //답 선택결과td에 id 부여
			$(td).css({"border" : "1px solid black",
					"padding" : "0px",
					"height" : "100px",
					"width" : "100px",
					"position" : "relative",
					"text-align" : "center"});
			$(tr).append(td);
		}
	
	//문제 
	$("#question").html("<h3>다음 그림을 완성해 봅시다!!<br />" + step + "번 안에 왼쪽 그림과 같이 색칠할 수 있는 알고리즘을 완성해주세요.</h3>");

	//정답 체크 버튼 function
	$("#select1").on("click", function() {   // 답선택 td id별로 클릭이벤트 부여                  
		var img = document.createElement("img");
		img.setAttribute("src", gameImgPath + "/arrow1.jpg");
		img.setAttribute("width", "100px");
		img.setAttribute("height", "100px");

		for ( var i = 1; i <= step; i++ ) {
			var result = document.getElementById("result" + i);

			if ( !result.hasChildNodes() ) {
				$(result).append(img);
				answerLoc = answerLoc - 10; //X좌표 값 수정 
				painting = 1;
				break;
			}
		}      
		
	});
	
	$("#select2").on("click", function(){   // 답선택 td id별로 클릭이벤트 부여                  
		var img = document.createElement("img");
		img.setAttribute("src", gameImgPath + "/arrow2.jpg");
		img.setAttribute("width", "100px");
		img.setAttribute("height", "100px");

		for ( var i = 1; i <= step; i++ ) {
			var result = document.getElementById("result" + i);

			if ( !result.hasChildNodes() ) {
				$(result).append(img);
				answerLoc = answerLoc + 10;
				painting = 1;
				break;
			}
		}   
	});

	$("#select3").on("click", function() {   // 답선택 td id별로 클릭이벤트 부여                  
		var img = document.createElement("img");
		img.setAttribute("src", gameImgPath + "/arrow3.jpg");
		img.setAttribute("width", "100px");
		img.setAttribute("height", "100px");

		for ( var i = 1; i <= step; i++ ) {
			var result = document.getElementById("result" + i);

			if ( !result.hasChildNodes() ) {
				$(result).append(img);
				answerLoc = answerLoc - 1;
				painting = 1;
				break;
			}
		}
	});

	$("#select4").on("click", function() {   // 답선택 td id별로 클릭이벤트 부여                  
		var img = document.createElement("img");
		img.setAttribute("src", gameImgPath + "/arrow4.jpg");
		img.setAttribute("width", "100px");
		img.setAttribute("height", "100px");

		for ( var i = 1; i <= step; i++ ) {
			var result = document.getElementById("result" + i);

			if ( !result.hasChildNodes() ) {
				$(result).append(img);
				answerLoc = answerLoc + 1;
				painting = 1;
				break;
			}
		}
	});

	$("#select5").on("click", function() {   // 클릭이벤트 및 정답값 처리               
		if ( painting == 0 ) {
			alert("색을 연속으로 칠할 수 없어요~");
			return;
		}

		var img = document.createElement("img");
		img.setAttribute("src", gameImgPath + "/arrow5.jpg");
		img.setAttribute("width", "100px");
		img.setAttribute("height", "100px");
		
		for ( var i = 1; i <= step; i++ ) {
			var result = document.getElementById("result" + i);

			if ( !result.hasChildNodes()) {
				$(result).append(img);

				for(var j = 0; j < verificationArray.length; j ++) {
					var tempLoc = verificationArray[j];
					if ( (tempLoc == answerLoc) ) {
						tempArray = verificationArray.splice(j, 1); 						
					}   
				}
				painting = 0;
				break;
			}
		}
		
	});

	//정답 검증 버튼
	$("#okBtn").on("click", function() {
		//정답시
		if ( verificationArray.length == 0 ) {
			window.open("/5bject/game/game_correctPop.do", "pop", "width=400, height=150, top=50, left=150");
		//오답시   
		} else {
			window.open("/5bject/game/game_incorrectPop.do", "pop", "width=400, height=150, top=50, left=150");
		}
	});

	//지우기버튼
	$("#resetBtn").on("click", function() {
		for ( var i = 1; i <= step; i++ ) {
			$("#result" + i).empty();
		}
		answerLoc = startLoc; 
		for( var i = 0; i < paintLocArray.length; i++ ){
			verificationArray[i] = paintLocArray[i];
		}
	});


	/* 메인페이지 클릭이벤트 등록 */
	$("#link2").on("click", function() {
		window.open("/5bject/game/select_game.do", "ok", "width=880,height=310,top=300,left=300,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	$("#register_link").on("click", function() {
		window.open("/5bject/member/register.do" ,"ok", "width=500, height=700,toolbar=0,location=0,status=0,menubar=0,resizable=0");
	});

	$("#update_link").on("click",function(){
		window.open("/5bject/member/update.do", "ok", "width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	// language_link ADD. 20151116. CHJ
	$("#language_link").on("click", function() {
		window.open("/5bject/language/computer_language.do","ok","width=1100, height=850,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");	
	});
	// mypage_link, logout_link ADD. 20151116. KKH
	$("#mypage_link").on("click", function() {
		window.open("/5bject/member/mypage.do", "ok", "width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
	});

	$("#logout_link").on("click", function() {
		if ( confirm("로그아웃하시겠습니까?") ) {
			location.replace("/5bject/member/logout.do");
		} 			
	});

	$("#memberList").on("click", function(){
		window.open("/5bject/member/memberList.do?pageNo=${param.pageNo}");
	});

	// 20151120. ADD KKH - 포인터 발생
	$(".findInfo").css("cursor", "pointer").css("text-decoration", "none !important");

	/* chj 20151120 link ADD*/
	$("#request_list").on("click", function() {
		window.open("/5bject/member/request_list.do?pageNo=${param.pageNo}", "ok", "width=1000, height=700");
	});
});