<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)}
    to {-webkit-transform: scale(1)}
}

@keyframes animatezoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script>
$(function () {
	 //if(!$.storage()) {
     //	alert("WARNING!!! not have Web Storage support");
     //}

    if (localStorage.mid && localStorage.mid != "") {
		alert("로드성공: 스토리지 세팅 값 가져오기");
        //$('#mid').val($.storage('LVL_MID'));
        $("#mchk").attr("checked", "checked");
        $("#mid").val(localStorage.getItem("LVL_MID"));
        $("#mpw").val(localStorage.getItem("LVL_MPW"));
    } /* else {
    	alert("로드실패: 스토리지 세팅 값 없음");
        $("#mchk").removeAttr('checked');
        $("#mid").val("");
        $("#mpw").val("");
    } */

    $("#mchk").click(function () {
        if ($("#mchk").is(":checked")) {
    		alert("체크박스 눌림 : 스토리지에 값 저장");
            //$.storage("LVL_MID", '1111');
            localStorage.setItem("LVL_MID", $("#mid").val());
            localStorage.setItem("LVL_MPW", $("#mpw").val());
            localStorage.setItem("LVL_MCHK", $("#mchk").val());
        } else {
        	alert("체크박스 해지 : 스토리지에 값 공백초기화");
        	//$.storage("LVL_MID", "");
            localStorage.setItem("LVL_MID", "");
            localStorage.setItem("LVL_MPW", "");
            localStorage.setItem("LVL_MCHK", "");
        }
    });
});
</script>

</head>
<body>

<h2>Modal Login Form</h2>

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

<div id="id01" class="modal">

  <!--  form tag start -->
  <form class="modal-content animate" method="post" action="/login">
    <div class="container">
      <label><b>Username</b></label>
      <input type="text" placeholder="이름 입력" name="mid" id="mid" required>

      <label><b>Password</b></label>
      <input type="password" placeholder="비번 입력" name="mpw" id="mpw" required>

      <button type="submit">Login</button>
      <label>
        <input type="checkbox" id="mchk" checked="checked"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>
