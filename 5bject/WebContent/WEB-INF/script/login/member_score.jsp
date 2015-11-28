<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>게임점수 조회</h2>
하 : ${sessionScope.score[0].easy}점	
중 : ${sessionScope.score[0].normal }점
상 : ${sessionScope.score[0].hard }점
</body>
</html>