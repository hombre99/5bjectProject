<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.object.vo.Board"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>NOTICE</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function(){			
				var loginId = '${ sessionScope.member.id }';
	
				if ( loginId != "" ) {
					var td = document.createElement("td");
					td.setAttribute("id", "btnTd");
					td.setAttribute("colspan", "7");

					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("id", "btnTd");
					input.setAttribute("value", "글쓰기");
					input.setAttribute("onclick", "window.location.href='/5bject/board/write.do'");

					$(td).append(input);
					$("#btnTr").append(td);
				}
			});
		</script>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/board.css" />
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp" />
		</header>

		<div class="boardDiv">
			<board>
				<jsp:include page="/WEB-INF/script/layout/board.jsp" />
			</board>
		</div>

		<div id="boardDiv">
			<table class="boardTable" width="70%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="7" align="center">
						<h1>자유게시판</h1>
					</td>
				</tr>
  				<tr height="5">
  					<td width="5"></td>
  				</tr>
				<tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
			    	<td width="5"><img src="/5bject/image/board/table_left.gif" width="5" height="30" /></td>
  					<td width="73">번호</td>
   					<td width="379">제목</td>
   					<td width="90">작성자</td>
   					<td width="164">등록일</td>
   					<td width="58">조회수</td>
   					<td width="7"><img src="/5bject/image/board/table_right.gif" width="5" height="30" /></td>
				</tr>
				<c:forEach items="${ requestScope.boardList }" var="board">
					<tr>
						<td align="center">&nbsp;</td>
						<td>${ board.writeNo }</td>
						<td id="boardTitle">
							<a href="/5bject/board/view.do?writeNo=${ board.writeNo }&hit=${ board.hit }&id=${ board.id }&sessionId=${ sessionScope.member.id }">
								${ fn:length(board.title) > 15 ? fn:substring(board.title,0,15).concat(".....") : board.title }
							</a>
						</td>
						<c:choose>
							<c:when test="${ board.id == 'objectclass' }">
								<td><b>관리자</b></td>
							</c:when>
							<c:otherwise>
								<td>${ board.id }</td>
							</c:otherwise>
						</c:choose>
					 	<%
							Date aaa = (Date)((Board)pageContext.findAttribute("board")).getDate();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
							if ( sdf.format(aaa).equals(sdf.format(new Date())) ) {
						%>
						<td><fmt:formatDate value="${ board.date }" pattern="HH:mm:ss" /></td>
						<% } else { %>
						<td><fmt:formatDate value="${ board.date }" pattern="yyyy-MM-dd" /></td>
						<% } %>
					<td>${ board.hit }</td>        
					<td align="center">&nbsp;</td>                                                                                                                                                                                                                 
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
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
									<b>${ page }</b>
								</c:when>
								<c:otherwise>
									<a href="/5bject/board/boardInfo.do?boardInfo=2&pageNo=${ page }">
										${ page }
									</a>
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;
						</c:forEach>

						<!--
							3. 다음 페이지 그룹 링크
    						다음 페이지 그룹이 있으면 링크 처리 없으면 그냥 화살표만 나오도록 처리.
 						-->
						<c:if test="${ requestScope.pagingBean.nextPageGroup }">
							<a href="/5bject/board/boardInfo.do?boardInfo=2&pageNo=${ requestScope.pagingBean.endPageOfPageGroup + 1 }">
								▶
							</a>
						</c:if>
					</td>
					<td id="btnTr" align="right"></td>
  				</tr>
			</table>
			<div align="center"></div>
		</div>
	
		<footer>
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>
	</body>
</html>