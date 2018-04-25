<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY PAGE</title>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/combined_2018.css" />
<link rel="stylesheet" type="text/css" href="/css/dctribe.css" />

<script>
$(function() {
	$("#logoutBtn").click(function(){
		//TODO
		$(".logoutForm").submit();
	});
	
	$("#boardBtn").click(function(){
		//TODO
		$(".boardForm").submit();
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
			<div id="leftbar" style="visibility:hidden;">
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
				<div><br><br></div>
				<div id="login" style="width: 785px; padding: 16px 0; margin-left: 14px; display: none;" >
					<div class="green bold">
						<img src="/images/member.png" width="16" height="16"
							class="middle postsimg"> login
					</div>
					<form name="zb_login" method="post" action="/login"
						onsubmit="return zb_login_check_submit();">
						&nbsp;
						<div style="float: left; width: 200px; display: inline; margin-top: 7px;">
							<input type="text" name="mid" class="input login middle"
								title="id" id="mid" style="margin-bottom: 5px;" tabindex="1" /><br />
							<input type="checkbox" name="auto_user_id" value="1"
								onclick="check_autouser_id()" id="auto_user_id" class="middle"
								onfocus="blur()" title="아이디 기억하기" /> <label for="auto_user_id"
								title="아이디 기억하기" class="grey small" onfocus="blur()">
								remember my id</label>
						</div>
						<div style="float: left; width: 200px; display: inline; margin-top: 7px;">
							<input type="password" name="mpw" class="input login middle"
								title="password" style="margin-bottom: 5px;" id="mpw"
								tabindex="2" /><br />
							<input type="checkbox" name="auto_user_password" value="1"
								onclick="check_autouser_password()" id="auto_user_password"
								class="middle" onfocus="blur()" title="비밀번호 기억하기" /> <label
								for="auto_user_password" class="grey small" onfocus="blur()"
								title="비밀번호 기억하기">remember my password</label>
						</div>
						<div style="float: left; width: 80px; display: inline">
							<input type="image" src="/images/member.png"
								style="width: 40px; height: 40px;" onfocus="blur()" tabindex="3"
								title="로그인" />
						</div>
						<div style="float: left; width: 240px; display: inline; margin-top: 12px;" class="green">
							<img src="/images/search.png"
								style="width: 20px; height: 20px;" onfocus="blur()"
								class="middle"> <a href="../0/find_password.php"
								onfocus="blur()" title="아이디/비밀번호 찾기" class='idpassword'>find
								your id or password &raquo;</a>
						</div>
						<span><input type="hidden" name="group_no" value="3" /></span>
					</form>
				</div>

				<div id="body">
					<div id="topwrapper"></div>
					<div class="main">
						<table>
						<tr>
							<td colspan="3">
								<font class="bold">${LVL_SESS_MNAME}</font> 님, 환영합니다.
							</td>
						</tr>
						<tr>
							<td colspan="3">
								&nbsp;
							</td>
						</tr>
						<tr align="center">
							<td>
								<form class="logoutForm" method="get" action="/login">
									<input type="button" id="logoutBtn" value="로그아웃">
								</form>
							</td>
							<td>
								<form class="boardForm" method="get" action="/board">
									<input type="button" id="boardBtn" value="게시판">
								</form>
							</td>
							<td style="visibility:hidden;">
								<form class="memberForm" method="get" action="/member_url">
									<input type="button" id="memberBtn" value="회원관리">
								</form>
							</td>
						</tr>
						</table>
					</div>
					<div class='title' style="visibility:hidden;">
						<img src="../2010/images/ic_secret.gif" class="middle titleimg"><span
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
							</span><img
							src="../2010/images/bar.gif" width="19" height="7" class="middle"><span
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
					
					
					<div style="visibility:hidden;">
						<div class="head_left">
							<a onfocus="blur()" href='?id=secret' title="새로고침">
								<img src='../2010/images/ic_refresh.gif' width='16' height='16'	class='middle'>
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
								<td class='black dctd' width="5">${bvo.bseq}</td> 
								<td class='black size dctd'>
									<div style="width: 465px;" class="nobr">
										<a onfocus='blur()' href="/board?action=view&type=${LVL_TYPE}&bseq=${bvo.bseq}">
											${bvo.btitle} <!-- btitle --> 
										</a> 
										&nbsp;
									</div>
								</td>
								<td class='dctd green'>
									<div style="width: 145px;" class="nobr">
										${bvo.mseq} <!-- mseq -->
									</div>
								</td>
								<td class='green dctd'><span>${bvo.regdate}</span></td> <!-- 날짜 -->
							</tr>
							</c:forEach>
							
						</table>

						<div class="foot_left">
							<a onfocus="blur()" href='?id=secret' title="새로고침">
								<img src='../2010/images/ic_refresh.gif' width='16' height='16'	class='middle'>
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
						<div class="small" style="padding-top: 9px; cursor: default;">
							<span class="grey bold" style="color: #6f8b3d;"> <span
								class="green">all posts&nbsp;|&nbsp;</span> <a
								href="?id=secret&amp;select_arrange=rdate" onfocus="blur()">new
									posts &amp; comments</a>
							</span>&nbsp;&nbsp;<a href="../0/civilization.php" class="policy"
								onfocus="blur()" title="게시물 보기 설정"><img
								src="../2010/randim.php?type=1" class="middle"></a>
						</div>
						<div id="forumsearch"
							style="margin-top: 18px; padding: 10px; display: none; width: 240px; top: -13px; left: -90px; background-color: #fffff0; border: 1px solid #e0dcc0;">

							<form method="get" name="search" action="">
								<input type="hidden" name="id" value="secret"> <input
									type="hidden" name="page" value="1">

								<div style="padding-bottom: 4px; height: 18px;" class="green">
									<input type="radio" name="ss" value="off" class="middle"
										onfocus="blur()" id="sn" onClick="disable('sn', 'scmt')"><label
										for="sn"> name</label>&nbsp;&nbsp; <input type="radio"
										name="ss" value="on" checked class="middle" onfocus="blur()"
										id="ss" onClick="enable('ss', 'scmt')"><label for="ss">
										title + body</label> <input type="checkbox" name="scmt" value="on"
										class="middle" onfocus="blur()" id="scmt"><label
										for="scmt"> comments</label>
								</div>
								<div>
									<input type="text" name="keyword" value=""
										class="input black size middle"
										style="width: 160px; height: 18px;"><input
										type="image" src="/images/search.png"
										style="width: 20px; height: 22px; margin-left: 10px;"
										onfocus="blur()" class="middle" title='search'>

								</div>
							</form>
						</div>

						<div id="bottom"
							style="width: 625px; margin-left: 160px; display: block; padding-top: 18px;">

							<div
								style="width: 160px; float: left; padding-top: 10px; position: relative;"
								class="green bold">
								<a id="opensearch" style="cursor: pointer;" title="검색"><img
									src="/images/search.png"
									style="width: 20px; height: 20px;" onfocus="blur()"
									class="middle"> search</a>
							</div>

							<div style="width: 160px; float: left; padding-top: 10px;" class="green bold">
								<a onfocus="blur()" href="/board/board_input.jsp"
									title='게시물 올리기'><img src="/images/add.png"
									style="width: 20px; height: 20px;" class="middle"> post</a>
							</div>

							<div style="width: 160px; float: left; padding-top: 10px;"
								class="green bold">
								<a onfocus="blur()" href='?id=secret&prev_no=' title='목록'><img
									src="/images/list.png"
									style="width: 20px; height: 20px;" class="middle" /> list</a>
							</div>

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