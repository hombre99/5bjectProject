<%@page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function correctPop(){
	opener.location.reload(true);
	self.close();
}
</script>
</head>
<body  onload='resizeTo(correct.width+110, correct.height+135)'>
<a href=""></a>
<img src="/5bject/image/game/correct.jpg"  name="correct"  onclick="correctPop()">
</html>