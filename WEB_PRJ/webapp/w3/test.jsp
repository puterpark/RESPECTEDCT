<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function pageOpen() {
	window.open("/test/member_input.jsp", "test", "width=300, height=300" )
	document.getElementById("myFont").style.fontSize = "25px"
}

function initFunc() {
	document.getElementById("myDiv").innerHTML =
		"<table border=1><tr><td>ddd</td></tr></table>"
}
</script>
</head>
<body onLoad="initFunc()">

<div id="myDiv"></div>

<font id="myFont" color=red>빨간 글씨</font>
<p><a href="#" onClick="pageOpen()">회원 목록 보기</a></p>

<p>
	<a href="/test/member_input.jsp" target="myFrame">회원 가입 보기</a>
	
</p>

<iframe name="myFrame" src="/member_url" width=800 height=600></iframe>


</body>
</html>