<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- ---------------------------------------- �߰� ���� ������ ���� ------------------------------------- -->
<style type="text/css">
td { font-family: "����", "����ü", "Arial";}
</style>
<td width="235" height="100%" bgcolor="f6f3ee" align="center"
	valign="top">
	<table cellpadding="0" cellspacing="0" width="235">

		<!-- ---------------------------------------- �߰� ���� ������ ��� �ڽ�(����) ------------------------------------- -->
		<tr>
			<td width="235" align="center" bgcolor="#f6f3ee" style="padding: 5px">
				<form name="login_form" action="login_process.do" method="post">
					<input type="hidden" name="act" value="user.user_login_act">
					<input type="hidden" name="reurl" value="/?act=main">
					<table id="logbox_bg" cellpadding="0" cellspacing="0" width="220px"
						height="158px"
						background="images/logbox_bg.gif"
						style="margin-top: 7px">
						<tr>
							<td valign="top" style="padding: 54px 0 0 0">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td >
											<table id="login" cellpadding="0" cellspacing="0" >
												<tr>
													<td style="padding-left: 9px"><img src="images/id.gif">
													</td>
													<td class="id" >
													<input type="text" name="m_id"
														style="width: 94px; height: 20px; border: solid 1px #ccc; font: 11px; padding: 0; margin0; line-height: 1.7em;">
													</td>
													<td rowspan="2" style="padding-left: 5px" align="center">
													<input
														type="image"
														src="images/login_btn.gif"
														alt="�α���" />
													</td>
												</tr>
												<tr>
													<td style="padding-left: 9px"><img src="images/pw.gif">
													</td>
													<td class="pw" ><input type="password" name="m_pwd"
														style="width: 94px; height: 20px; border: solid 1px #ccc; font: 11px; padding: 0; margin0; line-height: 1.7em;">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="padding: 20px 0 0 0px">
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td style="padding-left: 9px"><a href="signup.do"> <img border="0"
															src="images/join_btn.gif"> </a>
													</td>
													<td style="padding: 0 0 0 5px"><a href="�ּ�"> <img
															border="0"
															src="images/fing_btn.gif"> </a>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form></td>
		</tr>


		<!-- ---------------------------------------- �߰� ���� ������ ��� �ڽ�(��) ------------------------------------- -->

		<!-- ------------------------------------------ �߰� ���� ������ �Ϻ�(����) ------------------------------------------------------------->
		
		<tr>
			<td align="center"><a href="�ּ�"><img border="0"
					src="images/m_banner1.gif" alt="������Ӿȳ�">
			</a></td>
		</tr>
		<tr>
			<td align="center"><a href="�ּ�"><img border="0"
					src="images/m_banner2.gif" alt="������ �����λ�">
			</a></td>
		</tr>
		<tr>
			<td align="center"><img
				src="images/m_banner3.gif"
				alt="��ȭ�ֽø� ������ ģ���ϰ� �ȳ��� �帳�ϴ�"></td>
		</tr>
		<tr>
			<td align="center" >
				<table cellpadding="0" cellspacing="0" style="padding-left: 20px">
				
					<tr>
						<td height="10"></td>
					</tr>
					<tr align="left">
						<td colspan="2"><a href="�ּ�"><img border="0"
								src="images/title_rec.gif" alt="��õ������">
						</a></td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td><img src="images/rec_img1.gif">
						</td>
						
						<td style="padding-left: 5px">������</td>
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
						<td style="padding-left: 5px" width="100%">������</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</td>


<!-- ------------------------------------------���� ������ �Ϻ� (��) ------------------------------------------------------------->


<!-- ------------------------------------------�߰� ���� ������ ���� ------------------------------------------------------------->