<%@ page contentType="text/html;charset=UTF-8"%>
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
찾으신 고객님의 아이디는 ${sessionScope.memId } 입니다.
<input type="button" id="login" value="로그인하러가기">
</body>
</html>