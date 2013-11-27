<%@page import="org.apache.ibatis.session.SqlSession"%>
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

<!-- ---------------------------------------- 중간 왼쪽 프레임 시작 ------------------------------------- -->
<style type="text/css">
td {
	font-family: "돋움", "돋움체", "Arial";
}
</style>
<td width="235" height="100%" bgcolor="f6f3ee" align="center"
	valign="top">
	<table cellpadding="0" cellspacing="0" width="235">

		<!-- ---------------------------------------- 중간 왼쪽 프레임 상부 박스(시작) ------------------------------------- -->
		<tr>
			<td bgcolor="#f6f3ee" style="padding: 5px" align="center">
				<!--CALL : L_LOGIN_FORM : basic_blue-->
				<script type="text/javascript"
					src="/common/js/sky.form.checker.js?v=201108010000"></script>


				<table border="0" id="login_bg" cellpadding="0" cellspacing="0">
					<tr>
						<td height="30"></td>
					</tr>
					<tr>
						<c:set var="m_id" value="<%=id %>"></c:set>
						<td height="25px" valign="top" align="center">
						<strong>${m_id }</strong>님 Level : <strong><%=grade %></strong>  
						<a href="logout.do"><img border="0" src="images/btn_logout.gif" alt="로그아웃" width="63" height="18" align="middle" /></a>
						</td>
					</tr>
					<tr>
						<td height="25px" valign="top" style="padding-left: 20px"><img
							src="images/icon_memo.gif" alt="쪽지" align="middle" /> <a
							href="?act=mypage.memo_recv_list"><strong>0</strong>
						</a>개의 쪽지가 있습니다.</td>
					</tr>
					<tr>
						<td align="center"><a href="?act=mypage.user_info_modify">마이페이지</a>
							| <a href="memberInfoUpdateForm.do">정보수정</a></td>
					</tr>
				</table></td>
				<!-- ---------------------------------------- 중간 왼쪽 프레임 상부 박스(끝) ------------------------------------- -->

		<!-- ------------------------------------------ 중간 왼쪽 프레임 하부(시작) ------------------------------------------------------------->
		
		<tr>
			<td align="center"><a href="주소"><img border="0"
					src="images/m_banner1.gif" alt="정기모임안내">
			</a></td>
		</tr>
		<tr>
			<td align="center"><a href="주소"><img border="0"
					src="images/m_banner2.gif" alt="새내기 가입인사">
			</a></td>
		</tr>
		<tr>
			<td align="center"><img
				src="images/m_banner3.gif"
				alt="전화주시면 빠르고 친절하게 안내해 드립니다"></td>
		</tr>
		<tr>
			<td align="center" >
				<table cellpadding="0" cellspacing="0" style="padding-left: 20px">
				
					<tr>
						<td height="10"></td>
					</tr>
					<tr align="left">
						<td colspan="2"><a href="주소"><img border="0"
								src="images/title_rec.gif" alt="추천여행지">
						</a></td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td><img src="images/rec_img1.gif">
						</td>
						
						<td style="padding-left: 5px">여행지</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>

						<td height="1" colspan="2" bgcolor="d0d0cf"></td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td><img src="images/rec_img2.gif">
						</td>
						<td style="padding-left: 5px" width="100%">여행지</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</td>


<!-- ------------------------------------------왼쪽 프레임 하부 (끝) ------------------------------------------------------------->


<!-- ------------------------------------------중간 왼쪽 프레임 종료 ------------------------------------------------------------->