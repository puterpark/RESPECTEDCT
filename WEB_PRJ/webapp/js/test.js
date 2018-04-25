$(function(){
	$("#title").css("color", "green");
	$("#myDiv").css("color", "orange");
});


function myFunc() {
	alert("dd");
}


$(function(){
	$("#mybtn").click(function() {
		alert("jQuery Call 버튼 클릭");
	})
});


$(function(){
	var f = $(".myform"); //class -> .
	var mid = $("#mid");  //id    -> #
	var mpw = $("#mpw");
	
	f.submit(function() {
		if(mid.val() == "") {
			alert("아이디를 입력하세요.");
			mid.focus();
			return false;
		} else if(mpw.val() == "") {
			alert("비밀번호를 입력하세요.");
			mpw.focus();
			return false;
		}
	})
});