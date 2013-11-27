<%@page import="fileboard.dto.FileBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<FileBoardDto> fileboardlist = (List<FileBoardDto>)request.getAttribute("fileboardlist");
	int count = (fileboardlist.size()/15) + 1;  // 15개보다 작게남았을때 페이지때문에 +1
	
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
<!-- 여백프레임 -->
<style type="text/css">
body { font-family: "돋움", "돋움체", "Arial";}
A:link { text-decoration:none; color: 00448B;}
A:visited { text-decoration:none; color: green;}
A:active { text-decoration:underline; color:red ;}
A:hover {color: black; text-decoration:underline;}
</style>

<td width="736" valign="top" >
	<table width="100%" cellpadding="0" cellspacing="0" >
		<!-- -------------------------------------------------------- 자유게시판 영역 삽입소스(시작) -------------------------------------------------------------------- -->
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%" border="0">
					<tr>
						<td height="20"></td>
					</tr>
					<tr >
						<td><img src="images/자료실사진.gif" alt="자료실사진"></td>
						<td align="right"><img src="images/icon_h.gif">> 커뮤니티 > 자료실</td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td height="1" colspan="2" bgcolor="cbcbcb"></td>
					</tr>
				</table>
			</td>
		</tr>
	
	<!--게시판-->
	<tr>
	<td>
	<div class="board">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<th width="70" style="padding-top: 10px; padding-bottom: 10px"> 번호 </th>
							<th > 파일 </th>
							<th width="100"> 이미지 </th>
							<th width="70"> 업로더 </th>
							<th width="70"> 등록일 </th>
							<th width="40"> 조회 </th>
						</tr>
						<tr>
							<td colspan="6" height="1" colspan="2" bgcolor="cbcbcb"></td>
						</tr>

						<c:if test="${empty fileboardlist }">
							<%-- ★ empty는 값이 있는지 없는지 판별 --%>
							<tr>
								<td colspan="5" align="center">작성된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty fileboardlist }">
							<c:forEach var="dto" items="${fileboardlist}">
								<tr >
									<td align="center">${dto.file_num }</td>
									<td><a href="fileDownload.do?file_name=${dto.file_name}">${dto.file_name}</a><img
										src="images/icon_hot.gif" alt="HOT" align="middle">
									</td>
									<td ><a href="fileDownload.do?file_name=${dto.file_fileimagesrc}" >
											<c:if test="${dto.file_fileimagesrc == null }">
													No Image
											</c:if> 
											<c:if test="${dto.file_fileimagesrc != null }">
												<img width="100" height="100" alt="다운로드" src="c:\\data/${dto.file_fileimagesrc}" />
											</c:if> 
										</a>
									</td>
									<td align="center">${dto.file_uploader }</td>
									<td align="center">${dto.file_date }</td>
									<td align="center">${dto.file_count }</td>
								</tr>
								<tr>
									<td colspan="6" height="1" colspan="2" bgcolor="cbcbcb"></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="6" >
									<table>
										<tr>
										<c:set var="count" value="<%=5 %>"></c:set>
											<c:forEach var="count" begin="1" end="${count}">
												<td><a href="fileboardselectlist.do?count=${count}">[${count }]</a></td>
											</c:forEach>
										</tr>
									</table>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
			</td>
			</tr>
			
			<tr>
			<td>
	<!--페이지넘버-->
	
	
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		function grade_check(grade) {
			if(grade <= 10) location.href="fileboardwrite.do";  // 10급이하 작성가능
			else if (grade == null){
				alert("로그인이 필요합니다");
				location.href="login.do";
			}
			else alert("쓰기등급 제한");
		}
	</script>
	
	
	
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="right" style="padding-top:10px;">
			<c:set var="grade" value="<%=grade %>"></c:set>
			<a href="#" id="write" onclick="javascript:grade_check(${grade})">
			<img border="0" src="images/btn_board_write.gif" alt="쓰기" /></a> </td>
		</tr>
	</table>
	</td>
	</tr>
	<!--//페이지넘버-->
	<!--//게시판-->
		
	<tr>
	<td>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
	</script>
	<form name="dataForm" action="fileboardsearch.do" method="post">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="center">
				<select name="search_item">
					<option value="file_name">파일이름</option>
					<option value="file_uploader">업로더</option>
				</select>
				<input name="search_value" value="" type="text" class="board_input" />
				<a href="#" onclick="javascript:submit()"><img border="0" src="images/btn_search.gif" alt="검색"  align="middle"/></a>
				<%--  <input type="submit" name="submit"/>  --%>
			</td>
		</tr>
	</table>
	</form>
	</td>
	</tr>



	</table></td>
<!-- -------------------------------------------------------- 자유게시판 영역 삽입소스(끝) -------------------------------------------------------------------- -->
<jsp:include page="../base/middle_end.jsp"></jsp:include>
<jsp:include page="../base/bottom.jsp"></jsp:include>