<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body { font-family: "돋움", "돋움체", "Arial";}
A:link { text-decoration:none; color: 00448B;}
A:visited { text-decoration:none; color: green;}
A:active { text-decoration:underline; color:red ;}
A:hover {color: black; text-decoration:underline;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>테스트 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
</head>
<body>

	<jsp:include page="base/top.jsp"></jsp:include>
	<jsp:include page="base/middle_start.jsp"></jsp:include>
	<jsp:include page="base/middle_left_main.jsp"></jsp:include>

	
	
	
	
	<!-- ------------------------------------------중간 오른쪽 프레임 시작 ------------------------------------------------------------->
<td width="11">&nbsp;</td>
<!-- 여백프레임 -->
<td width="736">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div id="main">
					<img src="images/main_visual.jpg"
						alt="후이즈 커뮤니티" />
				</div> <!--//메인-->
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
							<!-- 탭영역 L -->
							<div class="noticeAreaL">
								<table border="0" cellpadding="0" cellspacing="0" width="358px">
									<tr>
										<td>
											<img alt="공지사항" src="images/tab_bg1.jpg">
											<img alt="자유게시판" src="images/tab_bg1.jpg">
										</td>
									</tr>
									<tr>
										<td  height="1" bgcolor="cbcbcb"></td>
									</tr>
									<tr>
											<td colspan="3" height="110px" valign="top">
												<table border="0" width="100%">
												<c:if test="${empty freeboardlist }">
													등록된 글이 없습니다.
												</c:if> <c:if test="${not empty freeboardlist }">
																								<%-- 전체 반복시   	<c:forEach var="dto" items="${list}" >  --%>
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
																	<li><center>1등록된 글이 없습니다.</center></li>
																</ul>
															</dd>
														</dl>
													</div>
												</div>
											</td>
										</tr>
								</table>
							</div> <!-- / 탭영역 L --></td>
						<td width="1" bgcolor="cbcbcb"></td>
						<td style="padding-left: 5px" valign="top" width="358px">
							<!-- 탭영역 R -->
							<div class="noticeAreaR">
								<table border="0" cellpadding="0" cellspacing="0" width="358px">
									<tr>
										<td>
											<img alt="게시판" src="images/tab_bg1.jpg">
											<img alt="게시판" src="images/tab_bg1.jpg">
										</td>
									</tr>
									<tr>
										<td  height="1" bgcolor="cbcbcb"></td>
									</tr>
									<tr>
										<td colspan="3" height="110px" valign="top">
											<table border="0" width="100%">
												<c:if test="${empty noticeboardlist }">
													등록된 글이 없습니다.
												</c:if> <c:if test="${not empty noticeboardlist }">
																								<%-- 전체 반복시   	<c:forEach var="dto" items="${list}" >  --%>
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
																<li><center>3등록된 글이 없습니다.</center>
																</li>
															</ul>
														</dd>
													</dl>
												</div>
											</div></td>
									</tr>
								</table>
							</div> <!-- / 탭영역 R --></td>
					</tr>
					<tr>
						<td height="1" colspan="3" bgcolor="cbcbcb" ></td>
					</tr>
					<tr>
						<td colspan="3">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td width="550px" valign="top">
										<!-- 갤러리영역 -->
										<div class="galleryArea">
											<table cellpadding="0" cellspacing="0" style="padding-top: 5px">
												<tr>
													<td>
															<img alt="공지사항" src="images/tab_bg1.jpg">
															<img alt="자유게시판" src="images/tab_bg1.jpg">
															<img alt="공지사항" src="images/tab_bg1.jpg">
															<img alt="자유게시판" src="images/tab_bg1.jpg">
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
																					href="주소" title="갤러리"><img border="0"
																						src="images/spl_2.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소" title="갤러리"><img border="0"
																						src="images/spl2_2.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소" title="갤러리"><img border="0"
																						src="images/spl2_1_1.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소" title="갤러리"><img border="0"
																						src="images/spl_1_2.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소" title="갤러리"><img border="0"
																						src="images/spl_1_1_1.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
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
																					title="갤러리"><img border="0"
																						src="images/spl_3.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=16"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=15"
																					title="갤러리"><img border="0"
																						src="images/spl2_3.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=15"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=14"
																					title="갤러리"><img border="0"
																						src="images/spl2_1_2.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=14"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=13"
																					title="갤러리"><img border="0"
																						src="images/spl_1_3.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=13"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=12"
																					title="갤러리"><img border="0"
																						src="images/spl_1_1_2.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_meet&bbs_seq=12"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
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
																					title="갤러리"><img border="0"
																						src="images/spl_4.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=21"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=20"
																					title="갤러리"><img border="0"
																						src="images/spl2_4.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=20"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=19"
																					title="갤러리"><img border="0"
																						src="images/spl2_1_3.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=19"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=18"
																					title="갤러리"><img border="0"
																						src="images/spl_1_4.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=18"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
																				</a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=17"
																					title="갤러리"><img border="0"
																						src="images/spl_1_1_3.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="?act=board&bbs_mode=view&bbs_code=rk-0023_g_recom&bbs_seq=17"
																					title="갤러리"><label style="padding-left: 6px;">갤러리</label>
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
																					href="주소6" title="갤러리"><img border="0"
																						src="images/spl_1_1.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소6" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소5" title="갤러리"><img border="0"
																						src="images/spl_1.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소5" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소4" title="갤러리"><img border="0"
																						src="images/spl2_1.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소4" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소3" title="갤러리"><img border="0"
																						src="images/spl2.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소3" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																				<td valign="top" style="width: 90px" align="center"><a
																					href="주소2" title="갤러리"><img border="0"
																						src="images/spl.jpg"
																						width="90" height="70" alt="이미지"> </a><br /> <a
																					href="주소2" title="갤러리"><label
																						style="padding-left: 6px;">갤러리</label> </a></td>
																			</tr>
																		</table></td>
																</tr>
															</table>
														</div></td>
												</tr>
											</table>
										</div> <!-- / 갤러리영역 --></td>
									<td width="1" bgcolor="cbcbcb"></td>
									<td width="205" style="padding-top: 5px; padding-left: 20px">
									<a href="주소"> <img border="0" src="images/right_ban1.gif" alt="정보/번개 후기보기"> </a>
										<div style="padding-top: 15px">
											<a href="주소"> <img border="0" src="images/right_ban2.gif" alt="방명록 남기기"> </a>
										</div>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
</td>
<!-- ------------------------------------------중간 오른쪽 프레임 종료 ------------------------------------------------------------->
	
	
	
	
	
	
	<jsp:include page="base/middle_end.jsp"></jsp:include>
	<jsp:include page="base/bottom.jsp"></jsp:include>
</body>
</html>