<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset=" UTF-8">
		<title>UPDATE RESULT</title>
	</head>
	<body>
		<h2>수정완료</h2>
 		ID : ${sessionScope.member.id }<br>
		PASSWORD : ${sessionScope.member.password }<br>
		NAME : ${sessionScope.member.name }<br>
		DATE : ${sessionScope.member.month } ${sessionScope.member.day } ${sessionScope.member.id }<br>
		GENDER : ${sessionScope.member.gender }<br>
		EMAIL : ${sessionScope.member.emailId }@${sessionScope.member.emailAddress }<br>
		PHONENUMBER : 0${sessionScope.member.phoneNumber }<br>
		<input type="button" value="닫기" onclick="window.close();" />
	</body>
</html>