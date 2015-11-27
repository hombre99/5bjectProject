<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset=" UTF-8">
		<title>UPDATE FORM</title>
		<!-- 20151124 page back 과 jquery경로 설정 -->
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			function page_back(){
				history.go(-1);
			}
			function checkEngNum(){
				var regType =/^[a-z0-9+]*$/;
				if (!regType.test(document.getElementById('id').value)){
					alert('영문과 숫자만 입력가능합니다'); 
					document.getElementById("id").value="";
				}
			};	
			function checkKor(){
				var regType=/^[가-힣+]*$/;
				if (!regType.test(document.getElementById('name').value)){
					alert('이름은 한국말로 정확하게 입력하여주세요.\n 외국인도 한글로 입력해주세요');
					//이름 삭제 20151127
					document.getElementById('name').value="";
				}
			}
			function noSpaceForm(obj) { // 공백사용못하게
			    var str_space = /\s/;  // 공백체크
			    if(str_space.exec(obj.value)) { //공백 체크
			        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
			        obj.focus();
			        obj.value = obj.value.replace(' ',''); // 공백제거
			        return false;
			    }
			 // onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
			}
		</script>
		<style type="text/css">
		/* css 설정 */
		.error {
			color: red;
			face: impact;
			font-size : 2;
		}
		/*20151124 CHJ ADD*/
		table{
		margin-left: 70px;
		}
		header {
			background-color:lightblue;
			color:white;
			text-align:left;
			padding: 10px;
		}
			.error {
			color: red;
			face: impact;
			font-size : 2;
		}

		</style> 
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp" />
		</header>
<!--  error위에 br추가했습니다. -->
		<spring:hasBindErrors name="members" /> 
			<form action="/5bject/member/update_form.do" method="post">
				<table>
					<tr>
						<td colspan="2" align="center"><br><font color="skyblue" face="impact" size="6">Edit your information</font><br></td>
					</tr>
					<tr><td colspan="2" align="center"><font color="skyblue">회원정보수정</font></td></tr>
					
					<tr><td colspan="2"><b>ID</b></td></tr>
					<tr>
						<td>
							<input type="text" name="id"  value="${sessionScope.member.id}" size="25" maxlength="25"  disabled="disabled" />
							<input type="hidden" name="id"  value="${sessionScope.member.id}" size="25" maxlength="25" />
							<br>
							<span class="error"><form:errors path = "members.id" /></span>
						</td>
						<td></td>
					</tr>
					
					<tr><td colspan="2"><b>Password</b></td></tr>
					<tr>
						<td>
							<input type="text" name="password" placeholder="비밀번호를 입력하세요." size="25" maxlength="25" autofocus="autofocus" required="required" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
							<br>
							<span class="error"><form:errors path="members.password" delimiter=" - " /></span>
						</td>
						<td></td>
					</tr>
					
					<tr><td colspan="2"><b>Name</b></td></tr>
					<tr>
						<td colspan="2">
							<input type="text" name="name" id="name" value="${sessionScope.member.name }" placeholder="이름을 입력하세요" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this); checkKor();" />
							<br>
							<span class="error"><form:errors path = "members.name" delimiter=" - " /></span>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><font color="white">BLANK</font></td>
					</tr>
			
					<tr><td colspan="2"><b>생년월일</b></td></tr>
					<tr>
						<td colspan="2">
							<select name="month">
								<option>선택하세요</option>
								<option ${sessionScope.member.month=='January' ? 'selected=selected':' ' }>January</option>
								<option ${sessionScope.member.month=='Fabruary' ? 'selected=selected':' ' }>Fabruary</option>
								<option ${sessionScope.member.month=='March' ? 'selected=selected':' ' }>March</option>
								<option ${sessionScope.member.month=='April' ? 'selected=selected':' ' }>April</option>
								<option ${sessionScope.member.month=='May' ? 'selected=selected':' ' }>May</option>
								<option ${sessionScope.member.month=='June' ? 'selected=selected':' ' }>June</option>
								<option ${sessionScope.member.month=='July' ? 'selected=selected':' ' }>July</option>
								<option ${sessionScope.member.month=='August' ? 'selected=selected':' ' }>August</option>
								<option ${sessionScope.member.month=='October' ? 'selected=selected':' ' }> October</option>
								<option ${sessionScope.member.month=='November' ? 'selected=selected':' ' }>November</option>
								<option ${sessionScope.member.month=='December' ? 'selected=selected':' ' }>December</option>
							</select>
							<select name="day">
									<c:forEach var="num" begin="0" end="31">
										<option   ${num==sessionScope.member.day? 'selected=selected':' ' }>${ num }</option>
									</c:forEach>
							</select>
						 	<select name="year">
								<c:forEach var="num" begin="1900" end="2015">
										<option  ${num==sessionScope.member.year ? 'selected=selected':' ' }>${ num }</option>
								</c:forEach>
							</select>
						<br>
						<span class="error"><form:errors path="members.day" /></span>
						<span class="error"><form:errors path="members.month" delimiter=" - " /></span>
					</td>
				</tr>
				
				<tr><td colspan="2"><b>이메일</b></td></tr>
				<tr>
					<td colspan="2">
						<input type="text" name=emailId  value="${sessionScope.member.emailId}" onkeyup="noSpaceForm(this); checkEngNum();" onchange="noSpaceForm(this);" placeholder="email을 입력하세요" />@
						<select name="emailAddress">
							<option value="gmail.com" ${sessionScope.member.emailAddress=='gmail.com'? 'selected=selected':''}>gmail.com</option>
							<option value="nate.com"  ${sessionScope.member.emailAddress=='nate.com'? 'selected=selected':''}>nate.com</option>
							<option value="hanmail.net" ${sessionScope.member.emailAddress=='hanmail.net'? 'selected=selected':''}>hanmail.net</option>
							<option value="yahoo.com"  ${sessionScope.member.emailAddress=='yahoo.com'? 'selected=selected':''}>yahoo.com</option>
							<option value="naver.com"  ${sessionScope.member.emailAddress=='naver.com'? 'selected=selected':''}>naver.com</option>
							<option value="hotmail.com"  ${sessionScope.member.emailAddress=='hotmail.com'? 'selected=selected':''}>hotmail.com</option>
							<option value="daum.com"  ${sessionScope.member.emailAddress=='daum.com'? 'selected=selected':''}>daum.com</option>
						</select>
						<br>
						<span class="error"><form:errors path = "members.emailId" delimiter=" - " /></span>
					</td>
				</tr>
				
				<tr><td colspan="2"><b>성별</b></td></tr>
				<tr>
					<td colspan="2">
						<label>male:<input type="radio" name="gender" value="male" ${sessionScope.member.gender=='male'? 'checked=checked':''}/></label>
						<label>female:<input type="radio" name="gender" value="female" ${sessionScope.member.gender=='female'? 'checked=checked':''} /></label>
						<br>
						<span class="error"><form:errors path = "members.gender" delimiter=" - " /></span>
					</td>
				</tr>
				
				<tr><td colspan="2"><b>Phone Number</b> (ex:01012341234)</td></tr>
				<tr>
					<td>
						<input type="text" name="phoneNumber"  value="${sessionScope.member.phoneNumber}" placeholder="핸드폰 번호를 입력하세요" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" size="30" maxlength="11" />
						<br>
						<span class="error"><form:errors path="members.phoneNumber" delimiter=" - " /></span>
					</td>
					<td></td>
				</tr>
				
				<tr><td colspan="2"><input type="submit" value="수정하기" />&nbsp;<input type="button" onclick="page_back();" value="뒤로가기"></td></tr>
			</table>
		</form>

		<footer>
		</footer>
	</body>
</html>