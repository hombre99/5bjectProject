<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript">
	$(document).ready( function() {
				
				var writer = '${sessionScope.writer}'
				var board = '${sessionScope.contectBoard.writeNo}';	 // 글 번호		
				var replyList = '${sessionScope.replyList}';	
				
				if (writer=="writer") {
					var td = document.createElement("td");
					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("value", "수정");
					input.setAttribute("onclick", "window.location.href='/5bject/board/update.do'");
					$(td).append(input);
					$("#btnTr").append(td);

					var td = document.createElement("td");
					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("value", "삭제");
					input.onclick = function(){
						var confirm = window.confirm("정말 삭제 하시겠습니까?");
							if(confirm){	
								window.location.href="/5bject/board/delete.do?idx="+board+"&boardId=${sessionScope.member.id}";
							}else{
								this.close;
							}
					}
					$(td).append(input);
					$("#btnTr").append(td);
					
					var td = document.createElement("td");
					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("value", "덧글달기");
					input.onclick = function(){
						window.open("/5bject/board/reply.do", "pop", "width=800, height=800, top=50, left=150");
					}
					$(td).append(input);
					$("#btnTr").append(td);
					
					var td = document.createElement("td");
					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("value", "목록으로");
					//input.setAttribute("Onclick", "window.location.href='/5bject/board/notice.do'");
					input.onclick = function(){
						var notice = '${sessionScope.contectBoard.notice}';
						if(notice==1){
							window.location.href='/5bject/board/notice.do';
						}else if(notice==2){
							window.location.href='/5bject/board/board.do';
						}else{
							alert("비정상적인 접근입니다");
							window.location.href='/5bject/main.do';
						}
					}
					$(td).append(input);
					$("#btnTr").append(td);
					
				} else {
					var td = document.createElement("td");
					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("value", "목록으로");
					input.onclick = function(){
						var notice = '${sessionScope.contectBoard.notice}';
						if(notice==1){
							window.location.href='/5bject/board/notice.do';
						}else if(notice==2){
							window.location.href='/5bject/board/board.do';
						}else{
							alert("비정상적인 접근입니다");
							window.location.href='/5bject/board/main.do';
						}
					}
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

table {
	margin-left: 250px;
	text-align: center;
}

#boardDiv {
	height: 800px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header.jsp" />
	</header>
	<div id="boardDiv">
		<table>
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background: url('/5bject/image/board/table_mid.gif') repeat-x; text-align: center;">
							<td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
							<td align="center"><b>${sessionScope.contectBoard.title}</b></td>
							<td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
						</tr>
					</table>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background: url('/5bject/image/board/table_mid.gif') repeat-x; text-align: center;">
							<td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
							<td align="left">글쓴이 : ${sessionScope.contectBoard.id }</td>
							<td align="center">등록일 : ${sessionScope.contectBoard.date}</td>
							<td align="right">조회 수 : ${sessionScope.contectBoard.hit}</td>
							<td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
						</tr>
					</table>
					<table id="replyTr">
						<tr>
						<tr height="2" bgcolor="#dddddd">
							<td colspan="5"></td>
						</tr>

						<tr height="2" bgcolor="#dddddd">
							<td colspan="5"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>

							<td><textarea readonly="readonly" name="memo" cols="100"
									rows="20">${sessionScope.contectBoard.content}</textarea></td>
							<td>&nbsp;</td>
						</tr>
							<tr height="2" bgcolor="#dddddd">
							<td colspan="5"></td>
						</tr>
						<tr height="2" bgcolor="#dddddd">
							<td colspan="5"></td>
						</tr>	
					</table>
					<c:choose>
					<c:when test="${sessionScope.replyList }==null">
					</c:when>
					<c:otherwise>
					<c:forEach items='${sessionScope.replyList}' var="reply" >
						<tr align="center">
							<td>
								<img src= "/5bject/image/board/reply_icon.gif">
							</td>	
							<td> ${sessionScope.reply.id} </td>
							<td colspan="3">
								<textarea readonly="readonly" cols="100" rows="1" >
									${sessionScope.reply.content }	
								</textarea>
							</td>
							<td> ${sessionScope.reply.date }</td>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					<div align="center">
						<table>
							<tr align="center" id="btnTr">

							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<footer>
		<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
	</footer>
</body>
</html>