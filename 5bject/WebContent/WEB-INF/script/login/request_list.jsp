<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>고객요청문의</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#close").on("click", function() {
			window.close();
		});
	});
</script>
<style type="text/css">
	table {
		margin-left: 50px;
		background-color: beige;
		width: 700px;
		margin-top: 20px;
	}
	
	header {
		background-color: lightblue;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header.jsp" />
	</header>


	<table>
		<tr>
			<td colspan="4" align="center"><h2>고객문의요청</h2></td>
		</tr>
		<tr>
			<td><b>고객문의날짜</b></td>	
			<td><b>고객아이디</b></td>
			<td><b>고객 이메일주소</b></td>
			<td><b>고객문의사항</b></td>
			
		</tr>
		<c:forEach items="${sessionScope.upload}" var="upload">
			<tr>
				<td>${upload.date}</td>
				<td>${upload.id}</td>
				<td>${upload.members.emailId}@${upload.members.emailAddress}</td>
				<td>${upload.requestInfo}</td>
				
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><input type="button" value="닫기" id="close"></td>
		</tr>
	</table>
</body>
</html>