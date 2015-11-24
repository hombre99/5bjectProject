<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FIND_GAMEWORD_FORM</title>
	</head>
	<body>
		<h2>등록된 특정단어 찾기</h2>
		<form action="/5bject/game/findWord.do">
			<table>
				<tr>
				<!--
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
				-->
					<td>
						<input type="text" name="word" />
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="찾기" />
						<input type="reset" value="초기화" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>