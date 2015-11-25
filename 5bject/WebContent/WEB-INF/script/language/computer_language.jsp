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
   height: 930px;
   margin-left: 50px;
   background: lightgrey;
}

#header {
   width: 900px;
   height: 130px;
   margin-left: 50px;
   margin-bottom: 20px;
   background: lightblue;
}

#middle{
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
  /*추가하는 부분 20151124 화요일 CHJ*/
#middle2 {
   width: 1000px;
   margin-top: 10px;
   margin-botton: 10px;
   height: 100px;
   float: left;
   background: palegoldenrod;
}
  /*추가하는 부분 20151124 화요일 CHJ*/
#content2 {
   width: 920px;
   margin-right: 20px;
   margin-left: 40px;
   height: 100px;
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
      <!-- 추가하는 부분 20151124 화요일 CHJ -->
      <div id="middle2">
      	<div id="content2">
	      	<table>
	      		<tr>
		      		<td colspan="2"><font size="3"><b>알고리즘이란 무엇일까요?</b></font></td>
		      		<td> 컴퓨터로 계산을 할때의 계산방법을 말하지만 넓게 생각해보면 무엇이든 어떤 행동을 할때에 어떻게 할것인가에 대한 방법을 알고리즘이라고 생각하면 됩니다. 
		      		알고리즘을 배우는 이유는 같은 행동을 할때라도 어떤 방법으로 하느냐에 따라 조금 더 쉽고 빠르게 할 수 있기 때문입니다.</td>
	      		</tr>
	      	</table>
      	</div>
      </div>
      <div id="footer">
         <jsp:include page="/WEB-INF/script/layout/footer.jsp" />
      </div>
   </div>
</body>
</html>