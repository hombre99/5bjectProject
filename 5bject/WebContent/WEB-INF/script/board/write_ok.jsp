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
	request.setCharacterEncoding("euc-kr");
	//int max = dao.getMax();
	//dao.insertWrite(vo, max);
%>

  <script type="text/javascript">
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp";
  </script>
</head>
<body>

</body>
</html>