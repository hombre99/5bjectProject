<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   function page_back(){
      history.go(-1);
   }
</script>
<style type="text/css">
    header{
           background-color: lightblue;
           color: white;
           text-align: left;
           padding: 5px;
          }
#memId{
   margin-left: 70px;
}
</style>
</head>
<body>

   <header>
      <jsp:include page="/WEB-INF/script/layout/header.jsp" />
   </header>
<div id ="memId">
    <c:choose>
            <c:when test="${ (requestScope.memId != null) }">
               <img src="/5bject/image/member/successId.jpg" />
               <br>
               <font color="lightblue" size="3">찾으신 고객님의 아이디는 <c:forEach items="${requestScope.memId }" var="list"> ${list} </c:forEach> 입니다.</font>
            </c:when>
            <c:otherwise>
               <br>
               <font color="lightblue" size="3">고객님의 이메일주소와 <br>전화번호를 제대로 입력해 주세요.</font>
               <br><input type="button" onclick="page_back();" value="뒤로가기">
            </c:otherwise>
     </c:choose>

  </div>
</body>
</html>

