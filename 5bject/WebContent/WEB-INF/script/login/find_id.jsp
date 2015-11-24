<%@ page contentType="text/html;charset=UTF-8"%>
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
</script>
</head>
<body>

	<form action="/5bject/member/find_memberId.do" method="post">
		<table>
			<tr><td colspan="4" align="center"><h2><font color="lightblue">아이디 찾기</font></h2></td></tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="emailId" id="emailId"
					placeholder="email을 입력하세요" /></td>
				<td>@</td>
				<td><select name="emailAddress" id="emailAddress">
						<option value="선택하세요">선택하세요</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="daum.com">daum.com</option>
				</select></td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td colspan="3"><input type="number" name="phoneNumber"
					id="phoneNumber" placeholder="핸드폰 번호를 입력"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2" align="center"><input type="submit" value="아이디 찾기"> &nbsp;<input type="button" id="close" value="닫기"></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>