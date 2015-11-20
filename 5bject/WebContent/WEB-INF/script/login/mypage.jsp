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
				window.open('/5bject/member/update.do','ok','width=800, height=500,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
			});
			$("#close").on("click",function(){
				window.close();
			});
			$("#leave").on("click",function(){
				if(confirm("정말 탈퇴하시겠습니까?")){
					location.replace('/5bject/member/leave.do?id=${sessionScope.member.id}');					
				}
			});
			/*request link for customer CHJ*/
			$("#request_link").on("click",function(){
				window.open('/5bject/member/request.do?requestId=${sessionScope.member.id}','ok','width=1000, height=600,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0');
			});
		});
		</script>
		<!-- css header, table 처리 -->
		<style type="text/css">
			header{
				background-color: lightblue;
				color: white;
				text-align: left;
				padding: 5px;
			}
			table{
				margin-left: 50px;
				font-family: HY나무M;
			}
		</style>
</head>
<body>
<!-- table로 처리 -->
	<!-- header include로 처리 -->
	<header>
		<jsp:include page="/WEB-INF/script/layout/header.jsp" />
	</header>
		<table>
			<tr><td colspan="2" align="center"><h2>${sessionScope.member.id}의 회원정보</h2>
			<tr><td>ID </td><td> ${sessionScope.member.id}<br></td></tr>
			<tr><td>PASSWORD </td><td> ${sessionScope.member.password }<br></td></tr>
			<tr><td>NAME </td><td> ${sessionScope.member.name }<br></td></tr>
			<tr><td>BIRTHDAY </td><td> ${sessionScope.member.month }  ${sessionScope.member.day} ${sessionScope.member.year }<br></td></tr>
			<tr><td>GENDER </td><td> ${sessionScope.member.gender }<br></td></tr>
			<tr><td> EMAIL </td><td> ${sessionScope.member.emailId }@${sessionScope.member.emailAddress }<br></td></tr>
			<tr><td>PHONENUMBER </td><td> 0${sessionScope.member.phoneNumber}</td></tr>
			<tr><td colspan="2"></td></tr>
			<tr>
				<td colspan="2">
					<!-- 고객문의요청 페이지 추가 -->
					<input type="button" id="update_link" value="회원정보수정">
					<input type="button" id="request_link" value="고객문의요청">
					<input type="button" value="회원탈퇴" id="leave">
					<input type="button"  value="닫기" id="close">
				</td>
			</tr>
		</table>			
	<footer>
	</footer>
</body>
</html>