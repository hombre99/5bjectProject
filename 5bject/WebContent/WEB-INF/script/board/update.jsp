<%@page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var id = '${ sessionScope.member.id }';
				var notice = '${ sessionScope.contectBoard.notice }';
				var ref = 0;
				
				$("input#correctBtn").on("click", function() {
					var writeNo = $("input#writeNo").val();
					var title = $("input#title").val();
					var content = $("#content").val();

					if ( !title ) {
						alert("제목을 입력하세요.");
						$("input#title").focus();
						return;
					}
	
					if ( !content ) {
						alert("내용을 입력하세요.");
						$("#content").focus();
						return;
					}

					$.ajax({
						"url" : "/5bject/board/update_success.do",
						"data" : {"writeNo" : writeNo, "id" : id, "title" : title, "content" : content, "notice" : notice, "ref" : ref},
						"type" : "POST",
						"success" : function(success_url) {
							location.replace(success_url);
						},
						"error" : function(request, status, error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							location.reload();
						}
					});
				});
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
			<form name="writeform" method="post" action="/5bject/board/update_success.do">
						<table class="boardTable" width="50%" cellpadding="0" cellspacing="0" border="0">
							<tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
								<td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
								<td colspan="2">글 수정 하기</td>
								<td width="6" colspan="2"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">제목</td>
								<td><input type="text" id="title" name="title" size="100" maxlength="100" value="${sessionScope.contectBoard.title}"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">작성자</td>
								<td><input type="text" readonly="readonly" id="id" name="id" value="${sessionScope.member.id}" size="20"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">글번호</td>
								<td><input type="number" readonly="readonly" id="writeNo" name="writeNo" value='${sessionScope.contectBoard.writeNo}' size="20"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">내용</td>
								<td>
									<textarea id="content" name="content" size="20" style="width:100%; height:360px">${ sessionScope.contectBoard.content }</textarea>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
							<tr height="2" bgcolor="#82B5DF"><td colspan="5"></td></tr>
							<tr align="center">
								<td>&nbsp;</td>
								<td colspan="2"><input type="button" id="correctBtn" value="등록">
									<input type=button value="취소" OnClick="javascript:history.back(-1)">
								<td>&nbsp;</td>
							</tr>
						</table>
			</form>
		</div>	
		<footer>
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>
	</body>
</html>