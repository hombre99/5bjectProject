<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FIND_GAMEWORD</title>
	</head>
	<body>
		<h2>게임 단어 조회</h2>
		<table>
			<tr>
				<th>게임번호</th>
				<th>난이도</th>
				<th>단어</th>
			</tr>
			<c:choose>
				<c:when test="${ sessionScope.gameWord != null }">
					<tr>
						<td> ${ sessionScope.gameWord.gameNum } </td>
						<td> ${ sessionScope.gameWord.difficulty } </td>
						<td> ${ sessionScope.gameWord.word } </td>
					</tr>
				</c:when>
				<c:when test="${ sessionScope.wordList != null }">
					<c:forEach items="${ sessionScope.wordList }" var="gameWord">
						<tr>
							<td> ${ gameWord.gameNum } </td>
							<td> ${ gameWord.difficulty } </td>
							<td> ${ gameWord.word } </td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:if test="${ sessionScope.errMsg != null }">
						<tr>
							<td colspan="3">
								${ sessionScope.errMsg }
							</td>
						</tr>
					</c:if>
				</c:otherwise>
			</c:choose>
		</table>
		<c:if test="${ sessionScope.gameWord != null }">
			<c:remove var="gameWord" scope="session" />
		</c:if>
		<c:if test="${ sessionScope.wordList != null }">
			<c:remove var="wordList" scope="session" />
		</c:if>
		<c:if test="${ sessionScope.errMsg != null }">
			<c:remove var="errMsg" scope="session" />
		</c:if>
	</body>
</html>