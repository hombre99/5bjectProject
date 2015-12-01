<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset=" UTF-8">
		<title>UPDATE RESULT</title>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/header_footer.css" />
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/find_info.css" />
	</head>
	<body>

	   <header>
         <jsp:include page="/WEB-INF/script/layout/header_popup.jsp" />
      </header>

	<table>
		<tr><td colspan="2" align="center"><font color="lightblue" face="impact" size="6">Complete update</font></td></tr>
		<tr><td colspan="2" align="center"><font color="lightblue">수정 완료되었습니다.</font></td></tr>
		<tr><td><b>Id</b></td><td>${sessionScope.member.id}</td></tr>
		<tr><td><b>Name</b></td><td>${sessionScope.member.name }</td></tr>
		<tr><td><b>Date</b></td><td> ${sessionScope.member.year}년 ${sessionScope.member.month }월  ${sessionScope.member.day}일  </td></tr>
		<tr><td><b>Gender</b></td><td> ${sessionScope.member.gender }</td></tr>
		<tr><td><b>Email</b></td><td> ${sessionScope.member.emailId }@${sessionScope.member.emailAddress}</td></tr>
		<tr><td><b>Phone-number</b></td><td> ${sessionScope.member.phoneNumber }</td></tr>
		<tr><td colspan="2"><input type="button" value="닫기" onclick="window.close();" /></td></tr>
	</table>
	</body>
</html>