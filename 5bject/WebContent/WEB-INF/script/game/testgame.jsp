<%@page contentType="text/html;charset=UTF-8"%>
<style type="text/css">
#body {
	background: #f8f8ff;
}

#dva {
	margin-left: -1px;
	width: 100%;
	height: 20px;
	text-align: center;
	padding: 13px;
	background: #f8f8ff;
}

#dvb {
	width: 100%;
	height: 570px;
	text-align: center;
	padding-top: 65px;
	background: white;
	position: absolute;
}

/*
			#dvc {
				float: left;
				margin: 0px;
				width: 80%;
				height: 150px;
				border-top: 1px solid gray;
				border-bottom: 1px solid gray;
				border-left: 1px solid gray;
				border-right: 1px solid gray;
				text-align: center;
				padding-top: 65px;
				background: rgb(0,0,230)
	 			position: absolute;
				left: 21%;
			}
			*/
#dvd {
	width: 100%;
	height: 100px;
	text-align: center;
	padding: 12px;
	background: #f8f8ff;
	position: relative;
	top: 600px;
	clear: both;
}

#dve {
	float: left;
	margin: 0px;
	width: 60%;
	height: 450px;
	text-align: center;
	padding-top: 65px;
	padding-left: 150px;
	background: white;
	position: absolute;
	left: 0%;
}

#dvf {
	float: left;
	margin: 0px;
	width: 40%;
	height: 450px;
	text-align: center;
	padding-top: 65px;
	background: white;
	position: absolute;
	left: 60%;
}

#dvg {
	margin-top: 10px;
	text-align: center;
	padding-top: 65px;
}

#td2 {
	border: 1px solid black;
	padding: 0px;
	height: 200px;
	width: 300px;
	position: relative;
	text-align: center;
}

#td3 {
	border: 1px solid black;
	padding: 0px;
	height: 130px;
	width: 170px;
	text-align: center;
}

#td4 {
	border: 1px solid black;
	padding: 0px;
	height: 100px;
	width: 150px;
	position: relative;
	text-align: center;
}

table {
	border-collapse: collapse;
}
</style>
<script type="text/javascript" src="/5bject/jquery.do"></script>
<script type="text/javascript" src="/5bject/game/game1js.do"></script>
<!--
<body id="body">
	<DIV ID="dva">Top</DIV>
-->
	<div id="dvb">
		<div id="dve">
			<table id="gameTable">
			</table>
		</div>

		<div id="dvf">
			<div id="question"></div>

			<!-- 선택지 div -->
			<div id="dvg"></div>
			<div id="dvg">
				<input type="button" value="제출" id="button">
			</div>
		</div>
	</div>

<!--
	<DIV ID="dvd">Bottom</DIV>
</body>
-->