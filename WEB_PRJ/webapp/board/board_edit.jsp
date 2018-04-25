<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RESPECTEDCT</title>
<link rel="stylesheet" type="text/css" href="/css/combined_2018.css" />
<link rel="stylesheet" type="text/css" href="/css/dctribe.css" />
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script>
	function goPage(prm) {
		updatefrom.action.value = prm;
		updatefrom.submit();
	}
</script>

<script>
$(function(){
	
	
	var btype = "${LVL_TYPE}";
	
	if(btype == "free") {
		$("#free").prop("selected", true);
	} else if(btype == "humor") {
		$("#humor").prop("selected", true);
	} else if(btype == "unknown") {
		$("#unknown").prop("selected", true);
	}
});
</script>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<div id="container">
		<!-- HEADER -->
		<div id="header">
			<div id="logo">RESPECTE<font class="bold">DCT&nbsp;</font>
				<img src="/images/wankim.png" id="logoimg" class="middle" width="16" height="16">
			</div>
			<div id="nav_top">
				<!-- <div style="display: inline;">
					<a title="자유" href="" onfocus="blur()"><span class="white main">FREE</span></a>
				</div>
				<div style="display: inline;">
					<a title="유머" href="/board?action=list&type=humor" onfocus="blur()"><span class="white main">HUMOR</span></a>
				</div>
				<div style="display: inline;">
					<a title="익명" href="" onfocus="blur()"><span class="white main">UNKNOWN</span></a>
				</div> -->
			</div>
		</div>



		<div id="content">
			<div id="leftbar">
				<!-- NAV -->
				<div id="nav">
					<div style="visibility:hidden;">
					<br>
					</div>
					<font class="main green" title="전체 글">
						<a href="/board?action=list" onfocus="blur()" style="background-color: transparent;">TOTAL</a>
					</font>
					<div style="visibility:hidden;"><br></div>
					<font class="main green" title="자유">
						<a href="/board?action=list&type=free" onfocus="blur()" style="background-color: transparent;">FREE</a>
					</font>
					<div style="visibility:hidden;"><br></div>
					<font class="main green" title="유머">
						<a href="/board?action=list&type=humor" onfocus="blur()" style="background-color: transparent;">HUMOR</a>
					</font> 
					<div style="visibility:hidden;"><br></div>
					<font class="main green" title="익명">
						<a href="/board?action=list&type=unknown" onfocus="blur()" style="background-color: transparent;">UNKNOWN</a>
					</font>
				</div>
			</div>


			<!--  BODY -->
			<div id="bodywrapper">
				<div id="body">
					<div id="topwrapper"></div>
					<div>
						<br>
					</div>
					<div class='title'>
						<span
							class="green big bold">
							<c:choose>
								<c:when test="${LVL_TYPE=='free'}">
									FREE
								</c:when>
								<c:when test="${LVL_TYPE=='humor'}">
									HUMOR
								</c:when>
								<c:when test="${LVL_TYPE=='unknown'}">
									UNKNOWN
								</c:when>
								<c:otherwise>
									TOTAL
								</c:otherwise>
							</c:choose>
							</span><span
							class="lightgreen han_sm">|
								<c:choose>
								<c:when test="${LVL_TYPE=='free'}">
									얽매이지 않는 곳
								</c:when>
								<c:when test="${LVL_TYPE=='humor'}">
									객관적으로 재밌어야 하는 곳
								</c:when>
								<c:when test="${LVL_TYPE=='unknown'}">
									익명으로 치부를 드러내는 곳
								</c:when>
								<c:otherwise>
									전체 글
								</c:otherwise>
							</c:choose>
							</span>
					</div>
					
					<div id="post">

						<form name="updatefrom" action="/board" method="post" enctype="multipart/form-data">
							<input type="hidden" name="action">
							<input type="hidden" name="bfilePath" value="${LVL_VO.bfilePath}">
							<input type="hidden" name="bfileName" value="${LVL_VO.bfileName}">
							
							<!-- <div style="display: none;">
								<input type=checkbox name=use_html checked value="1"
									id="usehtml" /> HTML&nbsp;&nbsp;&nbsp;
							</div> -->

							<div style="padding-bottom: 5px; padding-top: 5px;"
								class="bold green upper">type</div>
							<div>
								<select name="btype" id="btype" style="height:25px">
									<option value="free" id="free">FREE</option>
									<option value="humor" id="humor">HUMOR</option>
									<option value="unknown" id="unknown">UNKNOWN</option>
								</select>
							</div>

							<div style="padding-bottom: 5px; padding-top: 5px;"
								class="bold green upper">title</div>
							<div>
								<input type="text" name="btitle" value="${LVL_VO.btitle}" size=36 maxlength=200
									class="post_input">
							</div>

							<div style="padding-bottom: 5px;" class="green">
								<span class="bold green upper">body</span> 
								<span class="small hidden">max width:785px / usable tags:
									a,img,embed,font,b,strong,strike,br,center,div,span,p,object,param,ul,li</span>
							</div>
							<div id="ckeditor">
								<textarea name="bcon" cols=54 rows=20 class="post_textarea">${LVL_VO.bcon}</textarea>
							</div>
							<!--<div style="padding-bottom:5px;" class="bold green upper">link #2</div>
  <div><input type=text name=sitelink2 value=""  size=37.2  maxlength=10000 class="post_input"></div>
-->
							<!--<div style="padding-bottom:5px;" class="bold green upper">image (optional)</div>
<div class='green '><input type="file" name="file1"  size=36  maxlength=10000 class="post_file"> <span class="darkgrey"></span></div>
<div class="green "><p class=" green"><p> 파일만 업로드 가능합니다.</p><p>Maximum File size : <b></b></p></div>

-->
							<!-- <div style="padding-bottom: 5px;" class="bold green upper">file upload</div>
							<div>
								<input type=text name=sitelink1 value="" size=37.2
									maxlength=10000 class="post_input">
								<input type="file" name="mfile" value="" size=37.2
									maxlength=10000 class="post_input">
									
								<p class="green">파일만 업로드 가능합니다.</p>
							</div> -->


							<div style="padding-bottom: 5px;" class="bold green upper">file upload</div>
							<div>${LVL_VO.bfilePath}&#92;${LVL_VO.bfileName} (size:${LVL_VO.bfileSize}KB)</div>
							<div>
								<input type="file" name="ufile" value="" size=37.2
									maxlength=10000 class="post_input">
								<p class="green">파일만 업로드 가능합니다.</p>
							</div>

							<div class="width:785px;">
								<input type="hidden" name="bseq" value="${LVL_VO.bseq}">
								<div class="green bold" style="padding-top: 18px;">
									<input type="image" src="/images/add.png" style="width: 18px; height: 18px;" class="middle"
										onfocus="blur()" title="올리기" id="delete" onClick="goPage('update')" />
										<label for="delete" title="올리기"> update </label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a onfocus="blur()" href='javascript:history.back()' title="뒤로">
											<img src="/images/cancel.png" style="width: 20px; height: 20px;" class="middle"> back
										</a>
								</div>
							</div>
						</form>

						<!-- <form name="check_attack">
							<input type="hidden" name="check" value=0>
						</form>
						<div id='zb_waiting' style="display: none;">
							<div
								style="padding: 10px 0 5px 40px; background: #fffff0 url(../2010/images/loading_ajax.gif) 7px 7px no-repeat;"
								class="green small">
								<form name='waiting_form'>uploading</form>
							</div>
						</div> -->

					</div>

				</div>
			</div>

			<div id="clear"></div>

		</div>

		<div id="footer">
			<div id="copyright">&copy; 2018 dctribe.com. created, designed
				and copyrighted by wankim.</div>
			<div id="announcements" onmouseover="this.className='hover'"
				onmouseout="this.className=''">
				<a href="../0/zboard.php?id=announcements" onfocus="blur()"
					title="공지사항">announcements</a>&nbsp;
			</div>
			<div id="policy" onmouseover="this.className='hover'"
				onmouseout="this.className=''">
				<a href="../2010/privacy-policy.html" onfocus="blur()"
					title="개인정보 취급방침" class="policy">privacy policy</a>

			</div>
		</div>
	</div>
</body>
</html>