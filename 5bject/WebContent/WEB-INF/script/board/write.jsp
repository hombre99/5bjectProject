<%@page contentType = "text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WRITE</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var id = '${ sessionScope.member.id }';
				var notice = 2;
				var ref = 0;

				$("input#noticeChk").on("click", function() {
					if ( this.checked )
						notice = 1;
					else
						notice = 2;
				});

				$("input#writeOKBtn").on("click", function() {
					var title = $("input#titleText").val();
					var content = $("textarea#contentText").val();

					if ( !title ) {
						alert("제목을 입력하세요.");
						$("input#titleText").focus();
						return;
					}

					if ( !content ) {
						alert("내용을 입력하세요.");
						$("textarea#contentText").focus();
						return;
					}

					$.ajax({
						"url" : "/5bject/board/write_success.do",
						"data" : {"id" : id, "title" : title, "content" : content, "notice" : notice, "ref" : ref},
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

		<table class="boardTable">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
							<td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
							<td>글쓰기</td>
							<td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
						</tr>
					</table>
					<table border="0">
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input type="text" id="titleText" name="title" size="100" maxlength="100" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성자</td>
							<td align="left">
								<input type="text" readonly="readonly" id="id" name="id" value="${sessionScope.member.id}" size="20" />
								<c:if test="${ sessionScope.member.id == 'objectclass' }">
									<label><input type="checkbox" id="noticeChk" name="notice" />공지사항</label>
								</c:if>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td>
								<textarea id="contentText" name="content"></textarea>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
						<tr height="2" bgcolor="#82B5DF"><td colspan="5"></td></tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2">
								<input type=button id="writeOKBtn" value="등록" />
								<input type=button value="취소" OnClick="javascript:history.back(-1)" />
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<footer>
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>
	</body>
</html>