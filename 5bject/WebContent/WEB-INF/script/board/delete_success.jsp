<%@page contentType = "text/html;charset=UTF-8" %>
<jsp:useBean id="dao" class="kr.or.object.dao.BoardDaoImpl"/>
<jsp:useBean id="vo" class="kr.or.object.vo.Board"/>
<jsp:setProperty name="vo" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
			
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	boolean ch = true;
	if(ch) {
			dao.delete(idx);
		%>
			<script type="text/javascript">
				self.window.alert("해당 글을 삭제하였습니다.");
				location.href="list.jsp?pg=<%=pg%>";
			</script>
		<%
	} else {
		%>
			<script type="text/javascript">
				self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
		<%
	}
%>
</head>
<body>

</body>
</html>