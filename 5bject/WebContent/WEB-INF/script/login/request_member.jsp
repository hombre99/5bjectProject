<%@ page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<!-- 20151116~지속중 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#close").on("click",function(){
			if(confirm("문의사항은 빠른 시일내에 이메일로 알려드리겠습니다.")){
				window.close();
			}
		});
	});
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
	.error{
	color: red;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header.jsp" />
	</header>
	<p></p>
	<form action="/5bject/member/request_member.do" method="post" enctype="multipart/form-data">
		<table>
			<tr><td><b>${sessionScope.member.id}</b>님</td></tr>
			<tr><td><input type ="hidden" name="requestId" value="${sessionScope.member.id}"></td></tr>
			<tr><td><img src="/5bject/image/member/request.jpg" /></td></tr>
			<tr><td>문의 사항을 밑에 입력해주시기 바랍니다.</td></tr>
			<tr><td><input type ="file" name="upImage"><br></td></tr>
			<tr><td ><b>문의사항</b></td></tr>
			<tr><td><textarea name="requestInfo" cols="60" rows="15" placeholder="문의사항을 입력해주세요"></textarea></td></tr>
			<tr><td colspan="2"><span class="error"><b>${requestScope.error}</b></span></td></tr>
			<tr><td><input type="submit" value="전송" id="close"></td></tr>
		</table>
	</form>
</body>
</html>