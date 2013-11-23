<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	Cookie c = new Cookie("string", "ssss"); // 쿠키생성
	
	c.setPath("/wp/boardlist/"); // 웹서버의 특정 디렉터리로 보내기 ex) http://localhost:8080/wp/boardlist/
	
	c.setDomain(".naver.co.kr"); // 여러대의 웹서버로 보내기 (도메인 등록) ex) www1.naver.com  , www2.naver.com , www3.naver.com 일 경우
	
	c.setMaxAge(3600); // 양수일경우 1초단위로 수명을 적용, 0은 즉시 타임아웃으므로 바로 삭제, -1 은 웹브라우저가 끝날때 삭제된다.
	
	response.addCookie(c); // 쿠키를 웹브라우저로 보낸다. (브라우저측에서 자동으로 관리함)
	
	// 쿠키수정은 따로 없으며 동일한 이름으로 쿠키를 생성해서 response.addCookie(동일이름); 하면된다.(기존꺼 삭제후 새로 등록됨)
	
	Cookie[] cookies = request.getCookies(); // 쿠키들 받기
	for(Cookie cookie : cookies){ // 쿠키의 이름값을 가지고 비교해서 특정쿠키를 찾아야함
		out.print(cookie.getName()); // 쿠키이름
		out.print(cookie.getValue()); // 쿠키의 값
	}
	
	// 쿠키는 웹서버별로 개수가 한정되어있다. 익스플로러7.0의 경우 50개 초과하면 손실됨
	
	// 한글이 포함된 쿠키를 브라우저로 보내기(addCookie())전에   URLEncoder.encode(쿠키이름 이나 값, "euc-kr") 로 변환해서 사용 : 한글 -> 변환값
	// 한글이 포함된 쿠키에서 값을 빼낼때 URLDecoder.decode(쿠키이름이나 값, "euc-kr") 로 변환해서 사용 : 변환값 -> 한글
%>