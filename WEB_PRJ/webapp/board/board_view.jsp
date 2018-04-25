<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RESPECTEDCT</title>
<link rel="stylesheet" type="text/css" href="/css/combined_2018.css" />
<link rel="stylesheet" type="text/css" href="/css/dctribe.css" />
<script>
	function goPage(prm) {
		deleteform.action.value = prm;
		deleteform.submit();
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<div id="container">
		<!-- HEADER -->
		<div id="header">
			<div id="logo">
				RESPECTE<font class="bold">DCT&nbsp;</font> <img
					src="/images/wankim.png" id="logoimg" class="middle" width="16"
					height="16">
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
					<div style="visibility: hidden;">
						<br>
					</div>
					<font class="main green" title="전체 글"> <a
						href="/board?action=list" onfocus="blur()"
						style="background-color: transparent;">TOTAL</a>
					</font>
					<div style="visibility: hidden;">
						<br>
					</div>
					<font class="main green" title="자유"> <a
						href="/board?action=list&type=free" onfocus="blur()"
						style="background-color: transparent;">FREE</a>
					</font>
					<div style="visibility: hidden;">
						<br>
					</div>
					<font class="main green" title="유머"> <a
						href="/board?action=list&type=humor" onfocus="blur()"
						style="background-color: transparent;">HUMOR</a>
					</font>
					<div style="visibility: hidden;">
						<br>
					</div>
					<font class="main green" title="익명"> <a
						href="/board?action=list&type=unknown" onfocus="blur()"
						style="background-color: transparent;">UNKNOWN</a>
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
								<td valign="middle" width="150"><c:choose>
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
									</c:choose></td>
								<td align="right" width="300" class="green big bold"><c:choose>
										<c:when test="${LVL_SESS_MGUBUN=='u'}">
											<a href="/board/board_user_main.jsp" onfocus="blur()"
												style="background-color: transparent;">${LVL_SESS_MNAME}</a>
										</c:when>
										<c:when test="${LVL_SESS_MGUBUN=='a'}">
											<a href="/board/board_admin_main.jsp" onfocus="blur()"
												style="background-color: transparent;">${LVL_SESS_MNAME}</a>
										</c:when>
									</c:choose></td>
							</tr>
						</table>
					</div>

					<div>
						<div
							style="border-top: 1px solid #b7c597; border-bottom: 1px solid #e2e8cc;">
							<div style="padding: 18px 0; overflow: hidden;"
								class="big black bold">${LVL_VO.btitle}</div>

							<div class="comment_name black">
								<b>${LVL_VO.mseq}</b>&nbsp;&nbsp;<font class='date'>${LVL_VO.regdate}</font><span
									class="darkgrey small"></span>
							</div>

							<form name="deleteform" action="/board" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="action"> <input type="hidden"
									name="bseq" value="${LVL_VO.bseq}"> <input
									type="hidden" name="bfilePath" value="${LVL_VO.bfilePath}">
								<input type="hidden" name="bfileName"
									value="${LVL_VO.bfileName}">
								<div class="comment_btns">
									<!-- <input type="image" src="/images/edit.png" width="17" height="17" class="middle" title="수정"
									onClick="goPage('update')"> -->
									<c:choose>
										<c:when
											test="${(LVL_SESS_MSEQ==LVL_VO.mseq && LVL_SESS_MGUBUN=='u')||LVL_SESS_MGUBUN=='a'}">
											<a onfocus='blur()'
												href="/board?action=detail&type=${LVL_TYPE}&bseq=${LVL_VO.bseq}">
												<img src='/images/edit.png' width='17' height='17'
												class='middle' title='수정'>
											</a>
								&nbsp;&nbsp;
								<input type="image" src="/images/trash.png" width="15"
												height="15" class="middle" title="삭제"
												onClick="goPage('delete')" style="cursor: pointer;">
											<%-- <a onfocus='blur()' href="/board?action=delete&bseq=${LVL_BSEQ}">
									<img src='/images/trash.png' width='15' height='15'	class='middle' title='삭제'>
								</a> --%>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>
									<%-- <a onfocus='blur()' href="/board?action=detail&type=${LVL_TYPE}&bseq=${LVL_VO.bseq}">
									<img src='/images/edit.png' width='17' height='17' class='middle' title='수정'>
								</a>
								&nbsp;&nbsp;
								<input type="image" src="/images/trash.png" width="15" height="15" class="middle" title="삭제"
									onClick="goPage('delete')" style="cursor: pointer;">
								<a onfocus='blur()' href="/board?action=delete&bseq=${LVL_BSEQ}">
									<img src='/images/trash.png' width='15' height='15'	class='middle' title='삭제'>
								</a> --%>
								</div>
							</form>

							<div style="padding: 18px; clear: left;"
								class="body_text black size">
								<table width="100%" cellpadding="0" cellspacing="0"
									style="table-layout: fixed;">
									<tr>
										<td>
											<col style="width: 100%;"></col> ${LVL_VO.bcon}
										</td>
									</tr>
								</table>
							</div>
							<div>
								<br>
							</div>
						</div>
						<div style="padding-bottom: 10px;" class="bold green upper">file
							download</div>
						<div>
							<a href="/board?action=down&fname=${LVL_VO.bfileName}">
								${LVL_VO.bfilePath}&#92;${LVL_VO.bfileName}
								(size:${LVL_VO.bfileSize}KB) </a>
						</div>

						<div id="bottom"
							style="width: 625px; margin-left: 160px; display: block; padding-top: 80px;">

							<div
								style="width: 160px; float: left; padding-top: 10px; position: relative; visibility: hidden;"
								class="green bold">
								<a id="opensearch" style="cursor: pointer;" title="검색"><img
									src="/images/search.png" style="width: 20px; height: 20px;"
									onfocus="blur()" class="middle"> search</a>
							</div>

							<div style="width: 160px; float: left; padding-top: 10px;"
								class="green bold">
								<a onfocus="blur()" href="/board/board_input.jsp"
									title='게시물 올리기'><img src="/images/add.png"
									style="width: 20px; height: 20px;" class="middle"> post</a>
							</div>

							<div style="width: 160px; float: left; padding-top: 10px;"
								class="green bold">
								<a onfocus="blur()" href='/board?action=list&type=${LVL_TYPE}'
									title='목록'><img src="/images/list.png"
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
</body>
</html>