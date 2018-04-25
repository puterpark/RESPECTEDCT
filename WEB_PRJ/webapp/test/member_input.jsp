<%@ 
page language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="java.util.ArrayList"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="{LVL_SESS_MGUBUN} != 'u'}">
	<script>alert('관리자만 접근 가능합니다.')</script>
	<jsp:forward page="/board/board_login.jsp"/>
</c:if>

<title>Insert title here</title>
<!-- <style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	width:500
}
</style> -->
<link rel="stylesheet" href="/css/my.css">
<!-- <script>
	function goPage() {
		if (inputForm.mid.value == "") {
			alert("아이디를 입력하세요.");
			inputForm.mid.focus();
		} else if (inputForm.mpw.value == "") {
			alert("비밀번호를 입력하세요.");
			inputForm.mpw.focus();
		} else {
			inputForm.submit();

		}
	}
	
</script> -->
<script type="text/javascript" src="/js/input.js"></script>

</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

%>
<h2>회원가입</h2>
<form name="inputForm" action="/member_url" method="post">
<input type="hidden" name="ACTIONSTR" value="INSERT">
	<table class="demo-table" border="1">
	<tbody>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="mname"></td>
		</tr>
		<tr>
			<td>구분</td>
			<td>
				<input type="radio" name="mgubun" value="u">사용자
				<input type="radio" name="mgubun" value="a">관리자
			</td>
		</tr>
	
		<!-- 추가사항 -->
		
		<tr>
			<td>추가1</td>
			<td>
				<select name="addr">
					<option value="seoul">서울</option>
					<option value="incheon">인천</option>
					<option value="gyeonggi">경기</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>추가2</td>
			<td>
				<input type="checkbox" name="habit" value="m">등산
				<input type="checkbox" name="habit" value="b">독서
			</td>
		</tr>
		
		<tr>
			<td>추가3</td>
			<td>
				<textarea name="memo" rows="5" cols="50">
				기본값 value="" 아님.. 주의!
				</textarea>
			</td>
		</tr>
	</tbody>
		<!--  -->
	<tfoot>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="secret" value="007">
				<!-- onClick="goPage()" 자바스크립트 문법 -->
				<input type="button" onClick="goPage()" value="가입-일반버튼">
				<input type="submit" onClick="goPage()" value="가입-서브밋버튼">
				<input type="image" src="/images/add.png" width="15">
				<input type="reset" value="취소">
			</td>
		</tr>
	</tfoot>
	</table>
	</form>
</body>
</html>