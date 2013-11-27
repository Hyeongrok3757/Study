<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <jsp:include page="../base/top.jsp"></jsp:include>
	<jsp:include page="../base/middle_start.jsp"></jsp:include>


</tr>
			<tr>
					<td><img src="images/top_img.jpg"></td>
			</tr>
<tr>
<td  style="padding-left: 35; padding-top: 50">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function check() {
		var chk1 = document.getElementById("chk_prov_agree");
		var chk2 = document.getElementById("chk_priv_agree");
		if(chk1.checked && chk2.checked){
			location.href='signup_info.do';
		}else{
			alert("약관에 체크해주세요");
		}
	}
</script>


<form name="form_user_join" action="./" method="post">
<input type="hidden" name="act" value="user.user_join_agree">
<input type="hidden" name="user_jumin" value="">

<div class="contents">
	<table cellpadding="0" cellspacing="0" align="center" width="900">
		<tr>
			<td style="padding-bottom:10px"><b>ㆍ회원가입</b></td>
		</tr>
		<tr>
			<td height="1" bgcolor="efefef"></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
		</table>
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td valign="top"><img border="0" src="images/join_step1.gif"  width="900" /></td>
			</tr>
			<tr>
				<td style="padding-top:15px">
					가입을 원하시면 아래의 약관 및 개인정보 취급방침에 대한 안내를 반드시 읽고 동의해 주세요.
				</td>
			</tr>
			<tr>
				<td style="padding-top:40px;padding-bottom:10px"><img border="0" src="images/title_provision.gif" /></td>
			</tr>
			<tr>
				<td valign="top" width="100%" style="background:#efefef; text-align:left;"> 					
					<table cellpadding="0" cellspacing="0" width="860" align="center">
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td><div style="overflow: auto; text-align:left;background:#ffffff; width:880px; height: 160px; padding:20">
							
							<P>제 1 장 : 총칙 </P>
							</div>
							</td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
					</table>					
				</td>
			</tr>
			<tr>
				<td height="30px">
					<input type="checkbox" id="chk_prov_agree" name="chk_prov_agree" value="1">
					<span class="gray_font_11">이용약관에 동의합니다.</span>
				</td>
			</tr>
			<tr>
				<td style="padding-top:40px;padding-bottom:10px"><img border="0" src="images/title_privacy.gif" /></td>
			</tr>
			<tr>
				<td valign="top" width="100%" style="background:#efefef; text-align:left;"> 					
					<table cellpadding="0" cellspacing="0" width="860" align="center">
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td><div style="overflow: auto; text-align:left;background:#ffffff; width:880px; height: 180px; padding:20">
							
							- 안내란 <br/>
</div></td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
					</table>					
				</td>
			</tr>
			<tr>
				<td height="30px">
					<input type="checkbox" id="chk_priv_agree" name="chk_priv_agree" value="1">
					<span class="gray_font_11">개인정보취급방침에 동의합니다.</span>
				</td>
			</tr>
			<tr>
				<td align="center" style="padding-top:30;padding-bottom:30">
					<a href="#" onclick="javascript:check()"><img border="0" src="images/btn_join.gif" alt="회원가입" id="btn_user_join" /></a>
					<a href="main.do"><img border="0" src="images/btn_prev.gif" alt="이전으로" id="btn_user_back" /></a>
				</td>
			</tr>
		</table>
	</div>
</div>

</form>
</td>

<jsp:include page="../base/middle_end.jsp"></jsp:include>
	<jsp:include page="../base/bottom.jsp"></jsp:include>