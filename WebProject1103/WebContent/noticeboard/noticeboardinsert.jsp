<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<table cellpadding="0" cellspacing="0" width="719">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%" border="0">
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td><img src="images/title2_3.gif"></td>
						<td align="right"><img src="images/icon_h.gif">> Ŀ�´�Ƽ > ����/����</td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td height="1" colspan="2" bgcolor="cbcbcb"></td>
					</tr>
				</table>
				<form action="noticeboardinsert.do" method="post">
					

					<!--�Խ���-->
					<div class="board_view">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<th class="top" width="17%">�з�</th>
								<td class="top" colspan="3"><select name="cate_code">
								</select></td>
							</tr>
							<tr>
								<th>�۾���</th>
								<td colspan="3"><input type="text" name="nb_writer" maxlength="20" value="<%=id %>" readonly="readonly"/></td>

							</tr>
							<tr>
								<th>����</th>
								<td colspan="3"><input type="text" name="nb_subject" size="50" />
								</td>
							</tr>
							<tr>
								<th>��й�ȣ</th>
								<td colspan="3"><input type="password" name="nb_pwd" />
								</td>
							</tr>
							<tr>
								<th>����</th>
								<td colspan="3">
								<textarea width="100%" style="width: 580px; height: 200px;" name="nb_content"></textarea>

								</td>
							</tr>
							<tr>
								<th>����÷��</th>
								<td colspan="3"><a href="#" id="upload"> <img border="0"
										src="images/btn_file.gif" alt="����÷��" />
								</a>
									<div id="upload_list"></div>
									<div id="upload_db_list"></div></td>
							</tr>
							<tr>
								<th>�̸���</th>
								<td colspan="3"><input name="bbs_email[0]" value=""
									type="text" class="board_view_input_mail" /> @ <input
									name="bbs_email[1]" value="" type="text"
									class="board_view_input_mail" />
								</td>

							</tr>
						</table>







						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<br />
								<td
									style="text-align: left; border: 1px solid #e0e0e0; background-color: f9f9f9; padding: 5px">
									<div
										style="padding-top: 7px; padding-bottom: 5px; font-weight: bold; padding-left: 7px; font-family: Gulim, Tahoma, verdana;">��
										�������� ���� �� �̿뿡 ���� �ȳ�</div>
									<div style="padding-left: 10px;">
										<div
											style="width: 98%; height: 95px; font-size: 11px; letter-spacing: -0.1em; border: 1px solid #a5a5a5; background-color: #fff; padding-left: 14px; padding-top: 7px;">
											- ���
										</div>
									</div>
									<div
										style="padding-top: 7px; padding-left: 5px; padding-bottom: 7px; font-family: Gulim, Tahoma, verdana;">
										<input class="input_radio" type="checkbox"
											name="bbs_user_infoconsent" value="1"> �������� ���� �� �̿뿡
										���� �����մϴ�. </span>
									</div></td>
							</tr>
						</table>

					</div>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="bottom" height="35px"><a href="noticeboardlist.do" id="list">
							<img border="0" src="images/btn_board_list.gif" alt="���" />
							</a>
							</td>
							<td valign="bottom" height="35px" align="right"><input type="image" src="images/btn_board_write.gif" alt="���"></td>
						</tr>
					</table>
					<!--//�Խ���-->
					</div>
				</form> <!-- �ϴ� ������ --> 
			</td>
		</tr>
	</table></td>

































<jsp:include page="../base/middle_end.jsp"></jsp:include>
<jsp:include page="../base/bottom.jsp"></jsp:include>
