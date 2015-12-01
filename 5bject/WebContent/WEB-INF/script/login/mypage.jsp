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
				/* width 800과 height 700으로 수정*/
				window.open('/5bject/member/update.do','ok','width=800, height=500, toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
			});
			$("#close").on("click",function(){
				window.close();
			});
			$("#leave").on("click",function(){
				var password = '${ sessionScope.member.password }';
				if(confirm("정말 탈퇴하시겠습니까?")){
					if ( password == window.prompt("비밀번호를 입력해주세요.") ) {
						opener.location.replace('/5bject/member/leave.do?id=${sessionScope.member.id}');					
						window.close();
					} else {
						alert("비밀번호가 맞지 않습니다.");
					}
				}
			});
			/*2015 11 25일 width size change*/
			$("#request_link").on("click",function(){
				window.open('/5bject/member/request.do?requestId=${sessionScope.member.id}','ok','width=1600, height=600');
			});
			
			$("#score_link").on("click",function(){
				window.open('/5bject/member/memberScore.do?id=${sessionScope.member.id}','ok','width=1600, height=600');
			});
		});
		</script>
		<!-- css header, table 처리 -->
		<style type="text/css">
			table{
				margin-left: 100px;
			}
		</style>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/header_footer.css" />
</head>
<body>
<!-- table로 처리 -->
	<!-- header include로 처리 -->
	<header>
		<jsp:include page="/WEB-INF/script/layout/header_popup.jsp" />
	</header>

		<table>
			<tr><td colspan="2" align="center"><br><font size="5" face="impact" color="lightblue">${sessionScope.member.id}</font><font color="lightblue">의 회원정보</font><br></td></tr>
			<tr><td colspan="2"> </td></tr>
			<tr><td><b>Id</b></td><td> ${sessionScope.member.id}<br></td></tr>
			<tr><td><b>Name</b></td><td> ${sessionScope.member.name }<br></td></tr>
			<tr><td><b>Birhday</b></td><td>  ${sessionScope.member.year }년 ${sessionScope.member.month }월  ${sessionScope.member.day}일 <br></td></tr>
			<tr><td><b>Gender</b></td><td> ${sessionScope.member.gender }<br></td></tr>
			<tr><td><b>Email</b></td><td> ${sessionScope.member.emailId }@${sessionScope.member.emailAddress }<br></td></tr>
			<tr><td><b>Phone-number</b></td><td> ${sessionScope.member.phoneNumber}</td></tr>
			<tr><td colspan="2"></td></tr>
			<tr>
				<td colspan="2">
					<!-- 고객문의요청 페이지 추가 -->
					<input type="button" id="update_link" value="회원정보수정">
					<input type= "button" id="score_link" value="게임점수조회">
					<input type="button" id="request_link" value="고객문의요청">
					<input type="button" value="회원탈퇴" id="leave">
					<input type="button"  value="닫기" id="close">
				</td>
			</tr>
		</table>			
</body>
</html>