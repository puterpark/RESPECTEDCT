<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>폼 테스트</title>
<link rel="stylesheet" href="/css/my.css">

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>

<script>
$(function(){
	/* $("#loginbtn").click(function() {
		
		var mid_val = //$("#mid").val();
						$("input:text[name=mid]").val(); //체크박스/라디오 전용
		console.log(mid_val);
					
		var mgubun_val = $("input:radio[name=mgubun]:checked").val();
					   //$("input:radio[name=mgubun]").is(":checked").val();
		if(mgubun_val == null) 
			alert("구분 선택 좀...");
		console.log(mgubun_val);	
		
		var addr_val = $("select[name=addr]").val();
					 //$("#addr option:selected").val();
		console.log(addr_val);
		
		var habit_val = $("input:checkbox[name=habit]:checked").each(function(i, k) {
			console.log(i + ", " + $(this).val());
		});
	}); */
	
	
	var db_mid = "park";
	var db_mgubun = "admin";
	var db_addr = "gyeonggi";
	var db_habit = ["smoke", "sleep"];
	var db_memo = "아르헨티나 룩셈 부르크"
	
	$("input:text[name=mid]").val(db_mid);
	$("input:radio[name=mgubun]:input[value="+db_mgubun+"]").attr("checked", true);
	//$("select[name=addr]").val(db_addr).attr("selected", true);
	$("#addr").val(db_addr).attr("selected", true);
	
	$.each(db_habit, function(i, k){
		$("input:checkbox[name=habit]:input[value="+db_habit[i]+"]").attr("checked", true);
	});
	//$("input:checkbox[name=habit]:input[value="+db_habit+"]").attr("checked", true);
	
	$("textarea[name=memo]").text(db_memo);
	
	
});
</script>


</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
<form name="myform" class="myform">
	<table class="demo-table">
	<tbody>
	<tr>
		<td><input type="text" name="mid" id="mid"></td>
	</tr>
	<tr>
		<td>
		<input type="radio" name="mgubun" value="admin">관리자
		<input type="radio" name="mgubun" value="user">사용자
		</td>
	</tr>
	<tr>
		<td>
		<input type="checkbox" name="habit" value="smoke">흡연
		<input type="checkbox" name="habit" value="drink">음주
		<input type="checkbox" name="habit" value="sleep">수면
		</td>
		
	</tr>
	<tr>
		<td>
		<select name="addr" id="addr">
			<option value="seoul">서울</option>
			<option value="incheon">인천</option>
			<option value="gyeonggi">경기</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>
			<textarea name="memo" id="memo" cols="40" rows="10">남겨라</textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="file" name="mfile">
		</td>
	</tr>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="2">
			<input type="button" value="제출" id="loginbtn">
		</td>
	</tr>
	</tfoot>
	</table>
</form>

</body>
</html>