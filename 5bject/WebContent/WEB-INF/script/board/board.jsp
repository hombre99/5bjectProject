<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
	<style type="text/css">
			header {
				background-color: lightblue;
				color: white;
				text-align: left;
				padding: 5px;
			}
			
			footer {
				background-color: lightblue;
				color: white;
				height: 100px;
				clear: both;
				text-align: center;
			}
			
			table{
			margin-left: 250px;
			text-align: center;
			}
			#boardDiv{
			height: 750px;
			}
			</style>
</head>
<body>
<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp" />
</header>
<c:choose>
	<c:when test="${fn:length(sessionScope.boardList)==0 }">
		<div id=boardDiv>
		<div align="center"><h2>등록된 글이 없습니다.</h2><p></div>
		<div align="center"><input type=button value="글쓰기" OnClick="window.location.href='/5bject/board/write.do'"></div>
		</div>
	</c:when>
<c:otherwise>
		<div id=boardDiv><table width="70%" cellpadding="0" cellspacing="0" border="0">
		<tr><td colspan="7" align="center"><h1>자유게시판</h1></td></tr>
  				<tr height="5"><td width="5"></td></tr>
				<tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
				    <td width="5"><img src="/5bject/image/board/table_left.gif" width="5" height="30" /></td>
  					 <td width="73">번호</td>
   					<td width="379">제목</td>
   					<td width="90">글쓴이</td>
   					<td width="164">등록일</td>
   					<td width="58">조회수</td>
   					<td width="7"><img src="/5bject/image/board/table_right.gif" width="5" height="30" /></td>
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
			<c:forEach items="${sessionScope.boardList }" var="board">
			<tr>
				<td align="center">&nbsp;</td>
				<td>${board.writeNo}</td>
				<td>
					<a href="${board.writeNo}">
						${board.title}
					</a>
					</td>
<a href="${initParam.rootPath}/controller?command=getInfo&customerId=${customer.customerId }&pageNo=${requestScope.pagingBean.currentPage}"></a>
					<td>${board.id}</td>
				<td>${board.date}</td>
				<td>${board.hit}</td>
				<td align="center">&nbsp;</td>                                                                                                                                                                                                                        
			</tr>
			</c:forEach>
			<tr align="center">
  			 <td colspan="7">
   				<input type=button value="글쓰기" OnClick="window.location.href='/5bject/board/write.do'">
   			</td>
  			</tr>
			</table>
			</div>
			</c:otherwise>
		</c:choose>
		<p/>
			
			<footer>		
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>	
</body>
</html>