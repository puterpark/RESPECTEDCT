<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% /* String mseq ="10";  */ %>
	<c:set value="10" var="mseq"/>아이디 : ${mseq}
	<% /* System.out.print(mseq);  */ %>
	<c:out value="${mseq}"/>
	<hr>
	
	<c:remove var="mseq"/>아이디 : ${mseq}
	<hr>
	
	==JSTL IF문 테스트==<br>
	<% /* if(mseq == null) {}  */ %>
	<c:if test="${empty mseq}">
	JSTL IF문 성공!!
	</c:if> 
	<hr>
	
	<% /* if(mseq == null && mid=="park") {}  */ %>
	<c:set value="park" var="mid"/>아이디 : ${mid}
	<c:if test="${empty mseq && mid=='park'}"/>
	JSTL IF문 성공
	<hr>
	
	<% /* if(mseq == null) {} else if(mid == "kim") {} else {}  */ %>
	==choose/when==<br>
	<c:choose>
       <c:when test="${mid == 'park'}">
            박씨 [choose문 값]
       </c:when>
       <c:when test="${empty mseq}">
           mseq null [choose문 값]
       </c:when>
       <c:otherwise>
           조건불일치 [choose문 값]
       </c:otherwise>
   </c:choose>
   <hr>
   
   ==for문==<br>
   	<% /* for(int i=1; i<=10; i++ {out.println(i);}) */ %>
   	<c:forEach var="i" begin="1" end="10" step ="3" >
		출력 : ${i} <br>
	</c:forEach>
	<hr>
	
	
	
	
	
	
	
</body>
</html>
