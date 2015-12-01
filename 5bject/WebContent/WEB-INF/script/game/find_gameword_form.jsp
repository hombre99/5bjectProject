<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FIND_GAMEWORD_FORM</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			var id = '${ sessionScope.member.id }';
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("input#findWord").focus();

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
		
		<form action="/5bject/game/findWord.do">
			<table style="width: 800px" border="1">
				<tr>
					<td align="center">
						<h2><font face="HY견고딕" color="lightblue">등록된 특정단어 찾기</font></h2>
					</td>
				</tr>
				<tr>
					<th> 검색하려는 단어를 정확히 입력해야 합니다. </th>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="pageNo" value="1" />
						<input type="text" id="findWord" name="word" style="width:785px" />
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value="찾기" />
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