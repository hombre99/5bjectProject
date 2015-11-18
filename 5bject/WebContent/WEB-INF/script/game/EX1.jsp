<%@ page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SELECT GAME</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var mouseoverFlag1 = false;
				var mouseoverFlag2 = false;
				var mouseoverFlag3 = false;

				var game1 = $("span#game1");
				var game2 = $("span#game2");
				var game3 = $("span#game3");

				var gameImg1 = document.createElement("img");
				
				gameImg1.setAttribute("src", "/5bject/image/game/game1.jpg");

				game1.append(gameImg1);
				
				var gameImg3 = document.createElement("img");
				
				gameImg3.setAttribute("src", "/5bject/image/game/game3.jpg");

				game3.append(gameImg3);
				
				game2.hover(gamePlate2_mouseover, gamePlate2_mouseout);
				gamePlate2_mouseout();

				/* TODO
				game1.hover(gamePlate1_mouseover, gamePlate1_mouseout);
				game2.hover(gamePlate2_mouseover, gamePlate2_mouseout);
				game3.hover(gamePlate3_mouseover, gamePlate3_mouseout);

				gamePlate1_mouseout();
				gamePlate2_mouseout();
				gamePlate3_mouseout();
				*/
				
				function gamePlate1_mouseout() {
					if ( !mouseoverFlag1 ) {
						game1.empty();

						var gameSpan1 = document.createElement("span");

						gameSpan1.setAttribute("id", "gameSpan1");

						game1.append(gameSpan1);

						gameSpan1 = $("span#gameSpan1");

						var gameImg1 = document.createElement("img");

						gameImg1.setAttribute("src", "/5bject/image/game/game1.jpg");

						gameSpan1.append(gameImg1);
					
						game1.append(gameImg1);
						mouseoverFlag1 = true;
					}
				}
				
				function gamePlate1_mouseover() {
					if ( mouseoverFlag1 ) {
						game1.empty();

						for ( var i = 1; i < 4; i++ ) {
							var span = document.createElement("span");
							span.setAttribute("id", "game1-" + i);
							span.setAttribute("class", "spanTr" + i);
							game1.append(span);
						}
	
						var childSpan = $("span#game1>span");
						childSpan.appendTo(game1);
	
						for ( var i = 0; i < 3; i++ ) {
							var aLink = document.createElement("a");
							aLink.setAttribute("onclick", "window.open('/5bject/game/game2.do?difficulty="+(i+2)+"'); window.close();");
	
							var gameImg = document.createElement("img");
							gameImg.setAttribute("src", "/5bject/image/game/game1-" + (i + 1) + ".jpg");
							
							$(aLink).append(gameImg);
							childSpan.eq(i).append(aLink)
						}
						mouseoverFlag1 = false;
					}
				}
				function gamePlate2_mouseout() {
					if ( !mouseoverFlag2 ) {
						game2.empty();

						var gameSpan2 = document.createElement("span");

						gameSpan2.setAttribute("id", "gameSpan2");

						game2.append(gameSpan2);

						gameSpan2 = $("span#gameSpan2");

						var gameImg2 = document.createElement("img");

						gameImg2.setAttribute("src", "/5bject/image/game/game2.jpg");

						gameSpan2.append(gameImg2);
					
						game2.append(gameImg2);
						mouseoverFlag2 = true;
					}
				}
				
				function gamePlate2_mouseover() {
					if ( mouseoverFlag2 ) {
						game2.empty();

						for ( var i = 1; i < 4; i++ ) {
							var span = document.createElement("span");
							span.setAttribute("id", "game2-" + i);
							span.setAttribute("class", "spanTr" + i);
							game2.append(span);
						}
	
						var childSpan = $("span#game2>span");
						childSpan.appendTo(game2);
	
						for ( var i = 0; i < 3; i++ ) {
							var aLink = document.createElement("a");
							// aLink.setAttribute("onclick", "window.open('/5bject/game/game2.do?difficulty="+(i+2)+"'); window.close();");
							aLink.setAttribute("onclick", "opener.location.replace('/5bject/game/game2.do?difficulty="+(i+2)+"'); window.close();");
							// aLink.setAttribute("onclick", startGamePage(i+2));
	
							/*
							var test = opener.document.getElementById("main_pannel");
							$(test).html = "<table><tr><td>asdf</td></tr></table>";
							*/
	
							var gameImg = document.createElement("img");
							gameImg.setAttribute("src", "/5bject/image/game/game2-" + (i + 1) + ".jpg");
							
							/*
							$(gameImg).on("click", function() {
								//opener.location.replace("/5bject/game/game2.do?difficulty=" + (i + 2));
								// aLink.setAttribute("onclick", "opener.replace('/5bject/game/game2.do?difficulty="+(i+2)+"'); window.close();");
								opener.location.replace();
							});
							*/

							$(aLink).append(gameImg);
							childSpan.eq(i).append(aLink)
						}
						mouseoverFlag2 = false;
					}
				}
				function gamePlate3_mouseout() {
					if ( !mouseoverFlag3 ) {
						game3.empty();

						var gameSpan3 = document.createElement("span");

						gameSpan3.setAttribute("id", "gameSpan3");

						game3.append(gameSpan3);

						gameSpan3 = $("span#gameSpan3");

						var gameImg3 = document.createElement("img");

						gameImg3.setAttribute("src", "/5bject/image/game/game3.jpg");

						gameSpan3.append(gameImg3);
					
						game3.append(gameImg3);
						mouseoverFlag3 = true;
					}
				}
				
				function gamePlate3_mouseover() {
					if ( mouseoverFlag3 ) {
						game3.empty();

						for ( var i = 1; i < 4; i++ ) {
							var span = document.createElement("span");
							span.setAttribute("id", "game3-" + i);
							span.setAttribute("class", "spanTr" + i);
							game3.append(span);
						}
	
						var childSpan = $("span#game3>span");
						childSpan.appendTo(game3);
	
						for ( var i = 0; i < 3; i++ ) {
							var aLink = document.createElement("a");
							aLink.setAttribute("onclick", "window.open('/5bject/game/game2.do?difficulty="+(i+2)+"'); window.close();");
	
							var gameImg = document.createElement("img");
							gameImg.setAttribute("src", "/5bject/image/game/game3-" + (i + 1) + ".jpg");
							
							$(aLink).append(gameImg);
							childSpan.eq(i).append(aLink)
						}
						mouseoverFlag3 = false;
					}
				}
				
				/*
				function startGamePage(difficulty) {
					opener.location.replace("/5bject/game/game2.do?difficulty=" + difficulty);
					// window.close();
				}
				*/
			});
		</script>
		<style type="text/css">
			.spanTr1 {
				position: absolute;
			}

			.spanTr2 {
				position: absolute;
				top: 104px;
			}

			.spanTr3 {
				position: relative;
			}
		</style>
	</head>
	<body>
		<div>
			<span id="game1"></span>
			<span id="game2"></span>
			<span id="game3"></span>
		</div>
	</body>
</html>