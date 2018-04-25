<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList"
import="com.kosmo.member.MemberVO"
import="com.kosmo.member.MemberCrud"
    %>
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
</head>
<body>
<h2>상세페이지</h2>
<%
request.setCharacterEncoding("UTF-8");

//ArrayList<MemberVO> list = new ArrayList<MemberVO>();
//MemberCrud mc = new MemberCrud();
//MemberVO mvo = new MemberVO();

//String mseq = request.getParameter("mseq");

//list = mc.memberDetail(Integer.parseInt(mseq));
//mvo = mc.memberSelect(Integer.parseInt(mseq));

MemberVO mvo = (MemberVO)request.getAttribute("LVL_VO");

%>
<form name="inputForm" action ="/member_url" method="post">
<input type="hidden" name="ACTIONSTR">
<table class="demo-table" border="1" width="500">
		<%
		//for (int i = 0; i < list.size(); i++) {
		//	mvo = list.get(i);
		
		%>
		<tbody>
		<tr>
			<td>아이디</td>
			<td><%=mvo.getMid() %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" <%-- value="<%=mvo.getMpw() %>" --%>></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="mname" value="<%=mvo.getMname() %>"></td>
		</tr>
		<tr>
			<td>구분</td>
			<td>
				<input type="radio" name="mgubun" value="u" <%= (mvo.getMgubun().equals("u"))?"checked":"" %>>사용자
				<%-- <%= (mvo.getMgubun().equals("u"))?"checked":"" %> --%>
				<input type="radio" name="mgubun" value="a" <%if(mvo.getMgubun().equals("a")) { %> checked <%}%>>관리자
				<%-- <%= (mvo.getMgubun().equals("a"))?"checked":"" %> --%>
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
				<input type="hidden" name="mseq" value="<%=mvo.getMseq() %>">
				<!-- onClick="goPage()" 자바스크립트 문법 -->
				<input type="button" onClick="goPage('UPDATE')" value="수정">
				<input type="button" onClick="goPage('DELETE')" value="삭제">
				
				
				<input type="reset" value="취소">
			</td>
		</tr>
		</tfoot>
	</table>
	</form>





<a href="/member_url">> 리스트 이동</a>
</body>
</html>