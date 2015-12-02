$(document).ready(function() {
	var verificationXLoc;
	var verificationYLoc;
	var step;
	var fishXLoc ;
	var fishYLoc ;
	var catXLoc ;
	var catYLoc ;
	var answerXLoc = 0;
	var answerYLoc = 0;
	var gameImgPath = "/5bject/image/game/game2";

	//난이도에 따라 테이블을 자동생성하는 function
	var gameTable = document.createElement("table");
	$("div#gamePannel").append(gameTable);
	$(gameTable).css({
		"margin-left": "auto",
		"margin-right": "auto"
	});
	
	for ( var j = 1; j <= difficulty; j++ ) {         
		tr = document.createElement("tr");
		$(gameTable).append(tr);  
		
		for ( var i = 1; i <= difficulty; i++ ) {
			td = document.createElement("td");
			if ( difficulty == 4 )
				td.setAttribute("id", "td" + difficulty + j + i);
			else
				td.setAttribute("id", "td" + difficulty);
	
			$(td).css({"border" : "1px solid black",
						"padding" : "0px",
						"height" : "100px",
						"width" : "150px",
						"position" : "relative",
						"text-align" : "center"});
			$(tr).append(td);
		}
	}

	//난이도 상에서 랜덤으로 고양이와 생선이미지 배치해주는 로직
	var locCheck = true;

	while ( locCheck ) {
		fishXLoc = Math.floor(Math.random() * 4) + 1;
		fishYLoc = Math.floor(Math.random() * 4) + 1;
		catXLoc = Math.floor(Math.random() * 4) + 1;
		catYLoc = Math.floor(Math.random() * 4) + 1;

		var max = Math.max((fishXLoc + fishYLoc), (catXLoc + catYLoc));
		var min = Math.min((fishXLoc + fishYLoc), (catXLoc + catYLoc));

		step = max - min;

		if( ( 3 < step ) && ( step < 7 ) && !(fishXLoc == catXLoc) ) {
			var fishImg = document.createElement("img");
			fishImg.setAttribute("src", gameImgPath + "/fish.jpg");
			fishImg.setAttribute("width", "150px");
			fishImg.setAttribute("height", "100px");
			var id1 = "td4" + fishXLoc + fishYLoc;
			$("#" + id1).append(fishImg);

			var catImg = document.createElement("img");
			catImg.setAttribute("src", gameImgPath + "/angrycat.jpg");
			catImg.setAttribute("width", "150px");
			catImg.setAttribute("height", "100px");
			var id2 = "td4" + catXLoc + catYLoc;
			$("#" + id2).append(catImg);
			locCheck = false;
		}
	} 

	// 공용 이미지
	// 고양이
	var catImg = document.createElement("img");
	catImg.setAttribute("src", gameImgPath + "/angrycat.jpg");
	catImg.setAttribute("width", "150px");
	catImg.setAttribute("height", "100px"); 

	// 생선
	var fishImg = document.createElement("img");
	fishImg.setAttribute("src", gameImgPath + "/fish.jpg");
	fishImg.setAttribute("width", "150px");
	fishImg.setAttribute("height", "100px");

	// 난이도 하 : 정답은 2번으로 고정.
	if ( difficulty == 2 ) {
		for ( var i = 1; i < 5; i++ ) {
			var label = document.createElement("label");
			
			var input = document.createElement("input");
			input.setAttribute("type", "radio");
			input.setAttribute("name", "answer");
			input.setAttribute("value", i == 2 ? "1" : "2");
			
			$(label).append(input);
			
			var img = document.createElement("img");
			img.setAttribute("src", gameImgPath + "/easy/easy" + i + ".jpg");
			img.setAttribute("width", "200px");
			img.setAttribute("height", "100px");
			
			$(label).append(img);
			$("#selectPannel").append(label);
			
			if ( i == 2 )
				$("#selectPannel").append(document.createElement("br"));
		}

		$("td:eq(0)").append(catImg); 
		$("td:eq(3)").append(fishImg); 
         			
	// 난이도 중
	} else if ( difficulty == 3 ) {
		/*var table = document.createElement("table");*/
		for ( var i = 1; i < 5; i++ ) {
			var label = document.createElement("label");
		/*	var tr = document.createElement("tr");*/
			var input = document.createElement("input");
			input.setAttribute("type", "radio");
			input.setAttribute("name", "answer");
			input.setAttribute("value", i == 3 ? "1" : "2");			
			$(label).append(input);
			
			var img = document.createElement("img");
			img.setAttribute("src", gameImgPath + "/normal/normal" + i + ".jpg");
			img.setAttribute("width", "200px");
			img.setAttribute("height", "100px");
			$(label).append(img);
			$("#selectPannel").append(label);
			
			if ( i == 2 )
				$("#selectPannel").append(document.createElement("br"));
		}
	
		$("td:eq(2)").append(catImg); 
		$("td:eq(3)").append(fishImg); 

	// 난이도 상
	} else if ( difficulty == 4 ) {
		var table = document.createElement("table");
		$("#selectPannel").append(table);
		var tr = document.createElement("tr");
		$(table).append(tr);   
		for ( var i = 1; i < 5; i++ ) {
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
	if ( difficulty == 4 ) {
		$("#question").html("<h4><b>고양이가 생선을 먹고 싶어해요!!<br />다음 중 고양이가 생선까지 "
		+ step + "번 만에<br />갈 수 있는 알고리즘은 무엇일까요?</b></h4>");
	} else {
		$("#question").html("<h4><b>고양이가 생선을 먹고 싶어해요!!<br />다음 중 고양이가 생선까지 갈 수 있는<br />알고리즘은 무엇일까요?</b></h4>");
	}

	//정답 체크 버튼 function
	if ( difficulty == 4 ) {
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
		});

		//정답 검증 로직
		$("#okBtn").on("click", function() {
			verificationXLoc = fishXLoc - catXLoc;
			verificationYLoc = fishYLoc - catYLoc;

			//정답시
			if ( (verificationXLoc == answerXLoc) && (verificationYLoc == answerYLoc) ) {
				window.open("/5bject/game/game_correctPop.do", "pop", "width=400, height=150, top=50, left=150");
				var catImg = document.createElement("img");
				catImg.setAttribute("src", gameImgPath + "/smilecat.jpg");
				catImg.setAttribute("width", "150px");
				catImg.setAttribute("height", "100px");
				var fishLoc = "td4" + fishXLoc + fishYLoc;
				var catLoc = "td4" + catXLoc + catYLoc;
				$("#" + catLoc).empty();
				$("#" + fishLoc).empty();
				$("#" + fishLoc).append(catImg);

			//오답시	
			} else {
				window.open("/5bject/game/game_incorrectPop.do", "pop", "width=400, height=150, top=50, left=150");
				var catImg = document.createElement("img");
				catImg.setAttribute("src", gameImgPath + "/cryingcat.jpg");
				catImg.setAttribute("width", "150px");
				catImg.setAttribute("height", "100px");

				var fishLoc = "td4" + fishXLoc + fishYLoc;
				var catLoc = "td4" + catXLoc + catYLoc;
				$("#" + catLoc).empty(); 
				$("#" + fishLoc).empty();
				answerXLoc = answerXLoc + catXLoc;
				answerYLoc = answerYLoc + catYLoc;

				if ( 4 < answerXLoc )		answerXLoc = 4;
				else if( 4 < answerYLoc )	answerYLoc = 4;
				else if( answerXLoc < 1 )	answerXLoc = 1;
				else if( answerYLoc < 1 )	answerYLoc = 1;
				

				var id = "td4" + answerXLoc + answerYLoc;
				$("#" + id).append(catImg);
				alert("고양이가 더이상 갈 수 없어요.");
			}
		});

		//지우기버튼
		$("#resetBtn").on("click", function() {
			for ( var i = 1; i <= step; i++ ) {
				$("#result" + i).empty();
				for ( var j = 1; j < 5; j++ ) {
        			var id1 = "td4" + i + j;
        			$("#" + id1).empty();
				}
			}

			answerXLoc = 0;
			answerYLoc = 0;
			var fishImg = document.createElement("img");
			fishImg.setAttribute("src", gameImgPath + "/fish.jpg");
			fishImg.setAttribute("width", "150px");
			fishImg.setAttribute("height", "100px");
			var id1 = "td4" + fishXLoc + fishYLoc;
			$("#" + id1).append(fishImg);
			var catImg = document.createElement("img");
			catImg.setAttribute("src", gameImgPath + "/angrycat.jpg");
			catImg.setAttribute("width", "150px");
			catImg.setAttribute("height", "100px");
			var id2 = "td4" + catXLoc + catYLoc;
	    	$("#" + id2).append(catImg); 
		});
	} else {
		$("#okBtn").on("click", function() {
			var answer = $("input[name='answer']:checked").val();
			//정답시
			if ( answer == 1 ) {
				//alert("정답");   
				window.open("/5bject/game/game_correctPop.do", "pop", "width=450, height=200, top=50, left=150");
				var catImg = document.createElement("img");
         		catImg.setAttribute("src", gameImgPath + "/smilecat.jpg");
         		catImg.setAttribute("width", "150px");
         		catImg.setAttribute("height", "100px");
         		$("td").empty();
         		$("td:eq(3)").append(catImg); 
        	//오답시
			} else if ( answer == 2 ) {
				window.open("/5bject/game/game_incorrectPop.do", "pop", "width=450, height=200, top=50, left=150"); 
				// window.open("팝업창 웹페이지","윈도우명","width=350,height=400,top=50,left=150");
				var catImg = document.createElement("img");
        		catImg.setAttribute("src", gameImgPath + "/cryingcat.jpg");
        		catImg.setAttribute("width", "150px");
        		catImg.setAttribute("height", "100px");
        		$("td").empty();
        		// 고양이 이동 필요없어보여서 이미지만 변경.
        		$("td:eq(0)").append(catImg); 
        	} else {
        		alert("답을 선택해주세요");
        	}								
      	});
		
		$("#resetBtn").on("click", function() {
			location.reload();
		});
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