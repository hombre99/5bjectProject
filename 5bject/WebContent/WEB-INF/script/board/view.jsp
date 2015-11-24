<%@page contentType = "text/html;charset=UTF-8" %>
<%@ page import="kr.or.object.vo.*" %>

<jsp:useBean id="dao" class="kr.or.object.dao.BoardDaoImpl"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	Board vo = dao.getView(idx);	
	//dao.updateHit(idx);
%>
</head>
<body>

</body>
</html>