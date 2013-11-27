<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String result = (String) session.getAttribute("login_check");
	String id = null;
	String grade = null;
	if (result != null) {
		id = (String) session.getAttribute("logged_id");
		grade = (String) session.getAttribute("logged_grade");
	}
	System.out.println("로그인 여부: " + result + "  아이디: " + id + "  등급: " + grade);
%>
	<c:set var="result" value="<%=result %>"></c:set>
	<c:if test="${ result == null }">
	<jsp:include page="middle_left_normal_main.jsp"></jsp:include>
	</c:if>
	<c:if test="${ result != null }">
	<jsp:include page="middle_left_logged_main.jsp"></jsp:include>
	</c:if>
