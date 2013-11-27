<%@page import="freeboard.dto.FreeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 //request.getAttribute("dto");
 pageContext.setAttribute("newLineChar","\n"); 

%>



<jsp:include page="../base/top.jsp"></jsp:include>
<jsp:include page="../base/middle_start.jsp"></jsp:include>
<jsp:include page="../base/middle_left_main.jsp"></jsp:include>



<script type="text/javascript">
function fnDel(){
	var pwd=document.getElementById("nb_pwd").value;
	if(pwd=="${dto.nb_pwd}"){
		location.href="noticeboarddelete.do?nb_num="+"${dto.nb_num}";
		
	}else{
		alert("비밀번호가 틀립니다");
	}
}
function fnupdate(){
	var pwd=document.getElementById("nb_pwd").value;
	if(pwd=="${dto.nb_pwd}"){
		location.href="noticeboardupdateform.do?nb_num="+"${dto.nb_num}";
		
	}else{
		alert("비밀번호가 틀립니다");
	}
	
}
</script>

<td>
-게시판 상세보기-
<table border="1"width="600">
<tr>
<td>작성자</td>
<td>${dto.nb_writer }</td>
</tr>
<tr>
<td>제목</td>
<td>${dto.nb_subject }</td>
</tr>
<tr>
<td>내용</td>
<td>${fn:replace(dto.nb_content,newLineChar,"<br/>")}</td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="nb_pwd" id="nb_pwd"/></td>
</tr>
<tr>
<td colspan="2" align="center">
<button>답글</button>
<input type="button" onClick="fnupdate()" value="수정"/>
<button onClick="fnDel()">삭제</button>
<button onClick="location.href='noticeboardlist.do'">리스트</button>
</td>
</tr>
</table>
</td>



<jsp:include page="../base/middle_end.jsp"></jsp:include>
	<jsp:include page="../base/bottom.jsp"></jsp:include>