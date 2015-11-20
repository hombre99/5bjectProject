<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>전체회원정보</title>

<script type="text/javascript" src="/5bject/jquery.do"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#close").on("click",function(){
				window.close();
			});
		});
	</script>
</head>
<body>
<h2>회원목록</h2>
<c:choose>

<c:when test="${fn:length(sessionScope.member)==0 }">
	등록된 고객이 없습니다.
</c:when>

<c:otherwise>
	<table style="width:800px" border="1">
		<tr>
			<th>회원 ID</th>
			<th>회원 이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>이메일주소</th>
			<th>연락처</th>
		</tr>
		
		<c:forEach items="${sessionScope.member}" var="member">
			<tr>
				<td>
				<a href="/5bject/member/memberInfo.do?id=${member.id}">${member.id }</a>
				</td>
				<td>${member.name }</td>
				<td>${member.month }/${member.day }/${member.year }</td>
				<td>${member.gender }</td>
				<td>${member.emailId } @ ${member.emailAddress }</td>
				<td>${member.phoneNumber }</td>
		</c:forEach>
	</table>
</c:otherwise>

</c:choose>

<input type="button" value="닫기" id="close"	>
</body>
</html>