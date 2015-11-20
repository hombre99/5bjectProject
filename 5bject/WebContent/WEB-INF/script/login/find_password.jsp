<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
      <script type="text/javascript">
      $(document).ready(function() {
    	  $("#close").on("click",function(){
    		  window.close();
			});
      });
      </script>
</head>
<body>
<h2>비밀번호찾기</h2>

<form action="/5bject/member/find_MemberPassword.do" method="post">
아이디 : 
		<input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
		<br>
이메일 : 
		<input type="text" name="emailId" id="emailId"  placeholder="email을 입력하세요" />@ 
			<select name="emailAddress" id="emailAddress">
				<option value="선택하세요">선택하세요</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="yahoo.com">yahoo.com</option>
				<option value="naver.com">naver.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="daum.com">daum.com</option>
			</select>
		<br>
		
		핸드폰 번호 : 
		<input type="number" name="phoneNumber" id="phoneNumber"  placeholder="핸드폰 번호를 입력하세요">
		<br>
		<input type="submit" value="비밀번호 발급받기" ><br>
		<input type="button"  id="close" value="닫기">
</form>
</body>
</html>