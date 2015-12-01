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
			function check() {
				if ( confirm("등록하시겠습니까?") ) {
					return true;
				}

				return false;
			}
			$(document).ready(function() {
				$("input#addWord").focus();
				
				if ( id != "objectclass" ) {
					alert("관리자 페이지입니다.");
					history.go(-1);
				}
			});
		</script>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/menu.css" />
	</head>
	<body>
	<c:if test="${ sessionScope.member.id == 'objectclass' }">
		<menu>
			<jsp:include page="/WEB-INF/script/layout/game_menu.jsp" />
		</menu>

		<form action="/5bject/game/addWord.do" onsubmit="return check();">
			<table style="width:500px"border="1">
				<tr><td colspan="3" align="center"><h2><font face="HY견고딕" color="lightblue">게임 단어 추가</font></h2></td></tr>
				<tr>
					<th>게임번호</th>
					<th>난이도</th>
					<th>단어</th>
				</tr>
				<tr>
					<td>
						<select name="gameNum">
							<c:forEach begin="3" end="3" var="num">
								<option>${ num }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select name="difficulty">
							<c:forEach begin="2" end="4" var="num">
								<option>${ num }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<input type="text" id="addWord" name="word" />
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
		</c:if>
	</body>
</html>