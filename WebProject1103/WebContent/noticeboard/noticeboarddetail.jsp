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
		alert("��й�ȣ�� Ʋ���ϴ�");
	}
}
function fnupdate(){
	var pwd=document.getElementById("nb_pwd").value;
	if(pwd=="${dto.nb_pwd}"){
		location.href="noticeboardupdateform.do?nb_num="+"${dto.nb_num}";
		
	}else{
		alert("��й�ȣ�� Ʋ���ϴ�");
	}
	
}
</script>

<td>
-�Խ��� �󼼺���-
<table border="1"width="600">
<tr>
<td>�ۼ���</td>
<td>${dto.nb_writer }</td>
</tr>
<tr>
<td>����</td>
<td>${dto.nb_subject }</td>
</tr>
<tr>
<td>����</td>
<td>${fn:replace(dto.nb_content,newLineChar,"<br/>")}</td>
</tr>
<tr>
<td>��й�ȣ</td>
<td><input type="password" name="nb_pwd" id="nb_pwd"/></td>
</tr>
<tr>
<td colspan="2" align="center">
<button>���</button>
<input type="button" onClick="fnupdate()" value="����"/>
<button onClick="fnDel()">����</button>
<button onClick="location.href='noticeboardlist.do'">����Ʈ</button>
</td>
</tr>
</table>
</td>



<jsp:include page="../base/middle_end.jsp"></jsp:include>
	<jsp:include page="../base/bottom.jsp"></jsp:include>