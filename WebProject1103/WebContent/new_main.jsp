<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body { font-family: "����", "����ü", "Arial";}
A:link { text-decoration:none; color: 00448B;}
A:visited { text-decoration:none; color: green;}
A:active { text-decoration:underline; color:red ;}
A:hover {color: black; text-decoration:underline;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�׽�Ʈ ������</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
</head>
<body>

	<jsp:include page="base/top.jsp"></jsp:include>
	<jsp:include page="base/middle_start.jsp"></jsp:include>
	<jsp:include page="base/middle_left_main.jsp"></jsp:include>

	
	
	
	
	<!-- ------------------------------------------�߰� ������ ������ ���� ------------------------------------------------------------->
<td width="11">&nbsp;</td>
<!-- ���������� -->
<td width="736">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div id="main">
					<img src="images/main_visual.jpg"
						alt="������ Ŀ�´�Ƽ" />
				</div> <!--//����-->
			</td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0"
					style="padding-top: 0px; padding-bottom: 10px" width="736">
					<tr>
						<td style="padding-right: 9" valign="top" width="358px">
							<!-- �ǿ��� L -->
							<div class="noticeAreaL">
								<table border="0" cellpadding="0" cellspacing="0" width="358px">
									<tr>
										<td>
											<img alt="��������" src="images/tab_bg1.jpg">
											<img alt="�����Խ���" src="images/tab_bg1.jpg">
										</td>
									</tr>
									<tr>
										<td  height="1" bgcolor="cbcbcb"></td>
									</tr>
									<tr>
											<td colspan="3" height="110px" valign="top">
												<table border="0" width="100%">
												<c:if test="${empty freeboardlist }">
													��ϵ� ���� �����ϴ�.
												</c:if> <c:if test="${not empty freeboardlist }">
																								<%-- ��ü �ݺ���   	<c:forEach var="dto" items="${list}" >  --%>
													<c:forEach var="dto" items="${freeboardlist}" begin="0" end="4" >
														<tr>
																<td>
																	<li>&nbsp;<a
																	href="freeboarddetail.do?fb_num=${dto.fb_num }">${dto.fb_subject}</a>
																	<img src="images/icon_hot.gif" alt="HOT" align="absmiddle"></li>
																</td>
																<td align="right">${dto.fb_date }<br /></td>
														</tr>
													</c:forEach>
												</c:if>
												</table>
												<div class="layer" style="display: none" layerName="event">
													<div class="section">
														<dl>
															<dd>
																<ul>
																	<li><center>1��ϵ� ���� �����ϴ�.</center></li>
																</ul>
															</dd>
														</dl>
													</div>
												</div>
											</td>
										</tr>
								</table>
							</div> <!-- / �ǿ��� L --></td>
						<td width="1" bgcolor="cbcbcb"></td>
						<td style="padding-left: 5px" valign="top" width="358px">
							<!-- �ǿ��� R -->
							<div class="noticeAreaR">
								<table border="0" cellpadding="0" cellspacing="0" width="358px">
									<tr>
										<td>
											<img alt="�Խ���" src="images/tab_bg1.jpg">
											<img alt="�Խ���" src="images/tab_bg1.jpg">
										</td>
									</tr>
									<tr>
										<td  height="1" bgcolor="cbcbcb"></td>
									</tr>
									<tr>
										<td colspan="3" height="110px" valign="top">
											<table border="0" width="100%">
												<c:if test="${empty noticeboardlist }">
													��ϵ� ���� �����ϴ�.
												</c:if> <c:if test="${not empty noticeboardlist }">
																								<%-- ��ü �ݺ���   	<c:forEach var="dto" items="${list}" >  --%>
													<c:forEach var="dto" items="${noticeboardlist}" begin="0" end="4" >
														<tr>
																<td>
																	<li>&nbsp;<a
																	href="noticeboarddetail.do?nb_num=${dto.nb_num }">${dto.nb_subject}</a>
																	<img src="images/icon_hot.gif" alt="HOT" align="absmiddle"></li>
																</td>
																<td align="right">${dto.nb_date }<br /></td>
														</tr>
													</c:forEach>
												</c:if>
												</table>
											<div class="layer" style="display: none" layerName="free">
												<div class="section">
													<dl>
														<dd>
															<ul>
																<li><center>3��ϵ� ���� �����ϴ�.</center>
																</li>
															</ul>
														</dd>
													</dl>
												</div>
											</div></td>
									</tr>
								</table>
							</div> <!-- / �ǿ��� R --></td>
					</tr>
					<tr>
						<td height="1" colspan="3" bgcolor="cbcbcb" ></td>
					</tr>
					<tr>
						<td colspan="3">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td width="550px" valign="top">
										<!-- ���������� -->
										<div class="galleryArea">
											<table cellpadding="0" cellspacing="0" style="padding-top: 5px">
												<tr>
													<td>
															<img alt="��������" src="images/tab_bg1.jpg">
															<img alt="�����Խ���" src="images/tab_bg1.jpg">
															<img alt="��������" src="images/tab_bg1.jpg">
															<img alt="�����Խ���" src="images/tab_bg1.jpg">
													</td>
												</tr>
												<tr>
													<td background="images/tab_bg2.gif"
														height="20" align="center">
														<div class="layer" style="display: " layerName="member">
															<table border="0" cellpadding="0" cellspacing="0"
																width="250px">
																<tr>
																	<td height="10px"></td>
																</tr>
																<tr>
																	<td>
																		<table>
																			<tr>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�" title="������"><img border="0"
																						src="images/spl_2.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�" title="������"><img border="0"
																						src="images/spl2_2.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�" title="������"><img border="0"
																						src="images/spl2_1_1.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�" title="������"><img border="0"
																						src="images/spl_1_2.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�" title="������"><img border="0"
																						src="images/spl_1_1_1.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																			</tr>
																		</table></td>
																</tr>
															</table>
														</div>
														<div class="layer" style="display: none" layerName="meet">
															<table border="0" cellpadding="0" cellspacing="0"
																width="250px">
																<tr>
																	<td height="10px"></td>
																</tr>
																<tr>
																	<td>
																		<table>
																			<tr>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=16"
																					title="������"><img border="0"
																						src="images/spl_3.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=16"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=15"
																					title="������"><img border="0"
																						src="images/spl2_3.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=15"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=14"
																					title="������"><img border="0"
																						src="images/spl2_1_2.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=14"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=13"
																					title="������"><img border="0"
																						src="images/spl_1_3.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=13"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=12"
																					title="������"><img border="0"
																						src="images/spl_1_1_2.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=12"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																			</tr>
																		</table></td>
																</tr>
															</table>
														</div>
														<div class="layer" style="display: none" layerName="recom">
															<table border="0" cellpadding="0" cellspacing="0"
																width="250px">
																<tr>
																	<td height="10px"></td>
																</tr>
																<tr>
																	<td>
																		<table>
																			<tr>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=21"
																					title="������"><img border="0"
																						src="images/spl_4.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=21"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=20"
																					title="������"><img border="0"
																						src="images/spl2_4.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=20"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=19"
																					title="������"><img border="0"
																						src="images/spl2_1_3.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=19"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=18"
																					title="������"><img border="0"
																						src="images/spl_1_4.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=18"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=17"
																					title="������"><img border="0"
																						src="images/spl_1_1_3.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=17"
																					title="������"><label style="padding-left: 6px;">������</label>
																				</a></td>
																			</tr>
																		</table></td>
																</tr>
															</table>
														</div>
														<div class="layer" style="display: none" layerName="free">
															<table border="0" cellpadding="0" cellspacing="0"
																width="250px">
																<tr>
																	<td height="10px"></td>
																</tr>
																<tr>
																	<td>
																		<table>
																			<tr>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�6" title="������"><img border="0"
																						src="images/spl_1_1.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�6" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�5" title="������"><img border="0"
																						src="images/spl_1.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�5" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�4" title="������"><img border="0"
																						src="images/spl2_1.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�4" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�3" title="������"><img border="0"
																						src="images/spl2.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�3" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="�ּ�2" title="������"><img border="0"
																						src="images/spl.jpg"
																						width="90" height="70" alt="�̹���"> </a><br /> <a
																					href="�ּ�2" title="������"><label
																						style="padding-left: 6px;">������</label> </a></td>
																			</tr>
																		</table></td>
																</tr>
															</table>
														</div></td>
												</tr>
											</table>
										</div> <!-- / ���������� --></td>
									<td width="1" bgcolor="cbcbcb"></td>
									<td width="205" style="padding-top: 5px; padding-left: 20px">
									<a href="�ּ�"> <img border="0" src="images/right_ban1.gif" alt="����/���� �ı⺸��"> </a>
										<div style="padding-top: 15px">
											<a href="�ּ�"> <img border="0" src="images/right_ban2.gif" alt="���� �����"> </a>
										</div>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
</td>
<!-- ------------------------------------------�߰� ������ ������ ���� ------------------------------------------------------------->
	
	
	
	
	
	
	<jsp:include page="base/middle_end.jsp"></jsp:include>
	<jsp:include page="base/bottom.jsp"></jsp:include>
</body>
</html>