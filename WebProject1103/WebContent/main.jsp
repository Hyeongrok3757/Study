<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
<title>ABC Ȩ�������� ���� ���� ȯ���մϴ�.</title>
<!-- -------------------------------------------------------- ��Ÿ�� ����(����) -------------------------------------------------------- -->
<style type="text/css">
.notice {
	width: 240;
	xheight: 90px;
	float: left;
}

.notice li {
	margin: 7px;
	padding: 0;
	list-style: none
}

.notice dt {
	height: 25px;
}

.notice dd {
	margin: 0;
	padding: 0;
}

.galleryTab1 {
	float: left;
	width: 96px;
	height: 29px;
	cursor: pointer;
	border: 0;
	background: url(/images/rk-0078/tab_gallery1_on.gif) no-repeat left
		center;
}

.galleryTab1Off {
	float: left;
	width: 96px;
	height: 29px;
	cursor: pointer;
	border: 0;
	background: url(/images/rk-0078/tab_gallery1_off.gif) no-repeat left
		center;
}

.galleryTab2 {
	float: left;
	width: 94px;
	height: 29px;
	cursor: pointer;
	border: 0;
	background: url(/images/rk-0078/tab_gallery2_on.gif) no-repeat left
		center;
}

.galleryTab2Off {
	float: left;
	width: 94px;
	height: 29px;
	cursor: pointer;
	border: 0;
	background: url(/images/rk-0078/tab_gallery2_off.gif) no-repeat left
		center;
}
.board_pagetab { text-align:center; }
.board_pagetab a{text-decoration:none; font:12px verdana; color:#000; padding:0 3px 0 3px;}
.board_pagetab a{hover text-decoration:underline; background-color:#f2f2f2;}
.on a{ font-weight:bold;}

</style>
<!-- -------------------------------------------------------- ��Ÿ�� ����(��) -------------------------------------------------------- -->
<link rel="shortcut icon" href="" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- user common css -->
<!-- <style type="text/css">
body, td, th, div, span, input, select, textarea { font:12px dotum; color:#7c7b7b; margin: 0px; line-height:16px; }
img, th, td { border:0; }
li, ul { list-style:none; margin:0; padding:0; }
textarea { border:1px solid #d1d1d1; }
input, select, label { vertical-align:middle; }
a:link { color:#0000ff; text-decoration: none; line-height:16px; }
a:visited { text-decoration: none;  color:#0000ff; }
a:hover { text-decoration: underline;  color:#0000ff; }
a:active { text-decoration: none;  color:#0000ff; }
#warp { width:960px; }
#login { width:960px; height:7px; text-align:right; padding-top:15px; xbackground:url(/images/basic_blue/common/bg_login.gif) no-repeat;}
#logo { width:88px; height:36px; xbackground:url(/images/basic_blue/common/bg_logo.gif) no-repeat; }
#main { width:960px; height:326px;}
#content { width:100%; margin:30px 0px 30px 0px; }
</style> -->
<!-- DEFAULT HEAD AREA -->
<link href='/tpl/common.css?v=201108010000' type='text/css'
	rel='stylesheet' />
<link href='/common/js/jquery/theme/jquery.theme.css?v=201108010000'
	type='text/css' rel='stylesheet' />
<script type='text/javascript'
	src='/common/js/sky.rama.js?v=201108010000'></script>
<script type='text/javascript'
	src='/common/js/jquery/jquery.custom.js?v=201108010000'></script>
<script type='text/javascript'
	src='/common/js/durian.common.js?v=201108010000'></script>
<script type='text/javascript'
	src='/common/js/jquery/jquery-ui.custom.min.js?v=201108010000'></script>
<!-- /DEFAULT HEAD AREA -->
<!-- user common css -->
<link rel="stylesheet" href="/images/rk-0078/css/style.css"
	type="text/css" media="screen" />
<!-- js -->

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	// global
	var SITE_ID = 'whoisagency';
	var IMG_SERVER = '';
</script>
<!-- -------------------------------------------------------- jQuery �߰� ����(����) -------------------------------------------------------- -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#testbtn').click(function() {
			$.ajax({
				url : "FreeBoardList.do",   // �����Խ��� ȣ��
				dataType : "text", 
				success : function(data) {
					change_FreeBoard(data);
				},
				error : function() {
					alert("����");
				}
			});
		});
	});
	
	function change_FreeBoard(data) {
		$('#src_main_img').empty(); // ���λ��� ��� �����
		$('#src_main_img').append("<img src='images/top_img.jpg'>"); // �����Խ��� ��� ����
		$('#test1').attr('width', '720');
		$('#test1').empty();  // �߾���ºκ� ����
		$('#test1').append(data); // �߾���ºκп� �����Խ��� ���� ���
		$('#test2').hide();  // ������ ����
	}
</script>
<!-- -------------------------------------------------------- jQuery �߰� ����(��) -------------------------------------------------------- -->
</head>
<body style="background-color: #FFFFFF;">
	<table cellpadding="0" cellspacing="0" width="100%" align="center">
		<tr>
			<td align="center">
				<table cellpadding="0" cellspacing="0" width="100%" align="center">
					<tr>
						<td height="35" bgcolor="f7f7f7" align="center">
							<table width="960" cellspacing="0" cellpadding="0">
								<tr>
									<td align="right" style="font-size: 12px"><span style="color: #6a6a6a"><a href="index.html"><span style="color: #6a6a6a"><b>Ȩ����</b></span>
										</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/?act=user.user_join_agree">ȸ������</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
											href="/?act=user.user_login">�α���</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
											href="/?act=info.sitemap">����Ʈ��</a>
									</span></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td bgcolor="a68257" align="center" height="1"></td>
					</tr>
					<tr>
						<td align="center" height="55">
							<table width="1000" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="240"><div id="L_SITE_LOGO">
											<table border="0" cellspacing="0" cellpadding="0"
												width="100%">
												<tr>
													<td align="center" height="70"><a href="index.html"><img
															src="images/logo_1.gif" border="0">
													</a>
													</td>
												</tr>
											</table>
										</div>
									</td>
									<td width="20"></td>
									<td width="740"><script type="text/javascript">
										$load(function() {
											$l(
													$qList('#navi .navi_main .navi_main_obj'),
													'mouseover',
													function(evt, obj) {
														Event.stop(evt);

														var selCode = obj
																.getAttribute('subcode');
														var subCode = null;

														$qList(
																'#navi .navi_main .navi_main_obj')
																.each(
																		function(
																				obj) {
																			subCode = obj
																					.getAttribute('subcode');

																			if (selCode == subCode) {
																				if ($q('.navi_sub_'
																						+ subCode)) {
																					Element
																							.show($q('#navi .navi_sub_'
																									+ subCode));
																				}
																			} else {
																				if ($q('.navi_sub_'
																						+ subCode)) {
																					Element
																							.hide($q('#navi .navi_sub_'
																									+ subCode));
																				}
																			}
																		});
													});
										});
									</script>

										<div id="navi">
											<div class="navi_main">
												<a href="/?act=info.company_info"> <img
													src="images/menu1.gif" alt="��ȣȸ�Ұ�" class='navi_main_obj'
													subcode='1' /> </a> <a href="/?act=board&bbs_code=notice"><img
													src="images/menu2.gif" alt="��ȣȸ�" class='navi_main_obj'
													subcode='2' /> </a> <a
													href="/?act=board&bbs_code=rk-0078_greeting"><img
													src="images/menu3.gif" alt="Ŀ�´�Ƽ" class='navi_main_obj'
													subcode='3' /> </a> <a
													href="/?act=board&bbs_code=rk-0078_gallery"><img
													src="images/menu4.gif" alt="������" class='navi_main_obj'
													subcode='4' /> </a> <a
													href="/?act=board&bbs_code=rk-0078_webzine"><img
													src="images/menu5.gif" alt="��������" class='navi_main_obj'
													subcode='5' /> </a>
											</div>

											<div class="navi_sub_1"
												style='display: none; text-align: center'>
												<span class="txt_sub"><a
													href="/?act=info.company_info">��ȣȸ �Ұ�</a> </span>
											</div>

											<div class="navi_sub_2"
												style='display: none; text-align: center'>
												<span class="txt_sub"><a
													href="/?act=board&bbs_code=notice">��������</a><br/ > <a
													href="/?act=board&bbs_code=rk-0078_club_news">Ŭ���ҽ�</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_intro">����Ұ�</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_plan">�ֿ����</a><br/ >
													<a href="/?act=board&bbs_code=faq">FAQ</a> </span>
											</div>

											<div class="navi_sub_3"
												style='display: none; text-align: center'>
												<span class="txt_sub"><a
													href="/?act=board&bbs_code=rk-0078_greeting">�����λ�</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_check">�⼮üũ</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_meet">����/�����Խ���</a><br/ >
													<a href="FreeBoardList.do">�����Խ���</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_qna">������ϱ�</a> </span>
											</div>

											<div class="navi_sub_4"
												style='display: none; text-align: center'>
												<span class="txt_sub"><a
													href="/?act=board&bbs_code=rk-0078_gallery">���䰶����</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_photo">��������</a> </span>
											</div>

											<div class="navi_sub_5"
												style='display: none; text-align: center'>
												<span class="txt_sub"><a
													href="/?act=board&bbs_code=rk-0078_webzine">ȸ���ҽ���</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_press">�����ڷ�</a><br/ >
													<a href="/?act=board&bbs_code=rk-0078_data">�ڷ��</a> </span>
											</div>
										</div> <!--//�׺�--></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td align="center">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td align="center">
 <script type="text/javascript">
	jQuery(document).ready(function() {

		// �ǿ��� ����(class ��Ī ���)
		initBbsTab("galleryArea");
	});

	function initBbsTab(targetCls) {
		jQuery("." + targetCls + " input[type=button]")
				.each(
						function() {

							jQuery(this).attr('classOn',
									jQuery(this).attr('class')).attr(
									'classOff',
									jQuery(this).attr('class') + 'Off');

							jQuery(this)
									.addClass(jQuery(this).attr('classOff'));
							jQuery(this)
									.click(
											function() {
												if (jQuery(this).hasClass(
														jQuery(this).attr(
																'classOff'))) {
													jQuery(
															"."
																	+ targetCls
																	+ " input[type=button]")
															.each(
																	function() {
																		jQuery(
																				this)
																				.addClass(
																						jQuery(
																								this)
																								.attr(
																										'classOff'));
																	});
													jQuery(this)
															.removeClass(
																	jQuery(this)
																			.attr(
																					'classOff'));
													jQuery(
															"." + targetCls
																	+ " .layer")
															.hide();
													jQuery(
															"."
																	+ targetCls
																	+ " .layer[layerName="
																	+ jQuery(
																			this)
																			.attr(
																					"targetLayerName")
																	+ "]")
															.show();
												}
											});
						});
		jQuery("." + targetCls + " input[type=button]:first").removeClass(
				jQuery("." + targetCls + " input[type=button]:first").attr(
						'classOff'));
		jQuery("." + targetCls + " .layer").hide();
		jQuery(
				"."
						+ targetCls
						+ " .layer[layerName="
						+ jQuery("." + targetCls + " input[type=button]:first")
								.attr("targetLayerName") + "]").show();
	}
</script>
										<table cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td align="center" height="267"
													background="images/top_bg.gif" width="100%">
													<table width="960" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="200" background="images/left_bg.gif"
																height="267" valign="top" align="center">
																<table width="182" border="0" cellspacing="0"
																	cellpadding="0" align="center">
																	<tr>
																		<td height="27"></td>
																	</tr>
																	<tr>
																		<td colspan="2" align="center"><img
																			src="images/tit_login.gif">
																		</td>
																	</tr>
																	<tr>
																		<td height="10"></td>
																	</tr>
																</table> <!-- �α�����--> <!--CALL : L_LOGIN_FORM : basic_blue-->
																<table width="182" border="0" cellspacing="0"
																	cellpadding="0" align="center">
																	<form name="login_form" action="/" method="post">
																		<input type="hidden" name="act"
																			value="user.user_login_act"> <input
																			type="hidden" name="reurl" value="/?">
																		<tr>
																			<td><input type="text" name="user_id"
																				class="input_login" style="width: 115px">
																			</td>
																			<td rowspan="2"><input type="image"
																				src="images/btn_login.gif" alt="�α���"
																				align="absmiddle" />
																			</td>
																		</tr>
																		<tr>
																			<td><input type="password" name="user_passwd"
																				class="input_login" style="width: 115px">
																			</td>
																		</tr>
																		<tr>
																			<td height="5"></td>
																		</tr>
																		<tr>
																			<td colspan="2" style="font-size: 12px" ><span style="color: #67481c"><b><a
																						href="/?act=user.user_join_agree">ȸ������</a>
																				</b> | <a
																					href="/?act=user.user_find_id">���̵�</a>/<a
																					href="/?act=user.user_find_pw">��й�ȣã��</a></span>
																			</td>
																		</tr>
																	</form>
																</table> <!-- DEFAULT SSL AREA --> <script
																	type="text/javascript"
																	src="/ssl/library/js/init_pack.js?v=201108010000"></script>
																<!--/ DEFAULT SSL AREA --> <script
																	type="text/javascript">
																	jQuery(
																			'form[name=login_form]')
																			.submit(
																					function() {
																						var fc_login_form = new Form.Checker(
																								{
																									'form' : 'login_form'
																								});
																						fc_login_form.form.useSSL = true;
																						fc_login_form
																								.doSubmit();
																						return false;
																					});
																</script> <!-- //�α�����-->
																<table width="182" border="0" cellspacing="0"
																	cellpadding="0">
																	<tr>
																		<td height="10"></td>
																	</tr>
																	<tr>
																		<td height="1" bgcolor="a68257"></td>
																	</tr>
																	<tr>
																		<td height="30"></td>
																	</tr>
																	<tr>
																		<td align="center">
																			<a href="/?act=info.company_info"><img src="images/quick_1.gif" width="53"></a>
																			<a href="/?act=board&bbs_code=rk-0078_greeting"><img src="images/quick_2.gif" width="54"></a>
																			<a href="/?act=board&bbs_code=faq"><img src="images/quick_3.gif" width="53"></a>
																		</td>
																	</tr>
																</table></td>
															<td id="src_main_img"><img src="images/main_img.jpg">
															</td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td align="center">
													<table width="960" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="200" background="images/left_bg2.gif"
																height="100%" valign="top" align="center">
																<table border="0" cellspacing="0" cellpadding="0"
																	width="194">
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=notice"><span
																				style="color: #ffffff">��������</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_club_news"><span
																				style="color: #ffffff">Ŭ���ҽ�</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_intro"><span
																				style="color: #ffffff">����Ұ�</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_plan"><span
																				style="color: #ffffff">�ֿ����</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=faq"><span
																				style="color: #ffffff">FAQ</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_greeting"><span
																				style="color: #ffffff">�����λ�</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_check"><span
																				style="color: #ffffff">�⼮üũ</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_meet"><span
																				style="color: #ffffff">����/���� �Խ���</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td id="testbtn" class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;
																			<span style="color: #ffffff">�����Խ���</span>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_qna"><span
																				style="color: #ffffff">������ϱ�</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_gallery"><span
																				style="color: #ffffff">���䰶����</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_photo"><span
																				style="color: #ffffff">��������</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_webzine"><span
																				style="color: #ffffff">ȸ���ҽ���</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_press"><span
																				style="color: #ffffff">�����ڷ�</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="l_menu_bg"
																			background="images/left_menu_bg.gif" height="28">&nbsp;&nbsp;<a
																			href="/?act=board&bbs_code=rk-0078_data"><span
																				style="color: #ffffff">�ڷ��</span>
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td height="45"></td>
																	</tr>
																</table></td>
		<!-- -------------------------------------------------------- ����κ� ��輱(����) -------------------------------------------------------------------- -->
		
															<td id="test1" width="561" style="padding-top: 30px" valign="top">
																<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td width="15"></td>
																		<td width="259" valign="top">
																			<table border="0" cellspacing="0" cellpadding="0"
																				width="259">
																				<tr>
																					<td class="tit_bg" background="images/tit_bg.gif"
																						height="28">��������</td>
																				</tr>
																				<tr>
																					<td style="padding-left: 10px" height="10" valign="top">
																						<div class="notice">
																							<table>
																							<tr>
																								<td>�߰�����</td>																						
																							</tr>
																							<tr>
																								<td>�߰�����</td>																							
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							<tr>
																								<td>�߰�����</td>																						
																							</tr>
																							</table>
																						</div>
																					</td>
																				</tr>
																			</table>
																			<table border="0" cellspacing="0" cellpadding="0"
																				width="259">
																				<tr>
																					<td height="20"></td>
																				</tr>
																				<tr>
																					<td class="tit_bg" background="images/tit_bg.gif"
																						height="28">����/���� �Խ���</td>
																				</tr>
																				<tr>
																					<td style="padding-left: 10px" height="10"
																						valign="top">
																						<div class="section_ul">
																							<table>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							</table>
																						</div></td>
																				</tr>
																			</table></td>
																		<td width="13"></td>
																		<td width="259" valign="top">
																			<table border="0" cellspacing="0" cellpadding="0"
																				width="259">
																				<tr>
																					<td class="tit_bg" background="images/tit_bg.gif"
																						height="28">�����Խ���</td>
																				</tr>
																				<tr>
																					<td style="padding-left: 10px" height="10"
																						valign="top">
																						<div class="section_ul">
																							<table>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							</table>
																						</div></td>
																				</tr>
																			</table>
																			<table border="0" cellspacing="0" cellpadding="0"
																				width="259">
																				<tr>
																					<td height="20"></td>
																				</tr>
																				<tr>
																					<td class="tit_bg" background="images/tit_bg.gif"
																						height="28">�����ڷ�</td>
																				</tr>
																				<tr>
																					<td style="padding-left: 10px" height="10"
																						valign="top">
																						<div class="section_ul">
																							<table>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							<tr>
																								<td>�߰�����</td>
																							</tr>
																							</table>
																						</div></td>
																				</tr>
																			</table></td>
																		<td width="15"></td>
																	</tr>
																</table>
																<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td height="20"></td>
																	</tr>
																	<tr>
																		<td width="15"></td>
																		<td width="531">
																			<div class="galleryArea">
																				<table cellpadding="0" cellspacing="0">
																					<tr>
																						<td background="images/tab_gallery_bg.gif">
																						<input type="button" class="galleryTab1" targetLayerName="gallery" /> 
																						<input type="button" class="galleryTab2" targetLayerName="photo" /></td>
																						<td width="341" height="29"
																							background="images/tab_gallery_bg.gif"></td>
																					</tr>
																					<tr>
																						<td colspan="2" align="center">
																							<div class="layer" style="display: "
																								layerName="gallery">
																								<!--CALL : L_GALLERY_USER : basic_blue-->
																								<table border="0" cellpadding="0"
																									cellspacing="0" width="250px">
																									<tr>
																										<td height="10px"></td>
																									</tr>
																									<tr>
																										<td>
																											<table>
																												<tr>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="���䰶����"><img
																															src="images/spl_4.jpg" width="100"
																															height="142" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="���䰶����"><label
																															style="padding-top: 3px">���䰶����</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="���䰶����"><img
																															src="images/spl_3.jpg" width="100"
																															height="142" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="���䰶����"><label
																															style="padding-top: 3px">���䰶����</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="���䰶����"><img
																															src="images/spl_2.jpg" width="100"
																															height="142" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="���䰶����"><label
																															style="padding-top: 3px">���䰶����</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="���䰶����"><img
																															src="images/spl_1.jpg" width="100"
																															height="142" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="���䰶����"><label
																															style="padding-top: 3px">���䰶����</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="���䰶����"><img src="images/spl.jpg"
																															width="100" height="142" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="���䰶����"><label
																															style="padding-top: 3px">���䰶����</label>
																													</a></td>
																												</tr>
																											</table></td>
																									</tr>
																								</table>
																							</div>
																							<div class="layer" style="display: none"
																								layerName="photo">
																								<!--CALL : L_GALLERY_USER : basic_blue-->
																								<table border="0" cellpadding="0"
																									cellspacing="0" width="250px">
																									<tr>
																										<td height="10px"></td>
																									</tr>
																									<tr>
																										<td>
																											<table>
																												<tr>
																													<td valign="top" style="width: 97px"
																														align="center"><a href="" title="�����"><img
																															src="images/11.JPG" width="97" height="70"
																															alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="�����"><label
																															style="padding-top: 3px">�����</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="��������"><img
																															src="images/spl_5.jpg" width="97"
																															height="70" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="��������"><label
																															style="padding-top: 3px">��������</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="��������"><img
																															src="images/spl_1_1.jpg" width="97"
																															height="70" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="��������"><label
																															style="padding-top: 3px">��������</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="��������"><img
																															src="images/spl_2_1.jpg" width="97"
																															height="70" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="��������"><label
																															style="padding-top: 3px">��������</label>
																													</a></td>
																													<td valign="top" style="width: 97px"
																														align="center"><a href=""
																														title="��������"><img
																															src="images/spl_3_1.jpg" width="97"
																															height="70" alt="�̹���">
																													</a>
																													<div style="padding-top: 5px"></div>
																														<a href="" title="��������"><label
																															style="padding-top: 3px">��������</label>
																													</a></td>
																												</tr>
																											</table></td>
																									</tr>
																								</table>
																							</div></td>
																					</tr>
																				</table>
																			</div></td>
																		<td width="15"></td>
																	</tr>
																</table></td>
															<td id="test2" width="199" style="padding-top: 30px"
																valign="top">
																<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><a
																			href="/?act=board&bbs_code=rk-0078_webzine"><img
																				src="images/r_banner1.gif">
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td style="padding-top: 7px"><a
																			href="/?act=board&bbs_code=rk-0078_greeting"><img
																				src="images/r_banner2.gif">
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td style="padding-top: 7px"><a
																			href="/?act=board&bbs_code=rk-0078_data"><img
																				src="images/r_banner3.gif">
																		</a>
																		</td>
																	</tr>
																	<tr>
																		<td style="padding-top: 7px"><a
																			href="/?act=board&bbs_code=rk-0078_check"><img
																				src="images/r_banner4.gif">
																		</a>
																		</td>
																	</tr>
																</table></td>
			
																
		<!-- -------------------------------------------------------- ����κ� ��輱(��) -------------------------------------------------------------------- -->
														</tr>
													</table></td>
											</tr>
										</table>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td bgcolor="a68257" align="center" height="1"></td>
		</tr>
		<tr>
			<td height="100" bgcolor="f7f7f7" align="center"><table
					width="960" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center"><span style="color: #6a6a6a"><b><a
									href="/?act=info.privacy">����������ȣ��å</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
									href="/?act=info.no_email_collect">�̸����ּҹ��ܼ����ź�</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
									href="/?act=info.provision">�̿���</a>
							</b>
						</span>
						</td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td align="center" class="txt_btm">����ڵ�Ϲ�ȣ: 123-45-67890
							&nbsp;&nbsp; Tel. 01)234-5678 &nbsp;&nbsp; Fax. 01)234-5678
							&nbsp;&nbsp; E-mail. abc@abc.com<br /> Copyright &copy; 2013 All
							rights reserved. Design by WHOISDESK.</td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>