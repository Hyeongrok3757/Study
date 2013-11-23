<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	Date date = new Date();
	long time = date.getTime();
	String filename = time + ".txt";
	PrintWriter pw = null;
	String result = null;

	try {
		String filepath = application.getRealPath("WEB-INF/data/"+ filename);
		pw = new PrintWriter(filepath);
		pw.printf("글쓴이: %s\n", writer);
		pw.printf("내용: %s\n", content);
		result = "파일쓰기 성공";
		result = URLEncoder.encode(result, "euc-kr");
	} catch (Exception e) {
		result = "파일쓰기 실패";
	} finally {
		pw.close();
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=result %>
</body>
</html>