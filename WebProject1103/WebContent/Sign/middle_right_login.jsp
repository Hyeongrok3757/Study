<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:include page="../base/top.jsp"></jsp:include>
	<jsp:include page="../base/middle_start.jsp"></jsp:include>
    
    
</tr>
			<tr>
					<td><img src="images/top_img.jpg"></td>
			</tr>
<tr>    
    
    
<td  style="padding-left: 35; padding-top: 50"><script type="text/javascript" src="/common/js/sky.form.checker.js?v=201108010000"></script>
<style type="text/css">
.contents td.tab_line { border:2px solid #8cbde2; padding:30px;}
.input_text{border:1px solid #e9e9e9; height:20px; width:200px; background-color:#fafafa;}
.input_text_half{border:1px solid #e9e9e9; height:20px; width:100px; background-color:#fafafa;}
</style>

<script type="text/javascript">
	var guest = '0';

	function init()
	{
		$l($('user_login'), 'click', onUserSubmit);
		$l(document.forms['form_user_login'], 'submit', onUserSubmit);

		if(document.forms['form_user_login'].elements['user_id'].value) {
			document.forms['form_user_login'].elements['user_passwd'].focus();
		} else {
			document.forms['form_user_login'].elements['user_id'].focus();
		}
	}

	$load(init);


	function onUserSubmit(evt, obj)
	{
		Event.stop(evt);
		var form = document.forms['form_user_login'];

		if (!form.elements['user_id'].value) {
			alert('아이디를 입력해주십시오.');
			form.elements['user_id'].focus();
			return false;
		}
		if (!form.elements['user_passwd'].value) {
			alert('비밀번호를 입력해주십시오.');
			form.elements['user_passwd'].focus();
			return false;
		}

		fc_form_user_login.doSubmit();
	}
</script>


<form name="form_user_login" method="POST" action="login_process.do">
<input type="hidden" name="act" value="user.user_login_act">
<input type="hidden" name="reurl" value="">

<!-- <div id="content">  -->
		<div class="contents">
		<table cellpadding="0" cellspacing="0" align="center" width="900">
			<tr>
			<td style="padding-bottom:10px"><b>ㆍ로그인</b></td>
		</tr>
		<tr>
			<td height="1" bgcolor="efefef"></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
		</table>
	<table cellpadding="0" cellspacing="0" width="580" align="center">
		
		<tr>
			<td width="250"><img src="images/login_left_title.gif" align="absmiddle"></td>
			<td valign="top" style="padding-top:25px">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="50"><img src="images/text_id2.gif" alt="아이디" /></td>
						<td width="170"><input type="text" name="m_id" tabindex="1" value="" class="input_text_half" maxlength="20" />
								<!-- <img src="/images/basic_blue/join/icon_on.gif" alt="보안접속on" align="absmiddle" /> --></td>
						<td rowspan="2"><input type="image" src="images/btn_login.gif" id="user_login" tabindex="3"/></td>
					</tr>
					<tr>
						<td width="50"><img src="images/text_pw3.gif" alt="비밀번호" /></td>
						<td><input type="password" name="m_pwd" tabindex="2" class="input_text_half" maxlength="20" /></td>
					</tr>
					<tr>
						<td colspan="3" style="padding-left:46px"><input type="checkbox" name="user_id_save" value="1" > ID 저장</td>
					</tr>
					<tr>
						<td colspan="3" style="padding-left:5px;padding-top:17;padding-bottom:17"><img src="images/dot_line.gif" /></td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0">		
					<tr>
						<td width="205"><img src="images/text_login_1.gif" /></td>
						<td><a href="signup.do"><img border="0" src="images/btn_join2.gif" alt="회원가입" /></a></td>
					</tr>
					<tr>
						<td><img src="images/text_login_2.gif" /></td>
						<td><a href="?act=user.user_find_id"><img border="0" src="images/btn_findid.gif" alt="아이디찾기" /></a></td>
					</tr>
					<tr>
						<td><img src="images/text_login_3.gif" /></td>
						<td><a href="?act=user.user_find_pw"><img border="0" src="images/btn_findpw.gif" alt="비밀번호찾기" /></a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>				
</div>
</div>
</form>
</td>

<jsp:include page="../base/middle_end.jsp"></jsp:include>
	<jsp:include page="../base/bottom.jsp"></jsp:include>