<%@ page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset=" UTF-8">
		<title>LOGIN_FORM</title>
	</head>
	<body>
		<form action="/5bject/member/login.do" method="post">
			<table>
				<tr>
					<td colspan="2" align="center">
						<h2><font face="맑은고딕">로그인 페이지</font></h2>
					</td>
				</tr>
				<tr>
					<td> <font face="맑은고딕"><b>아이디</b></font></td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td><b>비밀번호</b></td>
					<td><input type="password" name="password" /> </td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인" /></td>
				</tr>
			</table>
		</form>
	</body>
</html>