<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ADD_GAMEWORD</title>
		<script type="text/javascript">
			function check() {
				if ( confirm("등록하시겠습니까?") ) {
					return true;
				}

				return false;
			}
		</script>
	</head>
	<body>
		<h2>게임 단어 추가</h2>
		<form action="/5bject/game/addWord.do" onsubmit="return check();">
			<table>
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
						<input type="text" name="word" />
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
	</body>
</html>