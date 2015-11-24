<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript">
<<<<<<< HEAD
	$(document).ready(function() {
		$("#close").on("click", function() {
			window.close();
		});
	});
=======
   $(document).ready(function() {
      $("#close").on("click", function() {
         window.close();
      });
   });
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
</script>
</head>
<body>
<<<<<<< HEAD
	<form action="/5bject/member/find_MemberPassword.do" method="post">
		<table>
			<tr>
				<td colspan="4" align="center"><font color="lightblue">비밀번호 찾기</font></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td colspan="3"><input type="text" name="id" id="id"
					placeholder="아이디를 입력하세요"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="emailId" id="emailId"
					placeholder="email을 입력하세요" /></td>
				<td>@</td>
				<td><select name="emailAddress" id="emailAddress">
						<option value="선택하세요">선택하세요</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="daum.com">daum.com</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td colspan="3"><input type="number" name="phoneNumber"
					id="phoneNumber" placeholder="핸드폰 번호를 입력"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2" align="center"><input type="submit" value="비밀번호 발급받기"> &nbsp;<input type="button" id="close" value="닫기"></td>
				<td></td>
			</tr>
		</table>
	</form>
=======
   <form action="/5bject/member/find_MemberPassword.do" method="post">
      <table>
         <tr>
            <td colspan="4" align="center"><font color="lightblue">비밀번호 찾기</font></td>
         </tr>
         <tr>
            <td>아이디</td>
            <td colspan="3"><input type="text" name="id" id="id"
               placeholder="아이디를 입력하세요"></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><input type="text" name="emailId" id="emailId"
               placeholder="email을 입력하세요" /></td>
            <td>@</td>
            <td><select name="emailAddress" id="emailAddress">
                  <option value="선택하세요">선택하세요</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="nate.com">nate.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="yahoo.com">yahoo.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="daum.com">daum.com</option>
            </select>
            </td>
         </tr>
         <tr>
            <td>핸드폰 번호</td>
            <td colspan="3"><input type="number" name="phoneNumber"
               id="phoneNumber" placeholder="핸드폰 번호를 입력"></td>
         </tr>
         <tr>
            <td></td>
            <td colspan="2" align="center"><input type="submit" value="비밀번호 발급받기"> &nbsp;<input type="button" id="close" value="닫기"></td>
            <td></td>
         </tr>
      </table>
   </form>
>>>>>>> branch 'master' of https://github.com/hombre99/5bjectProject.git
</body>
</html>