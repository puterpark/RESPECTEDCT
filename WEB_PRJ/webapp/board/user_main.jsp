<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script>

$(function() {
	$("#logoutBtn").click(function(){
		//TODO
		$(".myForm").submit();
	});
});

</script>
</head>
<body>

${LVL_SESS_MNAME}님... 환영합니다.<br>


<a href="/board/mypage.jsp">[마이페이지]</a>
<br>
<br>

<form class="myForm" method="get" action="/login">
	<input type="button" id="logoutBtn" value="로그아웃">
</form>
<br>

<form method="get" action="/login">
	<input type="submit" value="로그아웃">
</form>

</body>
</html>