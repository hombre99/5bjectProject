<%@page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<style type="text/css">
			header {
				background-color: lightblue;
				color: white;
				text-align: left;
				padding: 5px;
			}
			
			footer {
				background-color: lightblue;
				color: white;
				height: 100px;
				clear: both;
				text-align: center;
			}
			
			table{
			margin-left: 250px;
			text-align: center;
			}
			#boardDiv{
			height: 800px;
			}
			</style>
</head>
<body>
<header>
			<jsp:include page="/WEB-INF/script/layout/header.jsp"/>
</header>
<div id="boardDiv">
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
      <td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
      <td align="center"><b>${sessionScope.contectBoard.title}</b></td>      
      <td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
     </tr>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
      <td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
      <td align="left">글쓴이 : ${sessionScope.contectBoard.id }</td>
      <td align="center">등록일 : ${sessionScope.contectBoard.date}</td>
      <td align="right">조회 수 : ${sessionScope.contectBoard.hit}</td>
      <td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>

     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      
      <td><textarea readonly="readonly" name="memo" cols="100" rows="20">${sessionScope.contectBoard.content}</textarea></td>
      <td>&nbsp;</td>
     </tr>
<!--      <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
     <tr height="2" bgcolor="#82B5DF"><td colspan="5"></td></tr> -->
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="수정" click="/WEB-INF/script/board/update.jsp">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</div>
		<footer>		
			<jsp:include page="/WEB-INF/script/layout/footer.jsp" />
		</footer>
</body>
</html>