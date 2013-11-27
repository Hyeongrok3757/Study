<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String result = (String) session.getAttribute("login_check");
	String id = null;
	String grade = null;
	if (result != null) {
		id = (String) session.getAttribute("logged_id");
		grade = (String) session.getAttribute("logged_grade");
	}
%>
<jsp:include page="../base/top.jsp"></jsp:include>
<jsp:include page="../base/middle_start.jsp"></jsp:include>
<jsp:include page="../base/middle_left_main.jsp"></jsp:include>


<td width="15">&nbsp;</td>
<td width="719" valign="top">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function check() {
		if($('file_name').val().trim() == "" && $('#img_name').val().trim() == ""){
			alert("파일이나 이미지 둘 중 하나는 등록하시오.");
		} else if($('input[name=file_pwd]').val() == null) alert("비밀번호를 입력하세요.");
	}
</script>
	<table cellpadding="0" cellspacing="0" width="719">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%" border="0">
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td><img src="images/title2_3.gif">
						</td>
						<td align="right"><img src="images/icon_h.gif">> 커뮤니티 >
							자료실</td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td height="1" colspan="2" bgcolor="cbcbcb"></td>
					</tr>
				</table>
				<form action="fileboardinsert.do" method="post" enctype="multipart/form-data"> <%-- 데이터 전송은 반드시  method="post" 와 enctype="multipart/form-data" ★★ --%>

					<!--게시판-->
					<div class="board_view">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<th class="top" width="17%">분류</th>
								<td class="top" colspan="3"><select name="cate_code">
								</select></td>
							</tr>
							<tr>
								<th>파일</th>
								<td colspan="3"><input type="file" name="file_name"  /> 20MB 제한
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<td colspan="3"><input type="file" name="img_name"/> 20MB 제한
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="3"><input type="password" name="file_pwd" />
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="3"><input type="text" name="file_uploader" value="<%=id %>" readonly="readonly" />
								</td>
							</tr>
						</table>
					</div>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="bottom" height="35px"><a href="fileboardlist.do"
								id="list"> <img border="0" src="images/btn_board_list.gif"
									alt="목록" /> </a></td>
							<td valign="bottom" height="35px" align="right">
							<input
								type="image" src="images/btn_board_write.gif" alt="등록">
							</td>
						</tr>
					</table>
					<!--//게시판-->
					</div>
				</form> <!-- 하단 디자인 --></td>
		</tr>
	</table>
</td>



<jsp:include page="../base/middle_end.jsp"></jsp:include>
<jsp:include page="../base/bottom.jsp"></jsp:include>
