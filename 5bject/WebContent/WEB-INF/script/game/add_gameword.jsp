<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ADD_GAMEWORD</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			var id = '${ sessionScope.member.id }';
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("input#addWord").focus();
				
				if ( id != "objectclass" ) {
					alert("관리자 페이지입니다.");
					history.go(-1);
				}

				$("#close").on("click", function() {
					window.close();
				});
			});

			function check() {
				if ( confirm("등록하시겠습니까?") ) {
					return true;
				}

				return false;
			}
		</script>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/menu.css" />
	</head>
	<body>
	<c:if test="${ sessionScope.member.id == 'objectclass' }">
		<menu>
			<jsp:include page="/WEB-INF/script/layout/game_menu.jsp" />
		</menu>

		<form action="/5bject/game/addWord.do" onsubmit="return check();">
			<table style="width:800px" border="1">
				<tr><td colspan="3" align="center"><h2><font face="HY견고딕" color="lightblue">게임 단어 추가</font></h2></td></tr>
				<tr>
					<th style="width:200px">게임번호</th>
					<th style="width:100px">난이도</th>
					<th>단어</th>
				</tr>
				<tr>
					<td>
						<select name="gameNum" style="width:200px">
							<c:forEach begin="3" end="3" var="num">
								<option value="${ num }">
									<c:choose>
										<c:when test="${ num == 3 }"> 타자연습게임 </c:when>
									</c:choose>
								</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select name="difficulty" style="width:100px">
							<c:forEach begin="2" end="4" var="num">
								<option value="${ num }">
									<c:choose>
										<c:when test="${ num == 2 }"> 하 </c:when>
										<c:when test="${ num == 3 }"> 중 </c:when>
										<c:when test="${ num == 4 }"> 상 </c:when>
									</c:choose>
								</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<input type="text" id="addWord" name="word" style="width:474px" />
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="등록" />
						<input type="reset" value="초기화" />
					</td>
				</tr>
			</table>
		</form>
		<table style="width:800px" border="0">
			<tr>
				<td align="right">
					<input type="button" value="닫기" id="close">
				</td>
			</tr>
		</table>
		</c:if>
	</body>
</html>