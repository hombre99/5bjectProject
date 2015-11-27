<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript">
		
$(document).ready(function(){			
	
	
	var loginId = '${ sessionScope.member.id }';
	
	if(loginId != ""){
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
			height: 800px;
			}
			
			#btnTr{
				align:center;
			}
			
			.boardDiv{
				background-color: #f1f2f2;
				padding: 20px;
			}

			</style>
</head>
<body>
<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp"/>
</header>
<div class="boardDiv">
<board>
			<jsp:include page="/WEB-INF/script/layout/board.jsp" />
</board>
</div>
<div id="boardDiv">
		<table width="70%" cellpadding="0" cellspacing="0" border="0">
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
			<c:forEach items="${requestScope.boardList}"  var="board">
			<tr>
				<td align="center">&nbsp;</td>
				<td>${board.writeNo}</td>
				<td id="boardTitle">
						<a href="/5bject/board/view.do?writeNo=${board.writeNo}&hit=${board.hit}&id=${board.id}&sessionId=${sessionScope.member.id}">
						${board.title}
					</a>
				</td>
				<td>${board.id}</td>
				<td>${board.date}</td>
				<td>${board.hit}</td>        
				<td align="center">&nbsp;</td>                                                                                                                                                                                                                 
			<tr>
			</c:forEach>
			<tr id="btnTr">
			
  			</tr>
		</table>
		<div align="center">
		<!-- Paging처리 -->
	<c:choose>
		<c:when test="${requestScope.pagingBean.previousPageGroup }">

			<a href="/5bject/board/board.do?pageNo=${requestScope.pagingBean.startPageOfPageGroup-1 }">

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
			[${page}]
		</c:when>
			<c:otherwise>
				<a href="/5bject/board/board.do?pageNo=${page }"> ${page }
				</a>
			</c:otherwise>
		</c:choose>
	&nbsp;&nbsp;
</c:forEach>
	<!-- 3. 다음 페이지 그룹 링크
    다음 페이지 그룹이 있으면 링크 처리 없으면 그냥 화살표만 나오도록 처리.
 -->

	<c:choose>
		<c:when test="${requestScope.pagingBean.nextPageGroup }">
			<a
				href="/5bject/board/board.do?pageNo=${requestScope.pagingBean.endPageOfPageGroup+1}">
				▶ </a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
	</div>
		</div>
	
		<footer>		
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>
</body>
</html>