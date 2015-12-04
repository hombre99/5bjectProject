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
<style type="text/css">
	table{
		margin-left:30px;
	}	
</style>
</head>
<body>
      <table>
         <tr>
            <td colspan="2" align="center"><h2><font color="lightblue"><br>${requestScope.members.name }님</font></h2></td>
         </tr>
         <tr><td colspan="2"><img src="/5bject/image/member/success_register.jpg"></td></tr>	
         <tr>
            <td colspan="2">가입에 성공하신걸 진심으로 환영합니다.</td>
         </tr>
         <tr>
            <td colspan="2" align="left"><input type="button" value="로그인하기" id="login" value="로그인하기"/></td>
         </tr>
      </table>
</body>
</html>