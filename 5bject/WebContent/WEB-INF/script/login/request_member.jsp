<%@ page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
<style type="text/css">
			table{
			margin-left: 30px;
		}
				header{
			background-color: lightblue;
			color: white;
			text-align: left;
			padding: 5px;
		}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header.jsp" />
	</header>
	<p></p>
	<form action="/member/request_member.do" method="post" enctype="multipart/form-data">
		<table>
			<tr><td><b>${sessionScope.member.id}</b>님</td></tr>
			<tr><td><input type ="hidden" name="requestId" value="${sessionScope.member.id}"></td></tr>
			<tr><td><img src="/5bject/image/member/request.jpg" /></td></tr>
			<tr><td>문의 사항을 밑에 입력해주시기 바랍니다.</td></tr>
			<tr><td><input type ="file" name="upImage"><br></td></tr>
			<tr><td ><b>문의사항</b></td></tr>
			<tr><td><textarea name="requestInfo" cols="60" rows="15"></textarea></td></tr>
			<tr><td><input type="submit" value="전송"></td></tr>
		</table>
	</form>
</body>
</html>