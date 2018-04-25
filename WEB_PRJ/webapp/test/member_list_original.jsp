<%@ 
page language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="java.util.ArrayList"
import="com.kosmo.member.MemberVO"
import="com.kosmo.member.MemberCrud"
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
	<!-- 한글한글 -->   
	<%
		//스크립크릿
		/* for (int i = 0; i < 10; i++) {
			System.out.println(i);
			out.println(i + "<br>");
		} */
		request.setCharacterEncoding("UTF-8");
		//MemberVO vo = new MemberVO();
		//MemberCrud m = new MemberCrud();
		//ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("LVL_LIST");
		MemberVO vo = (MemberVO)request.getAttribute("LVL_VO");
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
		<%
		
		
		for(int i = 0; i < list.size(); i++) {
			vo = list.get(i);
		 %>
	<tbody>
		<tr>
			<!-- hyper link 
			
			get : 전부다
			post : form method = post
			-->
			<td>
				<a href="/member_url?ACTIONSTR=DETAIL&mseq=<%=vo.getMseq()%>">
					<%=vo.getMseq() %>
				</a>
			</td>
			<td><%=vo.getMid() %></td>
			<td><%=vo.getMname() %></td>
			<td><%=vo.getRegdate() %></td>
		</tr>
	</tbody>
		<%
		} //for문 끝
		 %>
	</table>
	<br>
	<a href="/test/member_input.jsp">가입페이지 이동</a>















</body>
</html>