<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSON 테스트</title>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script>
function data() {
	var arr = ["a", "b", "c"];
	/* alert(arr.length + ", " + arr[0]); */
	
	var jsonVal = {"mseq":"1", "mid":"kim"};
	/* alert(jsonVal); */
	
	var jsonArrayVal = {"gisu":"34", "info":[{"mseq":"1", "mid":"kim"},
											 {"mseq":"2", "mid":"park"},
											 {"mseq":"3", "mid":"lee"}]};
	
	var arrJsonVal = [{"mseq":"1", "mid":"kim"},
					{"mseq":"2", "mid":"park"},
					{"mseq":"3", "mid":"lee"}]
	
	alert(jsonArrayVal.info[1].mid);
	
	window.console.log("ddd");
	
}


function ajaxCall() {
	var idVal = document.getElementById("mid").value;  
	var pwVal = document.getElementById("mpw").value;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
			
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("resDiv").innerHTML = 
				this.responseText + "님 환영합니다.";
		} 
	};
	xhttp.open("GET", "/member_url?ACTIONSTR=AJAX&mid="+idVal+"&mpw="+pwVal, true);
	xhttp.send(); //send에 주소를 넣으면 post 방식
}


$(function(){
	$("#loginbtn").click(function() {
		
		var dd = $(".myform").serialize(); //mid=val && mpw=val
		
		$.ajax({
			url:"/member_url?ACTIONSTR=AJAX",
			data: dd,
			type:"get",
			
			success:function(result) {
				console.log(result);
				$("#resDiv").html(result + "님 환영합니다.");
			}
		});
	})
});
	
	
</script>
</head>
<body>

<!-- <input type="button" value="JSON" onClick="data()" width="500" height="500"> -->

<%
int a = 20;
request.setCharacterEncoding("UTF-8"); //한글화 처리
%>
<form name="myfrom" class="myform">
<input type="hidden" name="<%=a %>">
<input type="text" name="mid" id="mid" value="puter"><br>
<input type="password" name="mpw" id="mpw" value="r2d2">
<input type="button" value="LOGIN" onClick="ajaxCall()">
<input type="button" value="LOGIN jQuery" id="loginbtn">
<div id="resDiv">로그인이 필요한 서비스입니다.</div>
</form>
</body>
</html>