<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#close").on("click", function() {
			window.close();
		});
	});
	function page_back(){
		history.go(-1);
	}
</script>
</head>
<body>
	<h2>게임점수 조회</h2>

	<c:forEach items='${sessionScope.score }' var="list">

		<c:choose>
			<c:when test="${list.gameNum==-1 }">
	 		게임 정보가 없습니다.<br>
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
<input type="button" onclick="page_back();" value="마이페이지">
<input type="button" value="닫기" id="close">
</body>
</html>