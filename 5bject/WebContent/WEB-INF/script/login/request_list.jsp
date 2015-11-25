<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	function page_back(){
		history.go(-1);
	}
</script>
<style type="text/css">
table {
	background-color: white;
	width: 1100px;
	margin-top: 20px;
}
a{
	text-decoration: none !important;
	color: white;
}
menu{
	background-color: powderblue;
	color: white;
	padding: 10px;
	font-weight: bold;
}

</style>
</head>
<body>
	<menu>
		<jsp:include page="/WEB-INF/script/layout/menu.jsp" />
	</menu>
	<c:choose>
		<c:when test="${fn:length(requestScope.list)==0 }">
		등록된 고객이 없습니다.
	</c:when>
		<c:otherwise>
			<table>
				<tr>
					<td></td><td colspan="2" align="center"><h2><font color="lightblue">고객문의요청</font></h2></td>
				</tr>
				<tr>
					<td><b>고객문의날짜</b></td>
					<td><b>고객아이디</b></td>
					<td><b>고객 이메일주소</b></td>
					<td><b>고객문의사항</b></td>
				</tr>
				<c:forEach items="${requestScope.list}" var="upload">
					<tr>
						<td>${upload.date}</td>
						<td>${upload.id}</td>
						<td>${upload.members.emailId}@${upload.members.emailAddress}</td>
						<td>${upload.requestInfo}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><input type="button" value="닫기" id="close">&nbsp;<input type="button" onclick="page_back();" value="뒤로가기"></td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	<p />
	<!-- Paging 처리 -->
	<!-- 
1. 이전 페이지 그룹으로 이동 처리
  이전페이지 그룹이 있으면 링크처리 없으면 <- 모양만 나오도록 처리.
 -->
<table>
<tr><td> </td><td colspan="2" align="center">
	<c:choose>
		<c:when test="${requestScope.pagingBean.previousPageGroup }">
			<a href="/5bject/member/request_list.do?pageNo=${requestScope.pagingBean.startPageOfPageGroup-1}">
				◀ </a>
		</c:when>
		<c:otherwise>
 		◀
 	</c:otherwise>
	</c:choose>
	<!-- Page Group 내의 page들 링크 처리
	- PageGroup의 시작/끝페이지 번호 - 반복문 처리
 -->
	<c:forEach begin="${requestScope.pagingBean.startPageOfPageGroup }"
		end="${requestScope.pagingBean.endPageOfPageGroup }" var="page">
		
		<c:choose>
			<c:when test="${page == requestScope.pagingBean.currentPage }">
				(${page})
			</c:when>
			<c:otherwise>
				<a href="/5bject/member/request_list.do?pageNo=${page}">
					${page} 
				</a>
			</c:otherwise>
		</c:choose>
</c:forEach>
	<!-- 3. 다음 페이지 그룹 링크  다음 페이지 그룹이 있으면 링크 처리 없으면 그냥 화살표만 나오도록 처리. -->

	<c:choose>
		<c:when test="${requestScope.pagingBean.nextPageGroup}">
			<a href="/5bject/member/request_list.do?pageNo=${requestScope.pagingBean.endPageOfPageGroup+1}">
				▶ </a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
</td>
<td> </td>
</tr>
</table>
</body>
</html>