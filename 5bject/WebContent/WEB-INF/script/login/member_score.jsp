<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게임점수 조회</h2>

	<c:forEach items='${sessionScope.score }' var="list">

		<c:choose>
			<c:when test="${list.gameNum==-1 }">
	 		게임 정보가 없습니다.
	 		</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${list.gameNum!=-1 }">
				<table style="width: 400px" border="1">
					<tr>
						<th>게임</th>
						<th>하</th>
						<th>중</th>
						<th>상</th>
					</tr>

					<tr>
						<c:choose>
							<c:when test="${list.gameNum==3 }">
								<td>게임3</td>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${list.easy==-1 }">
								<td>0점</td>
							</c:when>
							<c:otherwise>
								<td>${list.easy }점</td>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${list.normal==-1 }">
								<td>0점</td>
							</c:when>
							<c:otherwise>
								<td>${list.normal }점</td>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${list.hard==-1 }">
								<td>0점</td>
							</c:when>
							<c:otherwise>
								<td>${list.hard }점</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</c:when>
		</c:choose>
	</c:forEach>



</body>
</html>