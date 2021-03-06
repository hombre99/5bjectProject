
<!-- 20151125 ADD 추가 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Member Info</title>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript">
	var id = '${ sessionScope.member.id }';
</script>
<script type="text/javascript">
   $(document).ready(function() {
	   
	   if ( id != "objectclass" ) {
			alert("관리자 페이지입니다.");
			history.go(-1);
		}
	   
 	  $("#close").on("click",function(){
 		  location.replace('/5bject/member/memberList.do');
		});
 	  
 	  $("#delete").on("click",function(){
 		  if(confirm("정말 삭제하시겠습니까?")){
		location.replace('/5bject/member/memberRemove.do?id=${memberInfo.id}');
			}
		});
 	  $("#update").on("click", function() {
		window.open('/5bject/member/memberUpdate.do','ok', 'width=500, height=700,toolbar=0,location=0,status=0,menubar=0,resizable=0');
		});
   });
</script>
      <!-- css header, table 처리 -->
      <style type="text/css">
       	 table tr td.main{
      	 	font-weight: bold;
      	 }
      </style>
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/header_footer.css" />
		<link rel="stylesheet" type="text/css" href="/5bject/stylesheet/find_info.css" />
</head>

<body>
<c:if test="${ sessionScope.member.id == 'objectclass' }">
<!-- table로 처리 -->
   <!-- header include로 처리 -->
   <header>
      <jsp:include page="/WEB-INF/script/layout/header_popup.jsp" />
   </header>
      <table>
      <!--***님의 회원정보 -->
         <tr><td colspan="2" align="center"><h2><font color="lightblue">${sessionScope.memberInfo.id}의 회원정보</font></h2></td></tr>
     	 <tr><td class="main">Id </td><td> ${sessionScope.memberInfo.id}<br></td></tr>
         <tr><td class="main">Name </td><td> ${sessionScope.memberInfo.name }<br></td></tr>
         <tr><td class="main">Birthday </td><td>${sessionScope.memberInfo.year }년 ${sessionScope.memberInfo.month }월  ${sessionScope.memberInfo.day }일<br></td></tr>
         <tr><td class="main">Gender </td><td> ${sessionScope.memberInfo.gender }<br></td></tr>
         <tr><td class="main"> Email </td><td> ${sessionScope.memberInfo.emailId }@${sessionScope.memberInfo.emailAddress }<br></td></tr>
         <tr><td class="main">Phone-number </td><td> ${sessionScope.memberInfo.phoneNumber}</td></tr>
         <tr><td colspan="2"></td></tr>
         <tr>
            <td colspan="2">
              
               <input type="button" value="회원정보수정" id="update">
               <input type="button" value="회원삭제" id="delete">
               <input type="button"  value="회원목록" id="close">
            </td>
         </tr>
      </table>         
   <footer>
   </footer>
   </c:if>
</body>
</html>