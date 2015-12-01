<%@page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function incorrectPop(){

	parent.window.close();
}
</script>
</head>
<body onload='resizeTo(incorrect.width+110, incorrect.height+135)'>
<img src="/5bject/image/game/incorrect.jpg" name=incorrect onclick="incorrectPop()">
</body>
</html>