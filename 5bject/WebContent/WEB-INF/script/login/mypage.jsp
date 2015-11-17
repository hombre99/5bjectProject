<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>My Page</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#update_link").on("click", function() {
				window.open('/5bject/member/update.do','ok','width=1000, height=1000,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
			});
			$("#close").on("click",function(){
				window.close();
			});
			$("#leave").on("click",function(){
				if(confirm("정말 탈퇴하시겠습니까?")){
					
					location.replace('/5bject/member/leave.do?id=${sessionScope.member.id}');
					
				}
			});
		});
		
		
		
		
		</script>
</head>
<body>
<h2>회원정보</h2>
ID : ${sessionScope.member.id}<br>
PASSWORD : ${sessionScope.member.password }<br>
NAME : ${sessionScope.member.name }<br>
BIRTHDAY : ${sessionScope.member.month }  ${sessionScope.member.day } ${sessionScope.member.year }<br>
GENDER : ${sessionScope.member.gender }<br>
 EMAIL : ${sessionScope.member.emailId }@${sessionScope.member.emailAddress }<br>
PHONENUMBER : 0${sessionScope.member.phoneNumber }<br>

<input type="button" id="update_link" value="회원정보수정"><br>
<input type="button" value="회원탈퇴" id="leave"><br>
<input type="button"  value="닫기" id="close"><br>


</body>
</html>