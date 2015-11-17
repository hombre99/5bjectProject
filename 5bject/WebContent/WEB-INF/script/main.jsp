<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset=" UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#link2").on("click", function() {
					window.open('/5bject/game/select_game.do','ok','width=880,height=310,top=300,left=300,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
				});
				
				$("#register_link").on("click", function() {
					window.open('/5bject/member/register.do','ok','width=1000, height=1000,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
				});
				
				$("#update_link").on("click",function(){
					window.open('/5bject/member/update.do','ok','width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
				});
				
				// language_link ADD. 20151116. CHJ
				$("#language_link").on("click", function() {
					window.open('/5bject/language/computer_language.do','ok','width=1000, height=800,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');	
				});
				
				$("#language_link").on("click", function() {
					// TODO? CHJ
				});
				
				// mypage_link, logout_link ADD. 20151116. KKH
				$("#mypage_link").on("click", function() {
					window.open('/5bject/member/mypage.do','ok','width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
				});

				$("#logout_link").on("click", function() {
					if ( confirm("로그아웃하시겠습니까?") ) {
						location.replace('/5bject/member/logout.do');
					} 
				});
			});
		</script>

		<!-- 여기서부터 손대지 마세여... -->
		<link href="greybox/gb_styles.css" rel="stylesheet" type="text/css" />
		<link
			href="https://cdn-production.codecademy.com/assets/rebrand/core-51a92b73616bc4ee9446ad082ee0ce7e.css"
			media="screen" rel="stylesheet" type="text/css" />
		<link
			href="https://cdn-production.codecademy.com/ass;[']ets/rebrand/controllers/home/show-17141dd9781a3ee228fefc2b7da9d7d3.css"
			media="screen" rel="stylesheet" type="text/css" />
		<link
			href="https://cdn-production.codecademy.com/assets/webpack/vendor.bundle-59164de1b85d70aee596322a1c89ef69.css"
			media="screen" rel="stylesheet" type="text/css" />

		<script id="CCDATA" type="text/javascript">
			//<![CDATA[
			var CCDATA = CCDATA || {};
			CCDATA['env'] = "production";
			CCDATA['request_host'] = "www.codecademy.com";
			CCDATA['request_path'] = "/";
			CCDATA['asset_host'] = "cdn-production.codecademy.com";
			CCDATA['assets_compiled'] = true;
			CCDATA['pollForNotifications'] = false;
			CCDATA['locale'] = "en";
			CCDATA['API_HOST'] = "/api";
			CCDATA['authenticity_token'] = "6fYL1Pw65Flr6Evs9dYj/v7ySAtMEvAZ/QOShXpeHdQ=";
			CCDATA['available_locales'] = "en|ko|fa|ru|es-AR|ja|fr|et-EE|zh|fr-FR|pt-BR|de|en-GB|ky-KG|es|en-US|pt|ar";
			CCDATA.secureSandboxIndexPath = 'https://cdn-production.codecademy.com/assets/secure/index-c5bf1319f62cb07c26239e761a9ed5c9.html';
			//]]>
		</script>
		<!-- 여기까지 손대지 마세여... -->

		<style type="text/css">
			header{
				background-color: lightblue;
				color: white;
				text-align: left;
				padding: 20px;
			}

			.blank {
				background-color: aliceblue;
				padding: 10px;
			}

			footer {
				background-color: lightblue;
				color: white;
				padding-top: 20px;
				text-align: center;
				height: 100px;
				clear: both;
			}

			.error {
				color: red;
			}
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp" />
		</header>

		<div class="content">
			<c:choose>
				<c:when test="${ sessionScope.difficulty == null || (sessionScope.difficulty < 2 && sessionScope.difficulty > 4) }">
					<div class="color-scheme--white learn-more" exclude="phone">
						<div class="fit-fixed grid-row margin-top--3 padding-top--3 padding-bottom--3 grid-row-no-collapse">
							<div class="grid-col-4 padding-top--5 grid-col--align-right">
								<!-- Intro Image ADD. 20151116. CHJ -->
								<!-- <img src="/5bject/image/member/intro.jpg" /> -->
								<h1>
									<font face="impact">How Can coding help you?</font>
								</h1>
								<!-- <img src="/5bject/image/member/intro.jpg" /> -->
								<b>교육용 홈페이지들이 부족하고 <br>
								학생들에게 흥미있을 만한   <br>
								교육용 웹이 필요합니다. <br>
								우리나라 초등학교 고학년들의 <br>
								<b>흥미와 사고력</b> 증진을 위해 <br>
								자바를 기반으로 여러<br> 문제를 풀 수 있도록
								준비했습니다.</b>
							</div>
							<div class="grid-col-8 youtube-video">
								<iframe width="600" height="330" src="//www.youtube.com/embed/fjQ7XaMNQNc?"
									frameborder="20" allowfullscreen></iframe>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<c:remove var="difficulty" scope="session" />
		</div>

		<div class="blank"></div>

		<!-- <article class="fit-full color-scheme--#e6e6fa"> -->
		<article id="art" class="fit-full color-scheme--red">
			<article class="fit-fixed">
				<div class="grid-row stories padding-top--3">
					<div class="grid-col-12 grid-col--center grid-col--align-center">
						<h2>
							<font face="impact">Enjoy Coding</font>
						</h2>
					</div>
				</div>

				<div class="grid-row">
					<div id="language_link"
						class="grid-col-4   grid-col--no--padding grid-col--no-margin card card--link ">
						<img src="/5bject/image/member/newlink11.jpg" />
					</div>
					<div id="link2"
						class="grid-col-4  grid-col--no--padding grid-col--no-margin card card--link">
						<img src="/5bject/image/member/newlink22.jpg" />
					</div>
					
					<div class="login">			
						<!-- Admin Info ADD. 20151116. KKH -->
						<!-- TODO 관리자 계정명 바뀔 수 있음. -->
						<!-- font face ADD. 20151116. CHJ -->
						<!-- Login Image ADD. 20151116. CHJ -->
						<c:choose>			
							<c:when test="${ sessionScope.member.id == 'objectclass' }">
							<p />
							관리자님<br />
							<input type="button" id="memberList" value="회원정보조회" />
							<input type="button" value="회원삭제" />
							<input type="button" value="회원점수조회" />
							<input type="button" value="로그아웃" id="logout_link" />
							</c:when>
							<c:when test="${ sessionScope.id != null }">
								<p />
								<font face="impact">${ sessionScope.id }</font><br />
								${ sessionScope.id }님<br />
								<input type="button" id="mypage_link" value="마이페이지" />
								<input type="button" id="logout_link" value="로그아웃" />
							</c:when>
							<c:otherwise>
								<form action ="/5bject/member/login.do" method="post">
									<table>
										<tr><td colspan="2" align="center"><img src="/5bject/image/member/login.jpg" /></td></tr> 
										<tr><td><b>아이디</b></td><td><input type="text" name="id" placeholder="아이디 입력" /></td></tr> 
										<tr><td><b>비밀번호</b></td><td><input type="password" name="password" placeholder="비밀번호 입력" /></td></tr>
										<tr><td colspan="2"><span class="error"><b>${sessionScope.error}</b></span></td></tr>
										<tr><td><input type="submit" value="로그인" id="login" /></td><td><input type="button" id="register_link" value="회원가입" /></td></tr>
									</table>
								</form>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="grid-row stories padding-top--3">
					<div class="grid-col-12 grid-col--center grid-col--align-center">
						<h3>
							<font face="impact">Develop Children's ability to think</font>
						</h3>
					</div>
				</div>
			</article>
		</article>

		<footer>
			<table>
				<tr><td align ="center"><h5>© 2015 5bject. All Rights Reserved.</h5></td></tr>
			</table>
		</footer>
	</body>
</html>