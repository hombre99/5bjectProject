<%@page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">  // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.writeform; 
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>
</head>
<body>
<form name="writeform" method="post" action="/5bject/board/update_success.do">
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
      <td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
      <td>글 수정 하기</td>
      <td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="100" maxlength="100" value="${requestScope.board.title }"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
	<tr>
      <td>&nbsp;</td>
      <td align="center">작성자</td>
      <td><input type="text" readonly="readonly"  name="id" value="${sessionScope.member.id}" size="20"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">글번호</td>
      <td><input type="number" readonly="readonly"  name="writeNo" value='${sessionScope.contectBoard.writeNo}' size="20"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><input name="content" value="${requestScope.board.content}" size="20" style="width:100%; height:360px"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
     <tr height="2" bgcolor="#82B5DF"><td colspan="5"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록" OnClick="javascript:writeCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
  </form>
</body>
</html>