<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<style type="text/css">
header {
	background-color: lightblue;
	color: white;
	text-align: left;
	padding: 5px;
}

#memId {
	margin-left: 70px;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header.jsp" />
	</header>
	<div id="memId">
			<c:choose>
				<c:when test="${ (requestScope.password!=null) }">
					<br>
					<img src="/5bject/image/member/successPassword.jpg" />
					<br>
					<font color="lightblue" size="3">임시 비밀번호는
						${requestScope.newPassword} 입니다</font>
				</c:when>
				<c:otherwise>
					<br>
					<font color="lightblue" size="3">고객님의 아이디와 이메일주소와 전화번호를 제대로
						입력해 주세요.</font>
					<br>
					<input type="button" onclick="page_back();" value="뒤로가기">
				</c:otherwise>
			</c:choose>
	</div>
</body>
</html>