<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:choose>
            <c:when test="${ (sessionScope.password != null) }">
            임시 비밀번호는 ${sessionScope.newPassword } 입니다.
            </c:when>
            <c:otherwise>
            	고객님의 아이디와 이메일주소와 전화번호를 제대로 입력해 주세요.
            </c:otherwise>
  </c:choose>


</body>
</html>