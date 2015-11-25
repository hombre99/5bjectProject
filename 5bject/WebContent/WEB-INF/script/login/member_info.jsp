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
      $(document).ready(function() {
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
         header{
            background-color: lightblue;
            color: white;
            text-align: left;
            padding: 5px;
         }
         table{
            margin-left: 70px;
            font-family: HY나무M;
         }
      </style>
</head>
<body>
<!-- table로 처리 -->
   <!-- header include로 처리 -->
   <header>
      <jsp:include page="/WEB-INF/script/layout/header.jsp" />
   </header>
      <table>
         <tr><td colspan="2" align="center"><h2>${memberInfo.id}의 회원정보</h2>
         <tr><td>ID </td><td> ${memberInfo.id}<br></td></tr>
         <tr><td>PASSWORD </td><td> ${memberInfo.password }<br></td></tr>
         <tr><td>NAME </td><td> ${memberInfo.name }<br></td></tr>
         <tr><td>BIRTHDAY </td><td> ${memberInfo.month }  ${memberInfo.day } ${memberInfo.year }<br></td></tr>
         <tr><td>GENDER </td><td> ${memberInfo.gender }<br></td></tr>
         <tr><td> EMAIL </td><td> ${memberInfo.emailId }@${memberInfo.emailAddress }<br></td></tr>
         <tr><td>PHONENUMBER </td><td> 0${memberInfo.phoneNumber}</td></tr>
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
</body>
</html>