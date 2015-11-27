<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FIND_GAMEWORD</title>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/menu.css" />
	</head>
	<body>
		<menu>
			<jsp:include page="/WEB-INF/script/layout/game_menu.jsp" />
		</menu>
		
		<table style="width: 500px" border="1">
			<tr><td colspan="3" align="center"><h2><font face="HY견고딕" color="lightblue">게임 단어 조회</font></h2></td></tr>
			<tr>
				<th>게임번호</th>
				<th> 난이도</th>
				<th> 단어 </th>
			</tr>
			<c:choose>
				<c:when test="${ requestScope.gameWord != null }">
					<tr>
						<td> ${ requestScope.gameWord.gameNum } </td>
						<td> ${ requestScope.gameWord.difficulty } </td>
						<td> ${ requestScope.gameWord.word } </td>
					</tr>
				</c:when>
				<c:when test="${ requestScope.list != null }">
					<c:forEach items="${ requestScope.list }" var="gameWord">
						<tr>
							<td> ${ gameWord.gameNum } </td>
							<td> ${ gameWord.difficulty } </td>
							<td> ${ gameWord.word } </td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3" align="center">
							<c:if test="${ requestScope.pagingBean.previousPageGroup }">
								<a href="/5bject/game/findAllWord.do?pageNo=${ requestScope.pagingBean.startPageOfPageGroup - 1 }">
									◀
								</a>
							</c:if>
							<c:forEach begin="${ requestScope.pagingBean.startPageOfPageGroup }"
								end="${ requestScope.pagingBean.endPageOfPageGroup }" var="page">
								<a href="/5bject/game/findAllWord.do?pageNo=${ page }">
									${ page }
								</a>
							</c:forEach>
							<c:if test="${ requestScope.pagingBean.nextPageGroup }">
								<a href="/5bject/game/findAllWord.do?pageNo=${ requestScope.pagingBean.endPageOfPageGroup + 1 }">
									▶
								</a>
							</c:if>
						</td>
					</tr>
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
	</body>
</html>