<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <style>
	table {
          border: 1px solid black;
          border-collapse: collapse;
        }
</style> -->
<link rel="stylesheet" href="/css/my.css">
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>

<script>
	function goPage(prm) {
		if(prm == "UPDATE" && inputForm.mpw.value == "") {
			alert("비밀번호를 입력하세요.");
			inputForm.mpw.focus();
		} else {
			inputForm.ACTIONSTR.value = prm;
			inputForm.submit();
		}
	}
</script>

<script>

$(function(){
	
	var db_mgubun = "${LVL_VO.mgubun}";
	$("input:radio[name=mgubun]:input[value="+db_mgubun+"]").prop("checked", true);
	
	/* if($("#radio_1").val() == "${LVL_VO.mgubun}"){
		$("#radio_1").prop("checked", true);
	} else {
		$("#radio_2").prop("checked", true);
	} */
	
});


</script>
</head>
<body>
<h2>상세페이지</h2>
<%
request.setCharacterEncoding("UTF-8");
%>
<form name="inputForm" action ="/member_url" method="post">
<input type="hidden" name="ACTIONSTR">
<table class="demo-table" border="1" width="500">
		<tbody>
		<tr>
			<td>아이디</td>
			<td>${LVL_VO.mid}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" <%-- value="<%=mvo.getMpw() %>" --%>></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="mname" value="${LVL_VO.mname}"></td>
		</tr>
		<tr>
			<td>구분</td>
			<td>
				<input type="radio" name="mgubun" id="radio_1" value="u" >사용자
				<input type="radio" name="mgubun" id="radio_2" value="a" >관리자
			</td>
		</tr>
		</tbody>
		<%
		//}
		%>
		
		<!--  -->
		<tfoot>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="mseq" value="${LVL_VO.mseq}">
				<!-- onClick="goPage()" 자바스크립트 문법 -->
				<input type="button" onClick="goPage('UPDATE')" value="수정">
				
				<input type="image" onClick="goPage('DELETE')" value="삭제"
				 src="/image/trash.pnpg" width="15" hegith="15">
				
				<!-- <input type="button" onClick="goPage('DELETE')" value="삭제"> -->
				
				
				<input type="reset" value="취소">
			</td>
		</tr>
		</tfoot>
	</table>
	</form>





<a href="/member_url">> 리스트 이동</a>
</body>
</html>