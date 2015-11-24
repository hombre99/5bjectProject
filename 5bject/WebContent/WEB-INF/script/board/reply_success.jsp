<%@page contentType = "text/html;charset=UTF-8" %>
<%@ page import="kr.or.object.vo.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="kr.or.object.dao.BoardDaoImpl"/>
<jsp:useBean id="vo" class="kr.or.object.vo.Board"/>
<jsp:setProperty name="vo" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("euc-kr");
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	Board vo1 = dao.getView(idx);
	int ref = vo1.getRef();
	Date date = vo1.getDate();
		
	dao.insertReply(vo, ref, date);
	%>
  <script type="text/javascript">
   self.window.alert("입력한 답글을 저장하였습니다.");
   location.href="list.jsp?pg=<%=pg%>";
  </script>
</head>
<body>

</body>
</html>