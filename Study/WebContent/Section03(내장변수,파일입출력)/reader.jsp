<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String filename = request.getParameter("filename");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="write.jsp" method="post">
작성자:<input type="text" name="writer"/><br>
내용:<textarea rows="10" cols="30" name="content">
<%
	String filepath = application.getRealPath("WEB-INF/data/"+filename);
	
	FileReader fr = new FileReader(filepath);
	BufferedReader reader = new BufferedReader(fr);
	
	while(true){
		String msg = reader.readLine();
		if(msg==null) break;
		out.print(msg);
	}
%>
</textarea><br>
<input type="submit" value="파일로 저장"/>
</form>
</body>
</html>