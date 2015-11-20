$(document).ready(function() {
	var verificationArray = new Array();//정답 검증용 배열 
	var step;
	var startXLoc ;
	var startYLoc ;
	var paintXLoc ;
	var paintYLoc ;
	var paintLoc = {paintXLoc : "0", PaintYLoc : "0"};
	var paintLocArray  = new Array(); //좌표 배열
	var answerXLoc = 0;
	var answerYLoc = 0;
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
		startXLoc = Math.floor(Math.random() * difficulty) + 1;
		startYLoc = Math.floor(Math.random() * difficulty) + 1;
	for(var i = 1 ; i < difficulty; i++){
		paintXLoc = Math.floor(Math.random() * difficulty) + 1;
		paintYLoc = Math.floor(Math.random() * difficulty) + 1;
		if((!paintXLoc==startXLoc)||(!paintYLoc==startYLoc)){			
			paintLoc = {paintXLoc : paintXLoc, paintYLoc : paintYLoc};	
			alert(paintLoc.paintXLoc);
			if(paintLocArray.length==0){				
				var tdId = "td" +difficulty+ paintXLoc + paintYLoc;
				$("#" + tdId).attr("bgcolor", "black"); //css적용안됨
				paintLocArray.push(paintLoc);
			}else{
				for(var j = 0; j < paintLocArray.length; j ++){
					var tempXLoc = paintLocArray[j].paintXLoc;
					var tempYLoc = paintLocArray[j].paintYLoc;
					var newPaintXLoc = paintLoc.paintXLoc;
					var newPaintYLoc = paintLoc.paintYLoc;
					if((!tempXLoc==newPaintXLoc)||(!tempYLoc==newPaintYLoc)){
						var tdId = "td" +difficulty+ paintXLoc + paintYLoc;
						$("#" + tdId).attr("bgcolor", "black");
						paintLocArray.push(paintLoc);
						}	
					}
				}		
			}
		}
		verificationArray = paintLocArray;
		step = Math.pow(difficulty,2) - 1;
		var startImg = document.createElement("img");
		startImg.setAttribute("src", gameImgPath + "/start.jpg");
		startImg.setAttribute("width", "150px"); //난이도별 이미지크기 체크 필요할듯?
		startImg.setAttribute("height", "100px");
		var id2 = "td" + difficulty + startXLoc + startYLoc;
		$("#" + id2).append(startImg);
	
	answerXLoc = startXLoc;
	answerYLoc = startYLoc;
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
			if(i==9){
				var tr = document.createElement("tr");				
			}else{
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
		}
		

	//문제 
		$("#question").html("<h3>다음 그림을 완성해 봅시다!!<br />"
		+ step + "번 만에 왼쪽 그림과 같이 색칠할 수 있는 알고리즘을 완성해주세요.</h3>");

	//정답 체크 버튼 function
		$("#select1").on("click", function() {	// 답선택 td id별로 클릭이벤트 부여						
			var img = document.createElement("img");
			img.setAttribute("src", gameImgPath + "/arrow1.jpg");
			img.setAttribute("width", "100px");
			img.setAttribute("height", "100px");
			for ( var i = 1; i <= step; i++ ) {
				var result = document.getElementById("result" + i);
				if ( !result.hasChildNodes() ) {
					$(result).append(img);
					answerXLoc = answerXLoc - 1;
					break;
				}
			}		
			painting = 1;
		});

		$("#select2").on("click", function(){	// 답선택 td id별로 클릭이벤트 부여						
			var img = document.createElement("img");
			img.setAttribute("src", gameImgPath + "/arrow2.jpg");
			img.setAttribute("width", "100px");
			img.setAttribute("height", "100px");
			for ( var i = 1; i <= step; i++ ) {
				var result = document.getElementById("result" + i);
				if ( !result.hasChildNodes() ) {
					$(result).append(img);
					answerXLoc = answerXLoc + 1;
					break;
				}
			}	
			painting = 1;
		});

		$("#select3").on("click", function() {	// 답선택 td id별로 클릭이벤트 부여						
			var img = document.createElement("img");
			img.setAttribute("src", gameImgPath + "/arrow3.jpg");
			img.setAttribute("width", "100px");
			img.setAttribute("height", "100px");
			for ( var i = 1; i <= step; i++ ) {
				var result = document.getElementById("result" + i);
				if ( !result.hasChildNodes() ) {
					$(result).append(img);
					answerYLoc = answerYLoc - 1;
					break;
				}
			}
			painting = 1;
		});

		$("#select4").on("click", function() {	// 답선택 td id별로 클릭이벤트 부여						
			var img = document.createElement("img");
			img.setAttribute("src", gameImgPath + "/arrow4.jpg");
			img.setAttribute("width", "100px");
			img.setAttribute("height", "100px");
			for ( var i = 1; i <= step; i++ ) {
				var result = document.getElementById("result" + i);
				if ( !result.hasChildNodes() ) {
					$(result).append(img);
					answerYLoc = answerYLoc + 1;
					break;
				}
			}
			painting = 1;
		});

		$("#select5").on("click", function() {	// 클릭이벤트 및 정답값 처리					
			if(painting==0){
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
						for(var j = 0; j < verificationArray.length; j ++){
							var tempXLoc = paintLocArray[j].paintXLoc;
							var tempYLoc = paintLocArray[j].paintYLoc;
							if((tempXLoc==answerXLoc)||(tempYLoc==answerYLoc)){
								verificartionArray[j].slice(j,1);
							}	  
						}
					break;
				}
			}
			painting = 0;
		});
		//정답 검증 버튼
		$("#okBtn").on("click", function() {
			//정답시
			if (verificationArray.length==0) {
				window.open("/5bject/game/game2_correctPop.do", "pop", "width=400, height=150, top=50, left=150");
			//오답시	
			} else {
				window.open("/5bject/game/game2_incorrectPop.do", "pop", "width=400, height=150, top=50, left=150");
			}
		});

		//지우기버튼
		$("#resetBtn").on("click", function() {
			for ( var i = 1; i <= step; i++ ) {
				$("#result" + i).empty();
			}
			answerXLoc = startXLoc;
			answerYLoc = startYLoc; 
			verificationArray = paintLocArray;
		});
	
	
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