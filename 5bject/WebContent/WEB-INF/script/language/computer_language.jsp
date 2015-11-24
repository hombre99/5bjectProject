<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8">
<title>Sign Up form</title>
<script type="text/javascript">
   
</script>
<style type="text/css">
#wrap {
   width: 1000px;
   height: 820px;
   margin-left: 50px;
   background: lightgrey;
}

#header {
   width: 900px;
   height: 130px;
   margin-left: 50px;w
   margin-bottom: 20px;
   background: lightblue;
}

#middle {
   width: 1000px;
   float: left;
   background: palegoldenrod;
}

#sidebar {
   width: 200px;
   height: 500px;
   text-align: center;
   float:left;
   margin-left: 40px;
   margin-right: 20px;
   background: beige;
}

#content {
   width: 700px;
   height: 500px;
   float: left;
   background: beige;
}

#footer {
   width: 900px;
   height: 100px;
   margin-left: 50px;
   margin-top: 10px;
   background: lightblue;
   color: white;
   float: left;
   text-align: center;
}
</style>
</head>
<body>

   <div id="wrap">
      <jsp:include page="/WEB-INF/script/layout/header.jsp" />
      <div id="header">
         <img src="/5bject/image/member/programming.jpg">
      </div>
            
      <div id="middle">
         <div id="sidebar">
            <form action="/5bject/language/select_language.do" method="GET">
               <table>
                  <tr>
                     <td><b>언어를 선택하여 주세요</b><br> 
                     <select name="name">
                           <option value="language">언어선택</option>
                           <option value="java">Java</option>
                           <option value="javascript">Javascript</option>
                           <option value="c">C언어</option>
                           <option value="c++">C++</option>
                           <option value ="c#">C#</option>
                           <option value=php>PHP</option>
                           <option value="perl">Perl</option>
                           <option value="scala">Scala</option>
                     </select></td>
                  </tr>
                  <tr><td><input type="submit" value="선택"></td></tr>                  
               </table>
            </form>   
         </div>
               
         <div id="content">
            <c:choose>
               <c:when test="${sessionScope.name==null}">
                  <img src="/5bject/image/member/click.jpg">
               </c:when>
               <c:otherwise>
                  <table>
                     <tr><td colspan="2" align ="center">프로그래밍 언어란 컴퓨터와의 대화에 사용되는 일종의 대화수단 입니다.</td></tr>
                      <tr><td colspan="2" align="center">선택한<b>${sessionScope.language.name}</b> 프로그래밍 언어에 대해 소개해 드리겠습니다.<p></td></tr>
                      <tr><td><b>선택한 언어의 정의:</b></td></tr>
                      <tr><td>${sessionScope.language.definition}<p></td></tr>
                      <tr><td><b>언어와 관련된 정보:</b></td></tr>
                      <tr><td> ${sessionScope.language.information}<p></td></tr>
                     <tr><td colspan="2"><b>${sessionScope.name} 언어가 사용되는 분야에는 무엇이 있을까요?</b><br></td></tr>
                     <tr><td colspan="2"> ${sessionScope.language.detail}</td></tr>
                   </table>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
      
      <div id="footer">
         <jsp:include page="/WEB-INF/script/layout/footer.jsp" />
      </div>
   </div>
</body>
</html>