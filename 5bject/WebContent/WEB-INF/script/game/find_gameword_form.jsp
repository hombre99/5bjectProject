<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FIND_GAMEWORD_FORM</title>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/menu.css" />
	</head>
	<body>
		<menu>
			<jsp:include page="/WEB-INF/script/layout/game_menu.jsp" />
		</menu>
		<h2>등록된 특정단어 찾기</h2>
		<form action="/5bject/game/findWord.do">
			<table>
				<tr>
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