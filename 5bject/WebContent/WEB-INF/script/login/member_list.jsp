<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>전체회원정보</title>
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
<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/menu.css" />
</head>
<body>

	<menu>
		&nbsp;&nbsp;<jsp:include page="/WEB-INF/script/layout/menu.jsp" />
	</menu>
	
	<c:choose>
		<c:when test="${fn:length(requestScope.list)==0 }">
			<tr>
				<td align="center"><h2>회원목록</h2></td>
			</tr>
			<tr>
				<td>등록된 고객이 없습니다.</td>
			</tr>
		</c:when>
		
		<c:otherwise>
			<table style="width: 800px" border="1">
				<tr>
					<td colspan="6" align="center"><h2><font face="HY견고딕" color="lightblue">회원목록</font></h2></td>
				</tr>
				<tr>
					<th>회원 ID</th>
					<th>회원 이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>이메일주소</th>
					<th>연락처</th>
				</tr>

				<c:forEach items="${requestScope.list }" var="member">					
					<tr>
						<td class="id"><a href="/5bject/member/memberInfo.do?id=${member.id }&pageNo=${requestScope.pagingBean.currentPage}">${member.id }</a></td>
						<td>${member.name }</td>
						<td>${member.month }/${member.day }/${member.year }</td>
						<td>${member.gender }</td>
						<td>${member.emailId }@ ${member.emailAddress }</td>
						<td>${member.phoneNumber }</td>
					</tr>
				</c:forEach>
			<tr><td colspan="6"><input type="button" value="닫기" id="close"></td></tr>
			</table>
		</c:otherwise>
	</c:choose>
	
	<p />
	<!-- Paging처리 -->
	<c:choose>
		<c:when test="${requestScope.pagingBean.previousPageGroup }">
			<a href="/5bject/member/memberList.do?pageNo=${requestScope.pagingBean.startPageOfPageGroup-1 }">
				◀ </a>
		</c:when>
		<c:otherwise>
				◀
		</c:otherwise>
	</c:choose>

	<!-- Page Group 내의 page들 링크 처리- PageGroup의 시작/끝페이지 번호 - 반복문 처리 -->
	<c:forEach begin="${requestScope.pagingBean.startPageOfPageGroup }"
		end="${requestScope.pagingBean.endPageOfPageGroup }" var="page">
		<c:choose>
			<c:when test="${page == requestScope.pagingBean.currentPage }">
					[${page}]
			</c:when>
			<c:otherwise>
				<a href="/5bject/member/memberList.do?pageNo=${page }"> ${page }
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- 3. 다음 페이지 그룹 링크 다음 페이지 그룹이 있으면 링크 처리 없으면 그냥 화살표만 나오도록 처리. -->
	<c:choose>
		<c:when test="${requestScope.pagingBean.nextPageGroup }">
			<a href="/5bject/member/memberList.do?pageNo=${requestScope.pagingBean.endPageOfPageGroup+1}">
				▶ 
			</a>
		</c:when>
		<c:otherwise>
				▶
		</c:otherwise>
	</c:choose>
	<br>
</body>
</html>