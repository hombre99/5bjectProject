<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset=" UTF-8">
		<title>UPDATE RESULT</title>
			<!-- 20151124 css ADD (table, header) -->
		<style type="text/css">
		    header{
	            background-color: lightblue;
	            color: white;
	            text-align: left;
	            padding: 5px;
     	    }
			table{
				margin-left: 70px;
			}
		</style>
	</head>
	<body>
	<!-- header ADD 20151124 CHJ -->
	   <header>
         <jsp:include page="/WEB-INF/script/layout/header.jsp" />
      </header>
	<!-- 20151124 change general  to table CHJ design change -->
	<table>
		<tr><td colspan="2" align="center"><font color="lightblue" face="impact" size="6">Complete update</font></td></tr>
		<tr><td colspan="2" align="center"><font color="lightblue">수정 완료되었습니다.</font></td></tr>
		<tr><td><b>ID</b></td><td>${sessionScope.member.id}</td></tr>
		<tr><td><b>NAME</b></td><td>${sessionScope.member.name }</td></tr>
		<tr><td><b>DATE</b></td><td>${sessionScope.member.month }월  ${sessionScope.member.day}일  ${sessionScope.member.year}년도</td></tr>
		<tr><td><b>GENDER</b></td><td> ${sessionScope.member.gender }</td></tr>
		<tr><td><b>EMAIL</b></td><td> ${sessionScope.member.emailId }@${sessionScope.member.emailAddress}</td></tr>
		<tr><td><b>PHONENUMBER</b></td><td> ${sessionScope.member.phoneNumber }</td></tr>
		<tr><td colspan="2"><input type="button" value="닫기" onclick="window.close();" /></td></tr>
	</table>
	</body>
</html>