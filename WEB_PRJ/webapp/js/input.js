/**
 * 
 */
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