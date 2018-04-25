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
$(function(){

	var opensearch = $("#opensearch");

	if (undefined !== opensearch) {
		opensearch.click(function () {
			$("#forumsearch").slideToggle("fast");
		});
	}
	
	$("#blur").click(function() {
		$(this).blur();
	});
	
});
</script>
</head>
<body>
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
						<table width="100%">
							<tr>
								<td valign="middle" width="150">
									<c:choose>
										<c:when test="${LVL_TYPE=='free'}">
											<font class="green big bold">FREE</font>
											<font class="lightgreen han_sm">| 얽매이지 않는 곳</font>
										</c:when>
										<c:when test="${LVL_TYPE=='humor'}">
											<font class="green big bold">HUMOR</font>
											<font class="lightgreen han_sm">| 객관적으로 재밌어야 하는 곳</font>
											
										</c:when>
										<c:when test="${LVL_TYPE=='unknown'}">
											<font class="green big bold">UNKNOWN</font>
											<font class="lightgreen han_sm">| 익명으로 치부를 드러내는 곳</font>
											
										</c:when>
										<c:otherwise>
											<font class="green big bold">TOTAL</font>
											<font class="lightgreen han_sm">| 전체 글</font>
										</c:otherwise>
									</c:choose>
								</td>
								<td align="right" width="300" class="greenred big bold">
									
									
									<c:choose>
										<c:when test="${LVL_SESS_MGUBUN=='u'}">
											<a href="/board/board_user_main.jsp" onfocus="blur()" style="background-color: transparent;">${LVL_SESS_MNAME}</a>
										</c:when>
										<c:when test="${LVL_SESS_MGUBUN=='a'}">
											<a href="/board/board_admin_main.jsp" onfocus="blur()" style="background-color: transparent;">${LVL_SESS_MNAME}</a>
										</c:when>
									</c:choose>
									
									 
									
									
									
									
								</td>
							</tr>
						</table>
						
					
					</div>
					<div>
						<div class="head_left">
							<a onfocus="blur()" href='/board?action=list&type=${LVL_TYPE}' title="새로고침">
								<img src='/images/refresh.png' width='13' height='13' class='middle'>
							</a>
							<span class="greenlink">
								${LVL_PAGING}
							</span>
						</div>
						<div class="head_right green">
							<!-- <img src='../2010/images/go_first.gif' class='go middle'
								title='first page'><img src='../2010/images/go_prev.gif'
								class='go middle' title='previous page'>&nbsp;&nbsp;<span
								title="total 841709 posts"><b>1</b> of 44301</span>&nbsp;&nbsp;<a
								onfocus="blur()" href='?id=secret&page=2'><img
								src='../2010/images/go_next.gif' class='go_active middle'
								title='next page' style='margin-left: 5px;'></a> -->
						</div>
						<div style="clear: left;"></div>


						<table border="0" cellspacing="0" cellpadding="0" width="100%"
							style="table-layout: fixed;">
							
							<col style="width: 65px;"></col>
							<col style="width: 480px;"></col>
							<col style="width: 80px;"></col>
							<col style="width: 65px;"></col>

							<!-- TODO  -->
							<c:forEach items="${LVL_LIST}" var="bvo">
							<tr onMouseOver="this.style.backgroundColor='#faf8df'" onMouseOut="this.style.backgroundColor=''" style='height: 24px;'>
								<td class='black dctd' width="5">${bvo.bvo.bseq}</td> 
								<td class='black size dctd'>
									<div style="width: 465px;" class="nobr">
										<a onfocus='blur()' href="/board?action=view&type=${LVL_TYPE}&bseq=${bvo.bvo.bseq}">
											${bvo.bvo.btitle} <!-- btitle --> 
										</a> 
										&nbsp;
									</div>
								</td>
								<td class='dctd green'>
									<div style="width: 145px;" class="nobr">
										${bvo.mvo.mname} <!-- mseq -->
									</div>
								</td>
								<td class='green dctd'><span>${bvo.bvo.regdate}</span></td> <!-- 날짜 -->
							</tr>
							</c:forEach>
							
						</table>

						<div class="foot_left">
							<a onfocus="blur()" href='?id=secret' title="새로고침">
								<img src='/images/refresh.png' width='13' height='13' class='middle'>
							</a>
							<span class="greenlink">
								${LVL_PAGING}
							</span>
						</div>
						<div class="foot_right green">
							<!-- <img src='../2010/images/go_first.gif' class='go middle'
								title='first page'><img src='../2010/images/go_prev.gif'
								class='go middle' title='previous page'>&nbsp;&nbsp;<span
								title="total 841709 posts"><b>1</b> of 44301</span>&nbsp;&nbsp;<a
								onfocus="blur()" href='?id=secret&page=2'><img
								src='../2010/images/go_next.gif' class='go_active middle'
								title='next page' style='margin-left: 5px;'></a> -->
						</div>
						<div style="clear: left;"></div>
						<div class="small" style="padding-top: 9px; cursor: default; display: none;">
							<span class="grey bold" style="color: #6f8b3d;"> <span
								class="green">all posts&nbsp;|&nbsp;</span> <a
								href="?id=secret&amp;select_arrange=rdate" onfocus="blur()">new
									posts &amp; comments</a>
							</span>&nbsp;&nbsp;
						</div>

						<div id="forumsearch" style="margin-top:18px;padding:10px;display:none;width:200px;top:-13px;left:-90px;background-color:#fffff0;border:1px solid #e0dcc0;">

							<form method="get" name="search" action="">
								<input type="hidden" name="id" value="secret">
								<input type="hidden" name="page" value="1">

								<div style="padding-bottom:4px;height:18px;" class="green">
									<input type="radio" name="ss" value="off"  class="middle" onfocus="blur()" id="sn" onClick="disable('sn', 'scmt')" ><label for="sn"> name</label>&nbsp;&nbsp;
									<input type="radio" name="ss" value="on" checked class="middle" onfocus="blur()" id="ss" onClick="enable('ss', 'scmt')"><label for="ss"> title + body</label>
									<input type="checkbox" name="scmt" value="on"  class="middle" onfocus="blur()" id="scmt" ><label for="scmt"> comments</label>
								</div>
								<div>
									<input type="text" name="keyword" value="" class="input black size middle" style="width:160px;height:18px;">
									<input type="image" src="/images/search.png" style="width:20px;height:20px;margin-left:5px;" onfocus="blur()" class="middle" title='search'>
								</div>
							</form>
						</div>
						
						<div id="bottom"
							style="width: 625px; margin-left: 160px; display: block; padding-top: 18px;">

							
							<div style="width: 160px; float: left; padding-top: 10px; position: relative;" class="green bold">
								<a id="opensearch" style="cursor: pointer;" title="검색">
									<img src="/images/search.png" style="width: 20px; height: 20px;" onfocus="blur()"
									class="middle"> search</a>
							</div>
							<div style="width: 160px; float: left; padding-top: 10px;" class="green bold">
							<a onfocus="blur()" href="/board/board_input.jsp" title="게시물 올리기">
								<img src="/images/add.png" style="width: 20px; height: 20px;" class="middle"> post</a>
							</div>
							<div style="width: 160px; float: left; padding-top: 10px;" class="green bold">
								<a onfocus="blur()" href="/board?action=list&amp;type=${LVL_TYPE}" title="목록">
									<img src="/images/list.png" style="width: 20px; height: 20px;" class="middle"> list</a>
							</div>
							
							</div>


							
							<div>

							<div style="width: 145px; float: left; padding-top: 8px;">
							</div>

						</div>
						<div style="clear: left;"></div>
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