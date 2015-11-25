<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
</head>
<body>
<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp" />
</header>
<c:choose>
	<c:when test="${fn:length(requestScope.list)==0 }">
		등록된 고객이 없습니다.
	</c:when>
<c:otherwise>
<h1>자유 게시판</h1>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
  				<tr height="5"><td width="5"></td></tr>
				<tr style="background:url('image/board/table_mid.gif') repeat-x; text-align:center;">
				    <td width="5"><img src="image/board/table_left.gif" width="5" height="30" /></td>
  					 <td width="73">번호</td>
   					<td width="379">제목</td>
   					<td width="90">글쓴이</td>
   					<td width="164">등록일</td>
   					<td width="58">조회수</td>
   					<td width="7"><img src="image/board/table_right.gif" width="5" height="30" /></td>
			</tr>
			<%-- <c:forEach items="${requestScope.board}"  var="board">
			<tr>
				<td align="center">&nbsp;</td>
				<td>${board.writeNo}</td>
				<td>
					<a href="${board.writeNo}">
						${board.title}
					</a>
				</td>
				<td>${board.memberId}</td>
				<td>${board.writeDate}</td>
				<td>${board.hit}</td>
				<td align="center">&nbsp;</td>                                                                                                                                                                                                                        
			<tr>
			</c:forEach> --%>
			<c:forEach items="${sessionScope.board }" var="board">
			<tr>
				<td align="center">&nbsp;</td>
				<td>${board.writeNo}</td>
				<td>
					<a href="${board.writeNo}">
						${board.title}
					</a>
					</td>
<a href="${initParam.rootPath}/controller?command=getInfo&customerId=${customer.customerId }&pageNo=${requestScope.pagingBean.currentPage}"></a>
					<td>${board.memberId}</td>
				<td>${board.writeDate}</td>
				<td>${board.hit}</td>
				<td align="center">&nbsp;</td>                                                                                                                                                                                                                        
			</tr>
			</c:forEach>
			</table>
			</c:otherwise>
</c:choose>
<p/>
			
			<footer>		
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>	
</body>
</html>