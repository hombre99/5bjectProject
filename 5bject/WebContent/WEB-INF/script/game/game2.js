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

	//���대���� �곕�� ���대��� �������깊���� function
	var gameTable = document.createElement("table");
	$("div#gamePannel").append(gameTable);
	
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

	//���대�� ������ ���ㅼ�쇰� 怨����댁�� �����대�몄� 諛곗��댁＜�� 濡�吏�
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
	catImg.setAttribute("width", "200px");
	catImg.setAttribute("height", "100px"); 

	// 생선
	var fishImg = document.createElement("img");
	fishImg.setAttribute("src", gameImgPath + "/fish.jpg");
	fishImg.setAttribute("width", "150px");
	fishImg.setAttribute("height", "100px");

	// ���대�� �� : ���듭�� 2踰��쇰� 怨���.
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

		/*
		var label = document.createElement("label");
		
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		// $("#selectPannel").append(input);
		
		$(label).append(input);
		$("#selectPannel").append(label);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy1.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		// $("#selectPannel").append(img);

		$(label).append(img);

		label = document.createElement("label");
		
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "1");
		// $("#selectPannel").append(input);
		
		$(label).append(input);
		$("#selectPannel").append(label);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy2.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		// $("#selectPannel").append(img);
		$(label).append(img);
		$("#selectPannel").append(document.createElement("br"));

		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#selectPannel").append(input);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy3.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		$("#selectPannel").append(img);

		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#selectPannel").append(input);

		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/easy/easy4.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		$("#selectPannel").append(img);
		*/
         			
		// 怨�����
		var catImg = document.createElement("img");
		catImg.setAttribute("src", "/5bject/image/game/game2/angrycat.jpg");
		catImg.setAttribute("width", "200px");
		catImg.setAttribute("height", "100px"); 
		$("td:eq(0)").append(catImg); 

		// ����
		var fishImg = document.createElement("img");
		fishImg.setAttribute("src", "/5bject/image/game/game2/fish.jpg");
		fishImg.setAttribute("width", "150px");
		fishImg.setAttribute("height", "100px");
		$("td:eq(3)").append(fishImg); 
         			
	// ���대�� 以�
	} else if ( difficulty == 3 ) {
		for ( var i = 1; i < 5; i++ ) {
			var label = document.createElement("label");
			
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

<<<<<<< HEAD
		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal1.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		$("#selectPannel").append(img);
         			
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#selectPannel").append(input);
         			
		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal2.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		$("#selectPannel").append(img);
		$("#selectPannel").append(document.createElement("br"));
         			
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "1");
		$("#selectPannel").append(input);
         			
		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal3.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		$("#selectPannel").append(img);
         			
		var input = document.createElement("input");
		input.setAttribute("type", "radio");
		input.setAttribute("name", "answer");
		input.setAttribute("value", "2");
		$("#selectPannel").append(input);
         			
		var img = document.createElement("img");
		img.setAttribute("src", "/5bject/image/game/game2/normal/normal4.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "100px");
		$("#selectPannel").append(img);
         			
		// 怨�����
		var catImg = document.createElement("img");
		catImg.setAttribute("src", "/5bject/image/game/game2/angrycat.jpg");
		catImg.setAttribute("width", "200px");
		catImg.setAttribute("height", "100px"); 
=======
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
		$("td:eq(2)").append(catImg); 
<<<<<<< HEAD
         			
		// ����
		var fishImg = document.createElement("img");
		fishImg.setAttribute("src", "/5bject/image/game/game2/fish.jpg");
		fishImg.setAttribute("width", "150px");
		fishImg.setAttribute("height", "100px");
=======
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
		$("td:eq(3)").append(fishImg); 

	// ���대�� ��
	} else if ( difficulty == 4 ) {
		var table = document.createElement("table");
		$("#selectPannel").append(table);
		var tr = document.createElement("tr");
		$(table).append(tr);   
		for ( var i = 1; i < 5; i++ ) {
			td = document.createElement("td");
			td.setAttribute("id", "select" + i); //�� ����td�� id 遺���
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
			td.setAttribute("id", "result" + i); //�� ����寃곌낵td�� id 遺���
			$(td).css({"border" : "1px solid black",
						"padding" : "0px",
						"height" : "100px",
						"width" : "100px",
						"position" : "relative",
						"text-align" : "center"});
			$(tr).append(td);    						
		}
	}

	//臾몄�� 
	if ( difficulty == 4 ) {
<<<<<<< HEAD
		$("#question").html("<h3>怨����닿� ������ 癒밴� �띠�댄�댁��!! <br />�ㅼ�� 以� 怨����닿� ����源�吏� "
		+ step + "踰� 留��� 媛� �� ���� ��怨�由ъ��� 臾댁���쇨���?</h3>");
=======
		$("#question").html("<h3>고양이가 생선을 먹고 싶어해요!!<br />다음 중 고양이가 생선까지 "
		+ step + "번 만에 갈 수 있는 알고리즘은 무엇일까요?</h3>");
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
	} else {
<<<<<<< HEAD
		$("#question").html("<h3>怨����닿� ������ 癒밴� �띠�댄�댁��!! <br />�ㅼ�� 以� 怨����닿� ����源�吏� 媛� �� ���� ��怨�由ъ��� 臾댁���쇨���?</h3>");
=======
		$("#question").html("<h3>고양이가 생선을 먹고 싶어해요!!<br />다음 중 고양이가 생선까지 갈 수 있는<br />알고리즘은 무엇일까요?</h3>");
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
	}

	//���� 泥댄�� 踰��� function
	if ( difficulty == 4 ) {
		$("#select1").on("click", function() {	// �듭���� td id蹂�濡� �대┃�대깽�� 遺���						
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

		$("#select2").on("click", function(){	// �듭���� td id蹂�濡� �대┃�대깽�� 遺���						
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

		$("#select3").on("click", function() {	// �듭���� td id蹂�濡� �대┃�대깽�� 遺���						
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

		$("#select4").on("click", function() {	// �듭���� td id蹂�濡� �대┃�대깽�� 遺���						
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

		//���� 寃�利� 濡�吏�
		$("#okBtn").on("click", function() {
			verificationXLoc = fishXLoc - catXLoc;
			verificationYLoc = fishYLoc - catYLoc;

			//���듭��
			if ( (verificationXLoc == answerXLoc) && (verificationYLoc == answerYLoc) ) {
				window.open("/5bject/game/game2_correctPop.do", "pop", "width=400, height=150, top=50, left=150");
				var catImg = document.createElement("img");
				catImg.setAttribute("src", gameImgPath + "/smilecat.jpg");
				catImg.setAttribute("width", "150px");
				catImg.setAttribute("height", "100px");
				var fishLoc = "td4" + fishXLoc + fishYLoc;
				var catLoc = "td4" + catXLoc + catYLoc;
				$("#" + catLoc).empty();
				$("#" + fishLoc).empty();
				$("#" + fishLoc).append(catImg);

			//�ㅻ�듭��	
			} else {
				window.open("/5bject/game/game2_incorrectPop.do", "pop", "width=400, height=150, top=50, left=150");
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
				alert("怨����닿� ���댁�� 媛� �� ���댁��.");
			}
		});

		//吏��곌린踰���
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
			//���듭��
			if ( answer == 1 ) {
<<<<<<< HEAD
				//alert("����");   
				window.open("/game/game2_correctPop.do", "pop", "width=400, height=150, top=50, left=150");
=======
				//alert("정답");   
				window.open("/5bject/game/game2_correctPop.do", "pop", "width=400, height=150, top=50, left=150");
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
				var catImg = document.createElement("img");
         		catImg.setAttribute("src", gameImgPath + "/smilecat.jpg");
         		catImg.setAttribute("width", "150px");
         		catImg.setAttribute("height", "100px");
         		$("td").empty();
         		$("td:eq(3)").append(catImg); 
        	//�ㅻ�듭��
			} else if ( answer == 2 ) {
<<<<<<< HEAD
				window.open("/game/game2_incorrectPop.do", "pop", "width=400, height=150, top=50, left=150"); 
				// window.open("����李� �뱁���댁�","�����곕�","width=350,height=400,top=50,left=150");
=======
				window.open("/5bject/game/game2_incorrectPop.do", "pop", "width=400, height=150, top=50, left=150"); 
				// window.open("팝업창 웹페이지","윈도우명","width=350,height=400,top=50,left=150");
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
				var catImg = document.createElement("img");
        		catImg.setAttribute("src", gameImgPath + "/cryingcat.jpg");
        		catImg.setAttribute("width", "150px");
        		catImg.setAttribute("height", "100px");
        		$("td").empty();
        		// 怨����� �대�� �������대낫�ъ�� �대�몄�留� 蹂�寃�.
        		$("td:eq(0)").append(catImg); 
        	} else {
        		alert("�듭�� �����댁＜�몄��");
        	}								
      	});
		
		$("#resetBtn").on("click", function() {
			location.reload();
		});
	}
	
	/* 硫��명���댁� �대┃�대깽�� �깅� */
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
		if ( confirm("濡�洹몄��������寃��듬��源�?") ) {
			location.replace("/5bject/member/logout.do");
		} 
	});
	
<<<<<<< HEAD
	$("#memberList").on("click", function(){
		window.open('/5bject/member/memberList.do');
=======
	$("#memberList").on("click", function() {
		window.open("/5bject/member/memberList.do");
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
	});
});