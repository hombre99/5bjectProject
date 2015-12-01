<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FIND_GAMEWORD</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			var id = '${ sessionScope.member.id }';
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				if ( id != "objectclass" ) {
					alert("관리자 페이지입니다.");
					history.go(-1);
				}

				$("#close").on("click", function() {
					window.close();
				});
			});
		</script>		
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/menu.css" />
	</head>
	<body>
	<c:if test="${ sessionScope.member.id == 'objectclass' }">
		<menu>
			<jsp:include page="/WEB-INF/script/layout/game_menu.jsp" />
		</menu>
		
		<table style="width: 800px" border="1">
			<tr>
				<td colspan="3" align="center">
					<h2><font face="HY견고딕" color="lightblue">게임 단어 조회</font></h2>
				</td>
			</tr>
			<tr>
				<th style="width:200px">게임종류</th>
				<th style="width:100px">난이도</th>
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
							<td align="center">
								<c:choose>
									<c:when test="${ gameWord.gameNum == 3 }"> 타자연습게임 </c:when>
								</c:choose>
							</td>
							<td align="center">
								<c:choose>
									<c:when test="${ gameWord.difficulty == 2 }"> 하 </c:when>
									<c:when test="${ gameWord.difficulty == 3 }"> 중 </c:when>
									<c:when test="${ gameWord.difficulty == 4 }"> 상 </c:when>
								</c:choose>
							</td>
							<td style="padding-left:5px"> ${ gameWord.word } </td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3" align="center">
							<c:if test="${ requestScope.pagingBean.previousPageGroup }">
								<a href="/5bject/game/${ requestScope.controllerName }.do?pageNo=${ requestScope.pagingBean.startPageOfPageGroup - 1 }">
									◀
								</a>
							</c:if>
							<c:forEach begin="${ requestScope.pagingBean.startPageOfPageGroup }"
								end="${ requestScope.pagingBean.endPageOfPageGroup }" var="page">
								<c:choose>
									<c:when test="${ page == requestScope.pagingBean.currentPage }">
										<b>&nbsp;${ page }&nbsp;</b>
									</c:when>
									<c:otherwise>
										<a href="/5bject/game/${ requestScope.controllerName }.do?pageNo=${ page }&word=${ requestScope.list[0].word }">
											&nbsp;${ page }&nbsp;
										</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${ requestScope.pagingBean.nextPageGroup }">
								<a href="/5bject/game/${ requestScope.controllerName }.do?pageNo=${ requestScope.pagingBean.endPageOfPageGroup + 1 }">
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
		<table style="width: 800px" border="0">
			<tr>
				<td align="right">
					<input type="button" value="닫기" id="close">
				</td>
			</tr>
		</table>
		</c:if>
	</body>
</html>