<%@ 
page language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style>
table {
          border: 1px solid black;
          border-collapse: collapse;
        }
th {
	background: #cccccc;
}
</style> -->
<link rel="stylesheet" href="/css/my.css">
<script></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
get방식테스트 : <a href="/WEB_PRJ/member_url">get</a>
<form action="/WEB_PRJ/member_url" method="post">
	post방식테스트 : <input type="submit" value="서블릿으로!">
	<hr>
	<h2>회원 목록</h2>
</form>
	<table class="demo-table" border="1" width="500">
	<thead>
		<tr>
			<th>MSEQ</th>
			<th>MID</th>
			<th>MNAME</th>
			<th>RDATE</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${LVL_LIST}" var="vo">
		<tr>
			<td>
				<a href="/member_url?ACTIONSTR=DETAIL&mseq=${vo.mseq}">
					${vo.mseq}
				</a>
			</td>
			<td>${vo.mid}</td>
			<td>${vo.mname}</td>
			<td>${vo.regdate}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	${LVL_PAGING}
	<br><br>
	<a href="/test/member_input.jsp">가입페이지 이동</a>















</body>
</html>