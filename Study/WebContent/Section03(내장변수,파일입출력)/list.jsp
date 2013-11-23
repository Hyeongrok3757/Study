<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String dirpath = application.getRealPath("WEB-INF/data");
	File dir = new File(dirpath);
	String[] files = dir.list();
	
	for(String file : files){
		out.print("<a href='reader.jsp?filename="+file+"'>"+file+"</a><br>");
	}
%>
</body>
</html>