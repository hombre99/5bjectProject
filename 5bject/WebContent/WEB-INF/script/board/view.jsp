<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var writer = '${ sessionScope.writer }';
				var board = '${ sessionScope.contectBoard.writeNo }';
				var replyList = '${ sessionScope.replyList }';	
				
				if ( writer == "writer" ) {
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
					input.onclick = function() {
						var confirm = window.confirm("정말 삭제 하시겠습니까?");

						if(confirm){	
							window.location.href="/5bject/board/delete.do?idx="+board+"&boardId=${ sessionScope.member.id }";
						}else{
							this.close;
						}
					}
					$(td).append(input);
					$("#btnTr").append(td);

					var td = document.createElement("td");
					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("value", "목록으로");
					input.onclick = function(){
						var notice = '${ sessionScope.contectBoard.notice }';

						if ( notice )
							location.replace("/5bject/board/boardInfo.do?boardInfo=" + notice);
						else
							location.replace("/5bject/main.do");
					}
					$(td).append(input);
					$("#btnTr").append(td);
				} else {
					var td = document.createElement("td");
					var input = document.createElement("input");
					input.setAttribute("type", "button");
					input.setAttribute("value", "목록으로");
					input.onclick = function(){
						var notice = '${ sessionScope.contectBoard.notice }';

						if ( notice )
							location.replace("/5bject/board/boardInfo.do?boardInfo=" + notice);
						else
							location.replace("/5bject/main.do");
					}
					$(td).append(input);
					$("#btnTr").append(td);
				}

				$("input#addReplyBtn").on("click", addReply);

				$("input#replyText").on("keypress", function() {
					if ( event.keyCode == 13 ) {
						addReply();
					}
				});
			});
		</script>
		<script type="text/javascript">
			function addReply() {
				var id = '${ sessionScope.member.id }';
				var title = "reply";
				var content = $("input#replyText").val();
				var hit = '${ sessionScope.contectBoard.hit }';
				var notice = '${ sessionScope.contectBoard.notice }';
				var writeNo = '${ sessionScope.contectBoard.writeNo }';

				$.ajax({
					"url" : "/5bject/board/addReply.do",
					"data" : {"id" : id,
						"title" : title,
						"content" : content,
						"notice" : notice,
						"writeNo" : writeNo},
					"type" : "POST",
					"success" : function() {
						location.replace("/5bject/board/view.do?writeNo=" + writeNo + "&hit=" + hit + "&id=" + id + "&sessionId=" + id);
					},
					"error" : function(request, status, error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						location.reload();
					}
				});
			};
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
			<table class="boardTable">
				<tr>
					<td>
						<table class="boardTable" width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr style="background: url('/5bject/image/board/table_mid.gif') repeat-x; text-align: center;">
								<td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
								<td align="center"><b>${ sessionScope.contectBoard.title }</b></td>
								<td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
							</tr>
						</table>
						<table class="boardTable" width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr style="background: url('/5bject/image/board/table_mid.gif') repeat-x; text-align: center;">
								<td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
								<td align="left">글쓴이 : ${ sessionScope.contectBoard.id }</td>
								<td align="center">등록일 : ${ sessionScope.contectBoard.date }</td>
								<td align="right">조회 수 : ${essionScope.contectBoard.hit }</td>
								<td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
							</tr>
						</table>
						<table class="boardTable" id="replyTr">
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
										rows="20">${ sessionScope.contectBoard.content }</textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="2" bgcolor="#dddddd">
								<td colspan="5"></td>
							</tr>
							<tr height="2" bgcolor="#dddddd">
								<td colspan="5"></td>
							</tr>	
							<c:choose>
								<c:when test="${ sessionScope.replyList == null }">
								</c:when>
								<c:otherwise>
									<c:forEach items="${ sessionScope.replyList }" var="reply" >
										<tr align="left">
											<td> <img src="/5bject/image/board/reply_icon.gif" > </td>	
											<td> ${reply.id} </td>
											<td colspan="3">
												<input type="text" readonly="readonly" size="100" value="${reply.content}" />
											</td>
											<td> ${reply.date}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<!-- 댓글 등록 폼 -->
							<c:if test="${ sessionScope.member.id != null }">
								<table class="boardTable">
									<tr>
										<td><img src="/5bject/image/board/reply_icon.gif" /></td>
										<td>${ sessionScope.member.id }</td>
										<td><input type="text" id="replyText" size="100" /></td>
										<td><input type="button" id="addReplyBtn" value="등록" /></td>
									</tr>
								</table>
							</c:if>
						</table>
						<div align="center">
							<table border="1">
								<tr align="center" id="btnTr"></tr>
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