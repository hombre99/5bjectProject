<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="/5bject/jquery.do"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#login").on("click", function(){
			window.close();
		});
	});
	</script> 
</head>
<body>
 <c:choose>
            <c:when test="${ (sessionScope.memId != null) }">
            찾으신 고객님의 아이디는 ${sessionScope.memId } 입니다.
            </c:when>
            <c:otherwise>
            	고객님의 이메일주소와 전화번호를 제대로 입력해 주세요.
            </c:otherwise>
  </c:choose>



<input type="button" id="login" value="로그인하러가기">
</body>
</html>