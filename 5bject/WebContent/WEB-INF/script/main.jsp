<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<c:choose>
			<c:when test="${ sessionScope.gameNum != null && sessionScope.difficulty != null }">
				<script type="text/javascript">
					var loginId = '${ sessionScope.member.id }';
					var gameNum = '${ sessionScope.gameNum }';
					var difficulty = '${ sessionScope.difficulty }';
				</script>
				<c:if test="${ sessionScope.gameNum != null }">
					<script type="text/javascript" src="/5bject/game/game${ sessionScope.gameNum }js.do"></script>
				</c:if>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					$(document).ready(function() {
						$("#loginId").focus();

						$("#link2").on("click", function() {
							window.open("/5bject/game/select_game.do", "ok", "width=880,height=310,top=300,left=300,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
						});

						$("#register_link").on("click", function() {
							window.open("/5bject/member/register.do" ,"ok", "width=500, height=900,toolbar=0,location=0,status=0,menubar=0,resizable=0");
						});

						$("#update_link").on("click",function() {
							window.open("/5bject/member/update.do", "ok", "width=500, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
						});

						$("#language_link").on("click", function() {
							var agent = navigator.userAgent.toLowerCase();

							if (agent.indexOf("chrome") != -1)
								window.open("/5bject/language/computer_language.do","ok","width=1220, height=950,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
							else
								window.open("/5bject/language/computer_language.do","ok","width=1220, height=930,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
						});

						$("#mypage_link").on("click", function() {
							window.open("/5bject/member/mypage.do", "ok", "width=650, height=700,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0");
						});

						$(".findInfo").css("cursor", "pointer").css("text-decoration", "none !important");

						$("#logout_link").on("click", function() {
							if ( confirm("로그아웃하시겠습니까?") ) {
								location.replace("/5bject/member/logout.do");
							}
						});

						$("#memberList").on("click", function() {
							window.open("/5bject/member/memberList.do?pageNo=${param.pageNo}","ok","width=900, height=700");
						});

						$("#request_list").on("click", function() {
							window.open("/5bject/member/request_list.do?pageNo=${param.pageNo}", "ok", "width=1000, height=700");
						});

						$("#gameInfo").on("click", function() {
							window.open("/5bject/game/findAllWord.do?pageNo=${param.pageNo}", "ok", "width=900, height=700");
						})

						if ( !'${ sessionScope.member.id }' )
							$("#login").on("click", login);

						$("input#loginPassword").on("keypress", function() {
							if ( event.keyCode == 13 ) {
								login();
							}
						});
					});
				</script>
			</c:otherwise>
		</c:choose>
		<c:if test="${ sessionScope.id == null }">
			<script type="text/javascript">

				function findId() {
					window.open("/5bject/member/findId.do", "ok", "width=650, height=300");
				};

				function findPwd() {
					window.open("/5bject/member/findPwd.do", "ok", "width=650, height=300");
				};

				function login() {
					$.ajax({
						"url" : "/5bject/member/login.do",
						"data" : {"id":$("input#loginId").val(), "password":$("input#loginPassword").val()},
						"type" : "POST",
						// "dataType" : "json",
						"success" : function(success_url) {
							location.replace(success_url);
						},
						"error" : function(request, status, error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							location.reload();
						}
					});
				};
			</script>
		</c:if>
		<!-- 여기서부터 손대지 마세여... -->
		<link
			href="/5bject/stylesheet/core1.css"
			media="screen" rel="stylesheet" type="text/css" />
		<link
			href="/5bject/stylesheet/show1.css"
			media="screen" rel="stylesheet" type="text/css" />
 		<link
			href="/5bject/stylesheet/bundle1.css"
			media="screen" rel="stylesheet" type="text/css" />

		<!-- 여기까지 손대지 마세여... -->
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/header_footer.css" />
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/main.css" />
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp" />
		</header>

		<board>
			<jsp:include page="/WEB-INF/script/layout/board.jsp" />
		</board>

		<div class="content">
			<c:choose>
				<c:when test="${ (sessionScope.gameNum != null && sessionScope.difficulty != null) }">
					<c:choose>
						<c:when test="${sessionScope.gameNum == 1}">
							<div class="color-scheme--white learn-more grid-row margin-top--3">
								<div class="background1">
									<div class="typingHeader"><img src="/5bject/image/game/game1/algo1.jpg"/><br></div>
									<div id="gamePannel1"></div>
									 <div id="answerPannel1">
 										<div id="question"></div>
										<div id="selectPannel"></div>
										<div id="btnPannel"> 
											<input type="button" value="제출" id="okBtn" />
											<input type="button" value="초기화" id="resetBtn" />
										</div>
									</div> 
								</div>
							</div>
						</c:when>
						<c:when test="${sessionScope.gameNum == 2 }">
							<div class="color-scheme--white learn-more grid-row margin-top--3">
								<div class="background2">
									<div class="typingHeader"><img src="/5bject/image/game/game2/algo2.jpg"/><br></div>
									<div id="gamePannel"></div>
									 <div id="answerPannel">
 										<div id="question"></div>
										<div id="selectPannel"></div>
										<div id="btnPannel"> 
											<input type="button" value="제출" id="okBtn" />
											<input type="button" value="초기화" id="resetBtn" />
										</div>
									</div> 
								</div>
							</div>
						</c:when>
						<c:when test="${ sessionScope.gameNum == 3 }">
							<!-- 20151130 game3 -->
 							<div class="color-scheme--white learn-more grid-row margin-top--3">
								<div class="background">	
									<div class="typingHeader">
										<img src="/5bject/image/game/game3/typing.jpg"/><br>
										<img src="/5bject/image/game/game3/game3Info.jpg"/>	
									<br> 
									</div>
									<div class="left" id="display">
										<div id="display2"></div>
									</div>		 						 
									<div class="right">
										<div id="score"></div>
										<div id="input"></div>
									</div>				
								</div>
							</div> 
						</c:when>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="color-scheme--white learn-more" exclude="phone">
						<div class="fit-fixed grid-row margin-top--3 padding-top--3 padding-bottom--3 grid-row-no-collapse">
							<div class="grid-col-4 padding-top--5 grid-col--align-right">
								<h1>
									<font face="impact">How Can coding help you?</font>
								</h1>
								<b>교육용 홈페이지들이 부족하고 <br/>
								학생들에게 흥미있을 만한   <br />
								교육용 웹이 필요합니다. <br/>
								우리나라 초등학교 고학년들의 <br />
								<b>흥미와 사고력</b> 증진을 위해 <br />
								자바를 기반으로 여러<br> 문제를 풀 수 있도록
								준비했습니다.</b>
							</div>
							<div class="grid-col-8 youtube-video">
								<iframe width="600" height="350" src="https://www.youtube.co/embed/9xqQY-pB1dE?" frameborder="20" allowfullscreen></iframe>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<c:remove var="difficulty" scope="session" />
		</div>
		<div class="blank"></div>
		<article id="art" class="fit-full color-scheme--red">
			<article class="fit-fixed">
				<div class="grid-row stories padding-top--3">
					<div class="grid-col-12 grid-col--center grid-col--align-center">
						<font size="6" face="impact" color="skyblue">Enjoy Coding</font>
					</div>
				</div> 
				<div class="grid-row">
					<div id="language_link"
						class="grid-col-4 grid-col--no--padding grid-col--no-margin card card--link ">
						<img src="/5bject/image/member/newlink11.jpg" />
					</div>
					<div id="link2"
						class="grid-col-4 grid-col--no--padding grid-col--no-margin card card--link">
						<img src="/5bject/image/member/newlink22.jpg" />
					</div>
					<!-- login -->
					<div class="login">         
						<c:choose>         
							<c:when test="${ sessionScope.member.id == 'objectclass' }">
								<p><p/>
								<table>
									<tr><td colspan="2"><b>objectclass</b>님<br/></td></tr>
									<tr><td colspan="2"><img src="/5bject/image/member/manager.jpg" /><p></td></tr>
									<tr><td colspan="2"><input type="button" id="memberList" value="회원정보" /><input type="button" id="gameInfo" value="게임정보" /><input type="button" value="로그아웃" id="logout_link" /></td></tr>
								</table>
							</c:when>
							<c:when test="${ sessionScope.id != null }">
								<p></p>
								<font face="impact">${ sessionScope.id }님</font><br />
								<img src="/5bject/image/member/success_login.jpg" />
								<input type="button" id="mypage_link" value="마이페이지" />&nbsp;
								<input type="button" id="logout_link" value="로그아웃" />
							</c:when>
							<c:otherwise>
								<!-- 로그인 로직 AJAX로 변경 -->
								<table>
									<p></p>
									<tr><td colspan="2" align="center"><img src="/5bject/image/member/login.jpg" /></td></tr> 
									<tr><td>&nbsp;아이디</td><td>&nbsp;<input type="text" name="id" id="loginId" placeholder="아이디 입력" /></td></tr> 
									<tr><td>&nbsp;비밀번호</td><td>&nbsp;<input type="password" name="password" id="loginPassword" placeholder="비밀번호 입력" /></td></tr>
									<tr><td colspan="3"><span class="error"><b>${sessionScope.error}</b></span></td></tr>
									<tr><td>&nbsp;&nbsp;<img src="/5bject/image/member/login_button.jpg" id="login"/></td><td>&nbsp;&nbsp;<img src="/5bject/image/member/register_form.jpg" id="register_link" /></td></tr>
								</table>

								<!-- 아이디/비밀번호 찾기 추가 -->
								<table>
									<tr><td colspan="3" align="center">&nbsp;&nbsp;<a href ="javascript:findId()" class="findInfo">아이디</a>/<a href="javascript:findPwd()" class="findInfo">비밀번호 찾기</a></td></tr>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="grid-row stories padding-top--3">
					<div class="grid-col-12 grid-col--center grid-col--align-center">
						<font face="impact" size="6" color="lightslategray">Develop Children's ability to think</font>
					</div>
				</div>
			</article>
		</article>

		<footer>
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>

	</body>
</html>