<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Sign Up form</title>

<script type="text/javascript" src="/5bject/jquery.do">	</script>
<script type="text/javascript">
	$(document).ready(function(){	
		$("#regForm").on("submit",function registerFormCheck(){
			if(idDuplicated){
				alert("사용할 수 없는 ID입니다.");
				return false;
			}
			return true;
		});				
		$("#id").on("change", function(){
			$.ajax({
				url:"/5bject/member/idDuplicatedCheck.do",
				type: "POST",
				data: {id:$("#id").val()},
				dataType: "text",
				//중복처리				
				success:function(txt){
					if(txt=='true'){
						$("#idErrorMessage").text("이미 사용중인 ID입니다.");
						idDuplicated=true;
					}else{
						idDuplicated=false;
					}
				}
			});
		});
	});
	</script>
	<script type="text/javascript">	
	//아이디 영문과 숫자처리 20151126
	function checkEngNum(obj){
		var regType =/^[a-z0-9+]*$/;
		if (!regType.test(obj.value)){
			alert('영문과 숫자만 입력가능합니다'); 
			obj.focus();
			obj.value="";
		}
	};	
	//이름에 한글만 처리하도록 지정
	function checkKor(){
		var regType=/^[가-힣+]*$/;
		if (!regType.test(document.getElementById('name').value)){
			alert('이름은 한국말로 정확하게 입력하여주세요.\n 외국인도 한글로 입력해주세요'); 
			//이름 삭제 20151127
			document.getElementById('name').value="";
		}
	};
	//공백을 사용하지 못하게 지정
	function noSpaceForm(obj) { // 공백사용못하게
	    var str_space = /\s/;  // 공백체크
	    if(str_space.exec(obj.value)) { //공백 체크
	        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
	        obj.focus();
	        obj.value = obj.value.replace(' ',''); // 공백제거
	    }
	};
</script>
<!--  css 설정  -->
<style type="text/css">
	table .error {
		color: red;
		face: impact;
		font-size: 1;
	}
	
	header {
		background-color: lightblue;
		color: white;
		text-align: left;
		padding: 10px;
	}
	
	table{
		margin-top: 20px;
		margin-left: 70px;
	}
	
	#subject{
		font-size: 16px;
		font-weight: bold;
	}
	input {
	  background-color:transparent;
	  border-width:1px;
	  border-color:skyblue;
	  border-style:solid; 
	  height: 20px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/script/layout/header.jsp" />
	</header>
	<spring:hasBindErrors name="members" />
	<!--  ADD id ="regForm 20151125-->
	<form action="/5bject/member/register_form_validate.do" method="post" id="regForm">
		<table>
			<tr><td colspan="2"> <img src="/5bject/image/member/signup_form.jpg"></td></tr>				
			<tr>
				<td colspan="2" id="subject"><b>아이디</b></td>
			</tr>
			<tr>		
				<td>
					<input type="text" name="id" id="id" value="${requestScope.members.id}"  placeholder="사용할 아이디를 입력하세요."  autofocus="autofocus" size="30" maxlength="25"  onkeyup="noSpaceForm(this); checkEngNum(this);" onchange="noSpaceForm(this); " />
					<br><span class="error" id="idErrorMessage"><form:errors path="members.id" /></span>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" id="subject"><b>비밀번호</b></td>
			</tr>
			<tr>
				<td>
					<input type="password" name="password" value="${ requestScope.members.password }" placeholder="사용할 비밀번호를 입력하세요." size="30" maxlength="25"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" />
					 <br> <span class="error"><form:errors path="members.password" delimiter=" - " /></span>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" id="subject"><b>이름</b></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="name" id="name" value="${requestScope.members.name}" placeholder="본인의 이름을 입력하세요" size="30"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this); checkKor();" /> 
					<br> <span class="error"><form:errors path="members.name" delimiter=" - " /></span></td>
			</tr>
			<tr>
				<td colspan="2"><font color="white">BLANK</font></td>
			</tr>
			<tr>
				<td colspan="2" id="subject"><br><b>생년월일</b></td>
			</tr>
			<tr>
				<td colspan="2"><select name="month">
						<option>선택하세요</option>
						<option  ${requestScope.members.month=='January' ? 'selected=selected':' ' }>January</option>
						<option  ${requestScope.members.month=='Fabruary' ? 'selected=selected':' ' }>Fabruary</option>
						<option  ${requestScope.members.month=='March' ? 'selected=selected':' ' }>March</option>
						<option  ${requestScope.members.month=='April' ? 'selected=selected':' ' }>April</option>
						<option  ${requestScope.members.month=='May' ? 'selected=selected':' ' }>May</option>
						<option  ${requestScope.members.month=='June' ? 'selected=selected':' ' }>June</option>
						<option  ${requestScope.members.month=='July' ? 'selected=selected':' ' }>July</option>
						<option  ${requestScope.members.month=='August' ? 'selected=selected':' ' }>August</option>
						<option  ${requestScope.members.month=='October' ? 'selected=selected':' ' }>October</option>
						<option  ${requestScope.members.month=='November' ? 'selected=selected':' ' }>November</option>
						<option  ${requestScope.members.month=='December' ? 'selected=selected':' ' }>December</option>
				</select> <select name="day">
						<c:forEach var="num" begin="0" end="31">
							<option ${num==requestScope.members.day? 'selected=selected':' ' }>${ num }</option>
						</c:forEach>
				</select> <select name="year">
						<c:forEach var="num" begin="1900" end="2015">
							<option ${num==requestScope.members.day? 'selected=selected':' ' }>${ num }</option>
						</c:forEach>
				</select> 
					<br> 
					<span class="error"><form:errors path="members.day" /></span> 
					<span class="error"><form:errors path="members.month" /></span></td>
			</tr>
			<tr>
				<td colspan="2" id="subject"><b>이메일</b></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="text" name=emailId value="${requestScope.members.emailId}" placeholder="email을 입력하세요"  onkeyup="noSpaceForm(this); checkEngNum(this);" onchange="noSpaceForm(this);" />
					<select name="emailAddress">
						<option value="선택하세요">선택하세요</option>
						<option value="gmail.com" ${requestScope.members.emailAddress=='gmail.com'? 'selected=selected':''}>gmail.com</option>
						<option value="nate.com" ${requestScope.members.emailAddress=='nate.com'? 'selected=selected':''}>nate.com</option>
						<option value="hanmail.net" ${requestScope.members.emailAddress=='hanmail.net'? 'selected=selected':''}>hanmail.net</option>
						<option value="yahoo.com" ${requestScope.members.emailAddress=='yahoo.com'? 'selected=selected':''}>yahoo.com</option>
						<option value="naver.com" ${requestScope.members.emailAddress=='naver.com'? 'selected=selected':''}>naver.com</option>
						<option value="hotmail.com" ${requestScope.members.emailAddress=='hotmail.com'? 'selected=selected':''}>hotmail.com</option>
						<option value="daum.com" ${requestScope.members.emailAddress=='daum.com'? 'selected=selected':''}>daum.com</option>
				</select>
						 <br> <span class="error"><form:errors path="members.emailId" delimiter=" - " /></span></td>
			<tr>
				<td colspan="2" id="subject"><br><b>성별</b></td>
			</tr>
			<tr>
			<!-- value="male" female 되어있는것 삭제 20151126 CHJ -->
				<td colspan="2">
						<label>male:<input type="radio" name="gender" value="male" ${requestScope.members.gender =='male'? 'checked=checked':' '}/></label>
						<label>female:<input type="radio" name="gender" value="female" ${requestScope.members.gender=='female'? 'checked=checked':' '} /></label>
						 <br><span class="error"><form:errors path="members.gender" /></span></td>
			</tr>
			<tr>
				<td colspan="2" id="subject"><b>Phone Number</b> (ex:01012341234)</td>
			</tr>
			<tr>
				<td>
					<!--  phone size ="30"으로  --> 
					<input type="text" name="phoneNumber" value="${requestScope.members.phoneNumber}" placeholder="핸드폰 번호를 입력하세요" size="30" maxlength="11" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" /> <br>
					<span class="error"><form:errors path="members.phoneNumber" /></span>
				</td>
				<td></td>
			</tr>
			<tr>
				<td><br><input type="submit" value="회원가입"></td>
				<td></td>
			</tr>
		</table>
		<p>
	</form>
	</body>
</html>