<%@ page contentType = "text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#login").on("click", function() {
					window.close();
				});
			});
		
		</script>
</head>
<body>
<div class="test" style="border:1px solid gray;">
   ${requestScope.members.name }님!<br>
가입에 성공하신걸 진심으로 환영합니다.<br>
<a href="/5bject/member/main.do">로그인하기</a>
<input type="button" value="로그인하기" id="login"/>
</div>

</body>
</html>