<%@page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<table>
<form name=writeform method=post action="write_success.do">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('/5bject/image/board/table_mid.gif') repeat-x; text-align:center;">
      <td width="6"><img src="/5bject/image/board/table_left.gif" width="6" height="30" /></td>
      <td>글쓰기</td>
      <td width="6"><img src="/5bject/image/board/table_right.gif" width="6" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="100" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>

     <tr height="2" bgcolor="#dddddd"><td colspan="5"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="100" rows="20"></textarea></td>
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
  </form>
 </table>
</head>
<body>

</body>
</html>