<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery Test</title>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/test.js"></script>




<script>
$(function(){
	$("#title").css("color", "green");
});
</script>

<script>

</script>
</head>
<body>
<h1 id="title">jQuery</h1>
<div id="myDiv">123</div><br>

<form class="myform">
ID : <input type="text" name="mid" id="mid"><br>
PW : <input type="password" name="mpw" id="mpw"><br>
<input type="submit" value="전송"><br><br>

<input type="button" onClick="myFunc()" value="javascript Call">	
<input id="mybtn" type="button" value="jQuery Call">
</form>

</body>
</html>