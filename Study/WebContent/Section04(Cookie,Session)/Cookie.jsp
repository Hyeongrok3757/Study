<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	Cookie c = new Cookie("string", "ssss"); // ��Ű����
	
	c.setPath("/wp/boardlist/"); // �������� Ư�� ���͸��� ������ ex) http://localhost:8080/wp/boardlist/
	
	c.setDomain(".naver.co.kr"); // �������� �������� ������ (������ ���) ex) www1.naver.com  , www2.naver.com , www3.naver.com �� ���
	
	c.setMaxAge(3600); // ����ϰ�� 1�ʴ����� ������ ����, 0�� ��� Ÿ�Ӿƿ����Ƿ� �ٷ� ����, -1 �� ���������� ������ �����ȴ�.
	
	response.addCookie(c); // ��Ű�� ���������� ������. (������������ �ڵ����� ������)
	
	// ��Ű������ ���� ������ ������ �̸����� ��Ű�� �����ؼ� response.addCookie(�����̸�); �ϸ�ȴ�.(������ ������ ���� ��ϵ�)
	
	Cookie[] cookies = request.getCookies(); // ��Ű�� �ޱ�
	for(Cookie cookie : cookies){ // ��Ű�� �̸����� ������ ���ؼ� Ư����Ű�� ã�ƾ���
		out.print(cookie.getName()); // ��Ű�̸�
		out.print(cookie.getValue()); // ��Ű�� ��
	}
	
	// ��Ű�� ���������� ������ �����Ǿ��ִ�. �ͽ��÷η�7.0�� ��� 50�� �ʰ��ϸ� �սǵ�
	
	// �ѱ��� ���Ե� ��Ű�� �������� ������(addCookie())����   URLEncoder.encode(��Ű�̸� �̳� ��, "euc-kr") �� ��ȯ�ؼ� ��� : �ѱ� -> ��ȯ��
	// �ѱ��� ���Ե� ��Ű���� ���� ������ URLDecoder.decode(��Ű�̸��̳� ��, "euc-kr") �� ��ȯ�ؼ� ��� : ��ȯ�� -> �ѱ�
%>