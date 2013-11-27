<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
    <jsp:include page="../base/top.jsp"></jsp:include>
	<jsp:include page="../base/middle_start.jsp"></jsp:include>
    
    
</tr>
			<tr>
					<td><img src="images/top_img.jpg"></td>
			</tr>
<tr>
<td  style="padding-left: 35; padding-top: 50"><style type="text/css">
a {cursor:pointer;}
.contents td.tab_line_top {background:url(../../images/basic_blue/join/bg_tab_line.gif) repeat-x bottom;}
.contents td.tab_line { border:2px solid #8cbde2; padding:30px;}
.input_text{border:1px solid #e9e9e9; height:20px; width:200px; background-color:#fafafa;}
.input_text_half{border:1px solid #e9e9e9; height:20px; width:100px; background-color:#fafafa;}
.input_text_number {border:1px solid #e9e9e9; height:20px; width:40px; background-color:#fafafa;}
.contents table{border-collapse:collapse;}
.contents th{border:1px solid #dedede; padding:8px; width:120px;text-align:left;color:#929292; font:11px dotum;}
.contents td.line{border:1px solid #dedede; padding:8px; }
.red {color:red; font-size:inherit;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#chk_id').click(function(){
			var id = $('#m_id').serialize();
			$.ajax({
				url:"signup_chk_id.do",
				type:"post",
				data:id,
				dataType:"text",
				success:function(data){
					if(data.indexOf("0") != -1){    // 0�̸� ������ ���̵� �������� ����.
						alert("��밡���� ���̵��Դϴ�.");
					}else{
						alert("������� ���̵��Դϴ�.");
						$('#m_id').attr("value", "");
					}
				},
				error:function(){
					alert("�����߻�");
				}
			});
		});
		
		$("#m_email2_select").change(function(){  // �̸��� �Ĺݺ� ���ý� �ڵ� �Է�ó��
			var email2 = $(":selected").val();
			$('#m_email2').val(email2);
		});
		
		
		$('#chk_email').click(function(){
			var email = $('#m_email1').val() + '@' + $('#m_email2').val();
			var trans_email = "email="+email;
			$.ajax({
				url:"signup_chk_email.do",
				type:"post",
				data:trans_email,
				dataType:"text",
				success:function(data){
					if(data.indexOf("0") != -1){    // 0�̸� ������ �̸����� �������� ����.
						alert("��밡���� �̸����Դϴ�.");
					}else{
						alert("������� �̸����Դϴ�.");
						$('#m_email1').val("");
						$('#m_email2').val("");
					}
				},
				error:function(){
					alert("�����߻�");
				}
			});
		});
		
		
	$('#btn_join').click(function() {
			if ($('#m_name').val() == "") {
				alert("�̸��� �־��ּ���");
			} else if ($('#m_id').val() == "") {
				alert("���̵� �־��ּ���");
			} else if ($('#m_pwd').val() == "") {
				alert("��й�ȣ�� �־��ּ���");
			} else if ($('#m_pwd_check').val() == "") {
				alert("��й�ȣ Ȯ���� �־��ּ���");
			} else if ($('#m_pwd').val() != $('#m_pwd_check').val()) {
				alert("��й�ȣ�� �������� �ʽ��ϴ�. ���Է��ϼ���");
				$('#m_pwd').val("");
				$('#m_pwd_check').val("");
			} else if ($('#m_email1').val() == "") {
				alert("�̸����� �����ּ���");
			} else if ($('#m_email2').val() == "") {
				alert("�̸��� ���񽺾�ü�� �����ϰų� �����Է��ϼ���.");
			} else {
				var form = document.form_user;
				form.submit();
			}

		});
	});

	function zipfind() {
		window.open("Sign/zip.jsp", "�����ȣ","scrollbars=yes, width=450, height=300, resizable=yes, menubar=no, top=150, left=260");
		return true;
	}
</script>


<form name="form_user" action="memberInsert.do" method="post">
	<input type="hidden" id="m_grade" name="m_grade" value="10"/>
<div class="contents">
		<table cellpadding="0" cellspacing="0" align="center" width="900" >
		<tr>
			<td style="padding-bottom:10px;padding-top:20px;"><b>��ȸ������</b></td>
		</tr>
		<tr>
			<td height="1" bgcolor="efefef"></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
		</table>
		<table cellpadding="0" cellspacing="0" width="900" >
			<tr>
				<td valign="top" style="padding-bottom:30px"><img border="0" src="images/join_step3.gif"  width="900"/></td>
			</tr>			
		</table>
	</div>
			<div class="contents">
				<!-- ��Ÿ��Ʋ -->

				<!-- <div style="background:#efefef; text-align:left;"> -->
				<table cellpadding="0" cellspacing="0" width="900" align="center"
					border="0">
					<tr>
						<td height="15"></td>
					</tr>
					<tr>
						<td style="background: #ffffff; text-align: left; xpadding: 30;">
							<!-- �ʼ������׸� -->
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td style="padding-bottom: 10px"><img border="0"
										src="images/title_join.gif" />
									</td>
								</tr>
								<tr>
									<td valign="top" height="30px">���������� ��Ȯ�� ��������~~</td>
								</tr>
							</table> <!-- // ��Ÿ��Ʋ -->


							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- �̸� -->
								<tr>
									<th><img border="0" src="images/text_name.gif" alt="�̸�" align="absmiddle" /> <img border="0" src="images/icon_star.gif" align="absmiddle" /></th>
									<td class="line">
									<input type="text" id="m_name" name="m_name" value="" class="input_text_half" maxlength="20"></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- ���̵� -->
								<tr>
									<th><img border="0" src="images/text_id.gif" alt="���̵�" align="absmiddle" /> <img border="0" src="images/icon_star.gif" align="absmiddle" /></th>
									<td class="line">
									<input type="text" id="m_id" name="m_id" style="ime-mode: disabled;" class="input_text_half" maxlength="20"   /> 
									<a id="chk_id"><img border="0" src="images/btn_check.gif" alt="�ߺ�Ȯ��" align="absmiddle" />
									</a></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- ��й�ȣ -->
								<tr>
									<th><img border="0" src="images/text_pw.gif" alt="��й�ȣ"
										align="absmiddle" /> <img border="0"
										src="images/icon_star.gif" align="absmiddle" /></th>
									<td class="line">
									<input id="m_pwd" name="m_pwd" type="password"
										class="input_text_half" maxlength="20" /> <span
										class="gray_font_11">��й�ȣ �׸��� 4 ~ 20�� �̳��� �Է��� �ּ���</span></td>
								</tr>
								<!-- ��й�ȣ Ȯ�� -->
								<tr>
									<th><img border="0" src="images/text_pw2.gif" alt="��й�ȣȮ��"
										align="absmiddle" /> <img border="0"
										src="images/icon_star.gif" align="absmiddle" /></th>
									<td class="line"><input name="user_passwd_check"
										type="password" id="m_pwd_check"
										class="input_text_half" maxlength="20" /></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- �̸��� -->
								<tr>
									<th><img border="0" src="images/text_email.gif" alt="�̸���"
										align="absmiddle" /> <img border="0"
										src="images/icon_star.gif" align="absmiddle" /></th>
									<td class="line">
									
									<input  type="text" id="m_email1" name="m_email1" value="" style="ime-mode: disabled" class="input_text_half" maxlength="20" /> 
									@ 
									<input type="text" id="m_email2" name="m_email2" value="" style="ime-mode: disabled" class="input_text_half" maxlength="20" readonly /> 
										<select id="m_email2_select" >
											<option value="" selected>�����Է�</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="chol.com">chol.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="empal.com">empal.com</option>
											<option value="freechal.com">freechal.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanafos.com">hanafos.com</option>
											<option value="hanmir.com">hanmir.com</option>
											<option value="hitel.net">hitel.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="korea.com">korea.com</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
											<option value="netian.com">netian.com</option>
											<option value="paran.com">paran.com</option>
											<option value="whois.co.kr">whois.co.kr</option>
											<option value="yahoo.com">yahoo.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
									</select> <a id="chk_email"><img border="0"
											src="images/btn_check.gif" alt="�ߺ�Ȯ��" align="absmiddle" />
									</a> <input type="checkbox" name="m_emailAllow">
										<span class="gray_font_11">���ϼ��ŵ���</span></td>
								</tr>
							</table> <!-- ��Ÿ��Ʋ --> <!-- �߰��׸� -->
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td style="padding-top: 25px; padding-bottom: 10px"><img
										border="0" src="images/title_addinfo.gif" />
									</td>
								</tr>
							</table> <!-- // ��Ÿ��Ʋ -->


							<table cellpadding="0" cellspacing="0" width="100%">
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- ���� -->
								<tr>
									<th><img border="0" src="images/text_birth.gif" alt="�������"
										align="absmiddle" /></th>
									<td class="line">
									<input type="text" name="m_birthdate1" value="" class="input_text_number"
										style="width: 40px;" maxlength="4">�� 
									<input type="text" name="m_birthdate2" value=""
										class="input_text_number" style="width: 20px;" maxlength="2">��
									<input type="text" name="m_birthdate3" value=""
										class="input_text_number" style="width: 20px;" maxlength="2">��
										&nbsp; 
									<input type="checkbox" name="m_lunarSolar" >����</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- ���� -->
								<tr>
									<th><img border="0" src="images/text_gender.gif" alt="����"
										align="absmiddle" /></th>
									<td class="line"><input type="radio" name="m_sex"
										value="male" checked>���� <input type="radio"
										name="m_sex" value="female">����</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- ��ȭ -->
								<tr>
									<th><img border="0" src="images/text_phone.gif" alt="��ȭ��ȣ"
										align="absmiddle" /></th>
									<td class="line"><select name="m_tel1">
											<option value="">����</option>
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
											<option value="070">070</option>
									</select> - <input type="text" name="m_tel2"
										class="input_text_number" maxlength="4"
										onkeyup="if(this.value.length==4){chkNum(this, form_user.user_tel3);}" />
										- <input type="text" name="m_tel3"
										class="input_text_number" maxlength="4"
										onkeyup="if(this.value.length==4){chkNum(this, form_user.user_tel3);}" />
									</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- �ڵ��� -->
								<tr>
									<th><img border="0" src="images/text_phone_2.gif"
										alt="�޴���" align="absmiddle" /></th>
									<td class="line"><select name="m_mobile1">
											<option value="" selected>����</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
									</select> - 
										<input type="text" name="m_mobile2"
										class="input_text_number" maxlength="4"
										onkeyup="if(this.value.length==4){chkNum(this, form_user.user_mobile3);}" />
										- 
										<input type="text" name="m_mobile3"
										class="input_text_number" maxlength="4"
										onkeyup="if(this.value.length==4){chkNum(this, '');}" /> 
										<input
										type="checkbox" name="m_smsAllow" > <span
										class="gray_font_11">SMS ���� ����</span></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<!-- �ּ� -->
								<tr>
									<th><img border="0" src="images/text_address.gif" alt="�ּ�"
										align="absmiddle" /></th>
									<td class="line">
									<input type="text" name="user_zipcode1"
										value="" class="input_text_number"> 
										<input
										type="text" name="user_zipcode2" value="" readonly
										class="input_text_number"> 
										<span id="user_zipcode_div">
											<a href="#" onClick="zipfind()" id="find_zipcode0" mode="user">
											<img border="0" src="images/btn_zipcode.gif" alt="�����ȣ"
												align="middle" />
										</a></span> <br/>
										<input type="text"
										name="m_addr_base" value="" class="input_text" readonly="readonly"/>
										<input type="text" name="m_addr_etc" value=""
										class="input_text"></td>
								</tr>
							</table>


							<table cellpadding="0" cellspacing="0" width="100%"
								bgcolor="ffffff">
								<tr>
									<td align="center" valign="bottom" style="padding-top: 30; padding-bottom: 30;">
									<a href="#" id="btn_join">
									<img border="0" src="images/btn_submit.gif" alt="Ȯ��"/> 
									</a>
									<a href="signup_info.do" id="btn_reload">
									<img border="0" src="images/btn_return.gif" alt="�ٽ��Է�" />
									</a>
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
		</form>
</td>


<jsp:include page="../base/middle_end.jsp"></jsp:include>
	<jsp:include page="../base/bottom.jsp"></jsp:include>