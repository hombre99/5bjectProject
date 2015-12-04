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
			var id = '${ sessionScope.member.id }';
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				if ( id != "objectclass" ) {
					alert("관리자 페이지입니다.");
					history.go(-1);
				}
				$("#close").on("click", function() {
					window.close();
				});
			});

			function page_back(){
				history.go(-1);
			}

			function delete1(){
				if(confirm("정말 삭제하시겠습니까?")){
					return true;
				}else{
					return false;
				}
			}
		</script>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/menu.css" />
	</head>
	<body>
		<c:if test="${ sessionScope.member.id == 'objectclass' }">
			<menu>
				&nbsp;&nbsp;<jsp:include page="/WEB-INF/script/layout/menu.jsp" />
			</menu>

			<c:choose>
				<c:when test="${fn:length(requestScope.list)==0 }">		
					<table style="width: 800px" border="1">
						<tr><td colspan="2" align="center"><h2><font face="HY견고딕" color="lightblue">고객문의요청</font></h2></td></tr>
						<tr><td colspan="2" align="center">문의한 고객이 없습니다.</td></tr>
					</table>
				</c:when>

				<c:otherwise>
					<table style="width: 800px" border="1">
						<tr>
							<td colspan="5" align="center"><h2><font face="HY견고딕" color="lightblue">고객문의요청</font></h2></td>
						</tr>
						<tr>
							<th><b>고객문의날짜</b></th>
							<th><b>고객아이디</b></th>
							<th><b>고객 이메일주소</b></th>
							<th><b>고객문의사항</b></th>
							<th><b>문의삭제</b></th>					
						</tr>
						<c:forEach items="${requestScope.list}" var="upload">
							<tr>
								<td>${upload.date}</td>
								<td>${upload.id}</td>
								<td>${upload.members.emailId}@${upload.members.emailAddress}</td>
								<td>${upload.requestInfo}</td>
								<td align="center">
									<a href="/5bject/member/request_remove.do?date=${upload.date}&pageNo=${requestScope.pagingBean.currentPage}" onclick="return delete1()">
										<b>삭제</b>
									</a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="center">
								<!-- Paging처리 -->
								<c:if test="${ requestScope.pagingBean.previousPageGroup }">
									<a href="/5bject/board/boardInfo.do?boardInfo=2&pageNo=${ requestScope.pagingBean.startPageOfPageGroup - 1 }">
										◀
									</a>
								</c:if>

								<!--
									Page Group 내의 page들 링크 처리
									PageGroup의 시작/끝페이지 번호 - 반복문 처리
								-->
								<c:forEach begin="${ requestScope.pagingBean.startPageOfPageGroup }"
									end="${ requestScope.pagingBean.endPageOfPageGroup }" var="page">
									<c:choose>
										<c:when test="${page == requestScope.pagingBean.currentPage }">
											<b>&nbsp;${ page }&nbsp;</b>
										</c:when>
										<c:otherwise>
											<a href="/5bject/member/request_list.do?pageNo=${page}">
												&nbsp;${ page }&nbsp;
											</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!--
									3. 다음 페이지 그룹 링크
									다음 페이지 그룹이 있으면 링크 처리 없으면 그냥 화살표만 나오도록 처리.
								-->
								<c:if test="${ requestScope.pagingBean.nextPageGroup }">
									<a href="/5bject/member/request_list.do?pageNo=${requestScope.pagingBean.endPageOfPageGroup+1}">
										▶
									</a>
								</c:if>
							</td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
			<table style="width: 800px" border="0">
				<tr>
					<td align="left">
						<input type="button" onclick="page_back();" value="뒤로가기">
					</td>
					<td align="right">
						<input type="button" value="닫기" id="close">
					</td>
				</tr>
			</table>
		</c:if>
	</body>
</html>