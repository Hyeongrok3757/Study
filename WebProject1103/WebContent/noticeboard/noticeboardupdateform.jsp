<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<jsp:include page="../base/top.jsp"></jsp:include>
<jsp:include page="../base/middle_start.jsp"></jsp:include>
<jsp:include page="../base/middle_left_main.jsp"></jsp:include>

<td>-게시판 수정하기-
	<form action="noticeboardupdate.do" method="post">
		<input type="hidden" name="nb_num" value="${dto.nb_num }" />
		<table border="1" width="600">
			<tr>
				<td>제목</td>
				<td><input type="text" name="nb_subject"
					value="${dto.nb_subject}" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="nb_content">${dto.nb_content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="수정" onClick="location.href='noticeboardupdate.do'" /> 
				<input type="button" value="리스트" onClick="location.href='noticeboardlist.do'" />
				</td>
			</tr>
		</table>
	</form></td>

<jsp:include page="../base/middle_end.jsp"></jsp:include>
<jsp:include page="../base/bottom.jsp"></jsp:include>