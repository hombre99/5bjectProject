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
<style type="text/css">
	table{
		margin-top: 20px;
		margin-left: 100px;
	}
	#mypage{
		margin-left: 100px;
	}
</style>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/header_footer.css" />
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header_popup.jsp" />
	</header>
	
	<c:forEach items='${sessionScope.score }' var="list">
		<c:choose>
			<c:when test="${list.gameNum==-1 }">
			<table style="width: 400px" border="1">
				<tr><td colspan="3"><h2>게임점수 조회</h2></td></tr>
				<tr><td colspan="3" align="center">게임 정보가 없습니다.</td></tr>
			</table>
	 		</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${list.gameNum!=-1 }">
				<table style="width: 400px" border="1">
				<tr><td colspan="4" align="center"><h2><font color="lightblue">게임점수 조회</font></h2></td></tr>
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
<input type="button" id ="mypage" onclick="page_back();" value="마이페이지">
<input type="button" value="닫기" id="close">
</body>
</html>