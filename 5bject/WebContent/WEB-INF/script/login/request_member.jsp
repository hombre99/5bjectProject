<%@ page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
		function request_click(){
			if(confirm("문의사항을 제출하시겠습니까?")){
				document.form.submit();
			}else{
				return false;
			}
		}
		function page_back(){
			history.go(-1);
		}
</script>

<style type="text/css">
	.error{
		color: red;
	}
</style>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/header_footer.css" />
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/find_info.css" />
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header_popup.jsp" />
	</header>
	
	<p></p>
	<form action="/5bject/member/request_member.do" method="post" enctype="multipart/form-data" onsubmit="return request_click()">
		<table>
			<tr><td><b>${sessionScope.member.id}</b>님</td></tr>
			<tr><td><input type ="hidden" name="requestId" value="${sessionScope.member.id}"></td></tr>
			<tr><td><img src="/5bject/image/member/request.jpg" /></td></tr>
			<tr><td>문의 사항을 밑에 입력해주시기 바랍니다.</td></tr>
			<tr><td><input type ="file" name="upImage"><br></td></tr>
			<tr><td ><b>문의사항</b></td></tr>
			<tr><td><textarea name="requestInfo" cols="60" rows="15" placeholder="문의사항을 입력해주세요"></textarea></td></tr>
			<tr><td colspan="2"><span class="error"><b>${requestScope.error}</b></span></td></tr>
			<tr><td colspan="2"><input type="submit" value="문의하기">&nbsp;<input type="button" onclick="page_back();" value="뒤로가기"></td></tr>
		</table>
	</form>
</body>
</html>