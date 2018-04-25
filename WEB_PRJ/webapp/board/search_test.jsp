<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script>

$(function() {
	
	function convertArrayToJson(formArray) {
		var returnArray = {};
		for(var i = 0; i < formArray.length; i++) {
			returnArray[formArray[i]['name']] = formArray[i]['value'];
		}
		return returnArray;
	}
	
	$("#searchStr").keyup(function(){
		//TODO
		//alert("D");
		
		//var data = $(".searchForm").serialize(); //mid=val && mpw=val
		//alert(data);
		
		var jsonObjectData = {"searchGubun":$("#searchGubun").val(), "searchStr":$("#searchStr").val()};
		console.log(jsonObjectData);
		
		$.ajax({
			url:"/search",
			dataType: "json",
			data: {"MYKEY": JSON.stringify(jsonObjectData)},
			type:"post",
			
			success:function(result) {
				console.log(result);
				var htmlStr = "";
				
				$.each(result, function(i,v){
					htmlStr += "<tr><td>"+v.bseq+"</td><td>"+v.btitle+"</td><td>"+v.regdate+"</td></tr>"
				});
				$("#searchRes").html(htmlStr);
			}
		});
		
		//$(".searchForm").submit();
	});
});

</script>
</head>
<body>
<form class="searchForm" method="post" action="/search">

<select id="searchGubun" name="searchGubun">
	<option value="btitle">제목</option>
	<option value="bcon">내용</option>
</select>

<input type="text" name="searchStr" id="searchStr">
<input type="button" id="searchBtn" value="검색">
</form>

<table class="demo-table">
	<thead>
		<tr>
			<th bgcolor="#cccccc">BSEQ</th>
			<th bgcolor="#cccccc">BTITLE</th>
			<th bgcolor="#cccccc">REGDATE</th>
		</tr>
	</thead>
	<tbody id="searchRes"></tbody>
</table>

</body>
</html>