<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String result = (String) session.getAttribute("login_check");
	String id = null;
	String grade = null;
	if (result != null) {
		id = (String) session.getAttribute("logged_id");
		grade = (String) session.getAttribute("logged_grade");
	}
%>
<!-- --------------------------------------------------------- 상단(시작) --------------------------------------------------------------- -->



<table border="0" cellpadding="0" cellspacing="0" width="980"
	style="font-style: inherit; font-size: 15px" align="center">
	<tr>
		<td colspan="3">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td width="170" style="padding-left: 20px"><img
						src="images/left_banner1.gif">
					</td>
					<td width="520" align="center" height="70"><a href="main.do"><img
							border="0" src="images/logo_2.gif"> </a>
					</td>
					<td width="295" valign="bottom" style="padding-bottom: 10px">
						<a href="http://www.bitgo.co.kr/"><img border="0"
							src="images/bitlogo.gif" /> </a> 
							<a href="signup.do"><img
							border="0" src="images/topmenu_join.gif" /> </a> 
							
							
							<c:set var="result" value="<%=result %>"></c:set>
							<c:if test="${result == null }">
								<a href="login.do"><img border="0" src="images/topmenu_login.gif" /> </a> 
							</c:if>
							<c:if test="${result != null }">
								<a href="logout.do"><img border="0" src="images/topmenu_logout.gif" /> </a> 								
							</c:if>
							
							
							<a
						href="sitemap.do"><img border="0"
							src="images/topmenu_sitemap.gif" /> </a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="20%"><a href="noticeboardlist.do"> <img
							width="195" border="0" src="images/navi_2.gif"
							class='navi_main_obj' subcode='1' alt="공지사항"> </a>
					</td>
					<td width="20%"><a href="freeboardlist.do"> <img
							width="195" border="0" src="images/navi_2.gif"
							class='navi_main_obj' subcode='2' alt="커뮤니티"> </a>
					</td>
					<td width="20%"><a href="fileboardlist.do"> <img width="195" border="0"
							src="images/navi_2.gif" class='navi_main_obj' subcode='3'
							alt="자료실"> </a>
					</td>
					<td width="20%"><a href="주소"> <img width="195" border="0"
							src="images/navi_2.gif" class='navi_main_obj' subcode='4'
							alt="갤러리"> </a>
					</td>
					<td width="20%"><a href="주소"> <img width="195" border="0"
							src="images/navi_2.gif" class='navi_main_obj' subcode='5'
							alt="클럽운영"> </a>
					</td>

				</tr>
				<tr>
					<td colspan="5" width="980px" height="35px"
						background="images/navi_bg.gif"></td>
				</tr>

			</table>
		</td>

	</tr>
</table>





<!-- --------------------------------------------------------- 상단(끝) --------------------------------------------------------------- -->
