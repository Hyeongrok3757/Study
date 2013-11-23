<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	// JSTL( JSP Standard Tag Library )
	
	// 간단한 로직 구사 ( 자바의 변수 선언, if문, for문 등)
	// 다른 jsp페이지 호출 ( <c:redirect>, <c:import> )
	// 날짜, 시간, 숫자의 포멧
	// JSP페이지 하나로 여러 언어의 웹 페이지 생성
	// 데이터베이스로의 입력, 수정, 삭제, 조회
	// XML 문서의 처리
	// 문자열을 처리하는 함수 호출
	
	// JSTL을 구성하는 작은 라이브러리들
	// |	라이브러리	|	접두어	|	URI										|	기능
	// ---------------------------------------------------------------------------------------------------------------------------------------------------------------
	// |	코어		|	c		|	http://java.sun.com/jsp/jstl/core		|	일반 프로그래밍 언어에서 제공하는것과 유사함. 변수선언, 흐름제어, 페이지 이동 등
	// |	포매팅		|	fmt		|	http://java.sun.com/jsp/jstl/fmt		|	숫자, 날짜, 시간을 포매팅하고 국제화, 다국어 지원 기능
	// |	데이터베이스|	sql		|	http://java.sun.com/jsp/jstl/sql		|	데이터베이스의 데이터를 입력, 수정, 삭제, 조회하는 기능
	// |	XML처리		|	x		|	http://java.sun.com/jsp/jstl/xml		|	XML문서를 처리할 때 필요한 기능
	// |	함수		|	fn		|	http://java.sun.com/jsp/jstl/functions	|	문자열을 처리하는 함수를 제공

	// 선언형식 --> <%@taglib prefix="접두어" uri="URI경로" % >
	// 지시자는 jsp페이지의 위쪽에 기술하는 것이 적절하다.(강제는 아님.)
	
	// jstl의 라이브러리 : jstl.jar + standard.jar (1.1기준)
	// 톰캣 전체에서 사용하도록 하는 방법 : 톰캣설치경로/lib 에 설치
	// 특정 웹 애플리케이션에만 사용 : 톰켓설치경로/webapps/애플리케이션이름/WEB-INF/lib 에 설치
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶1. 코어 라이브러리
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// ★ <c:set> : 변수를 선언하고 초기값을 대입하는 기능	ex) <c:set var="변수이름" value="초기값" scope="저장될 영역"/> (변수타입은 쓰지않는다.)
	// XML문법을 따라야 하므로 데이터가 수치값이라도 반드시 따옴표("")로 묶어서 표시한다.
	// 자바변수가 아니라 page데이터 영역의 애트리뷰트가 된다.  --> 스크립팅(<% % >)요소로 사용할 수 없으며 EL문으로 사용가능.
	// value영역에 EL문이나 스크립팅(<% % >)영역에서 선언한 변수를 사용할수 있다. --> ex) value="${name}" , value="<%=age% >"  ( 스크립팅 요소는 잘 쓰지 않는다. )
	
	// ★ <c:remove> : 변수를 삭제한다.
	// <c:remove var="변수이름"> 						--> 4종류의 데이터영역에서 변수이름에 해당하는 데이터를 모두 지운다.
	// <c:remove var="변수이름" scope="데이터영역"> 	--> 지정된 영역에서 변수이름에 해당하는 데이터를 지운다.
	
	// ★ <c:if> : 주어진 조건에 따라 어떠 동작을 수행하도록 만든다.		ex) <c:if test="${param.num1 > param.num2}"> 동작 </c:if>
	// <c:if test="조건">	동작	</c:if>				--> 조건식은 반드시 EL문으로 기술해야 한다.(단 true, false를 직접 넣을수도 있다.)
	
	// ★ <c:choose>		: 자바의 switch 역할 	
	// ★ <c:when>		: 자바의 case절 역할
	// ★ <c:otherwise>	: 자바의 default절 역할
	//	<c:choose>
	//		<c:when test="${param.num > 0}">
	//				양수입니다.
	//		</c:when>
	//		<c:when test="${param.num < 0}">
	//				음수입니다.
	//		</c:when>
	//		<c:otherwise>
	//				0입니다.
	//		</c:otherwise>
	//	</c:choose>
	
	// ★ <c:forEach>	: 자바의 for문 역할
	
	// <c:forEach begin="시작값" end="끝값">  반복내용  </c:forEach>		--> begin과 end속성으로 시작과 끝을 제어하여 횟수를 조절
	
	// <c:forEach var="카운트변수" begin="시작값" end="끝값">  ${카운트변수}  </c:forEach>		--> var속성으로 카운터변수의 값을 쓸수 있음.
	
	// <c:forEach var="카운트변수" begin="시작값" end="끝값" step="증가치">  ${카운트변수}  </c:forEach>		--> step속성으로 증가되는 수치를 제어
	
	// <c:forEach var="배열의항목 저장변수" items="${배열이름}">  ${배열의항목 저장변수}  </c:forEach>		--> 배열의 항목을 순서대로 출력한다. var는 배열의 항목을 담는다.
	
	// items 애트리뷰트에 이용할수 있는 데이터 
	// 1.배열	2.java.util.Collection	3.java.util.Iterator	4.java.util.Enumeration		5.java.util.Map		6.콤마(,)로 구분된 항목들을 포함하는 문자열
	
	
	// ★ <c:forTokens>	: 자바의 for문과 java.util.StringTokenizer 클래스의 기능을 합친것과 같음
	// items : 토큰을 포함하는 문자열, delims : 분리에 사용할 구획문자, var : 분리된 토크을 넣을 변수 --> 3개의 애트리뷰트를 사용함.
	// items가 "고양이&개^햄스터#이구아나" 라면 delims="&%#" 처럼 구획문자를 여러개 사용하면 된다.
	// <c:forTokens var="pet" items="고양이,개,햄스터" delims=",">
	//				${pet} <br>
	// </c:forTokens>

	
	// ★ <c:catch>		: 자바의 try문과 비슷한 역할		--> 블럭안에서 에러발생시 var속성 변수에 익셉션 객체가 들어가고 catch블럭 아래로 흐름이 이동
	// <c:catch var="exception">
	//		<%= 0 / 5 % >
	// </c:catch>
	// <c:if test="${exception != null}">		--> <c:catch>블럭 바깥에서도 var속성의 객체를 사용할수 있다.
	//		${e.message}						--> 익셉션객체의 getMessage()메서드를 호출한 것이다. (프로퍼티)
	// </c:if>
	
	
	// ★ <c:redirect>	: sendRedirect 메서드와 동일한 기능
	// <c:redirect url="이동할주소"/>	--> 다른 웹자원 호출
	
	// <c:redirect url="이동할주소">
	//		<c:param name="name" value="이름"/>		--> 다른 웹 자원으로 이동하면서 데이터를 넘길 때 사용 URL뒤에 덧붙여진다.
	//		<c:param name="age" value="30"/>
	// </c:redirect>
	
	
	// ★ <c:import>		: 다른 웹 서버의 페이지나 다른 종류의 웹 자원을 현재 페이지에 포함시킨다.
	// <c:import url="호출할 페이지의 주소">
	//		<c:param name="name" value="이름"/>		--> 호출하는 웹 자원에 데이터를 넘겨주어야 할 경우에 사용
	//		<c:param name="age" value="30"/>
	// </c:import>
	
	
	// ★ <c:url>		: <c:set>과 비슷하지만 URL을 저장하기 위한 변수의 선언에 사용함.
	// <c:url var="주소이름변수" value="해당페이지의주소">
	//		<c:param name="name" value="이름"/>		--> URL뒤에 쿼리스트링 형태로 데이터를 붙일 경우에 사용
	//		<c:param name="age" value="30"/>
	// </c:url>
	// <c:redirect url="${주소이름변수}"/>		--> 조합해서 사용한 방식
	
	
	// ★ <c:out>		: 웹 브라우저에 의해 특수문자로 해석될수 있는 문자를 그대로 출력하는 기능
	// <c:out value="<input>은<form>의 서브엘리먼트입니다."/>	--> ""안의 내용 그대로 출력
	// <c:out value="<font size=7>커다란 글씨</font>" escapeXml="true"/>	--> escapeXml기능을 사용하게되면 특수문자가 이스케이프 시퀀스로 바뀌지 않는다. "커다란 글씨"로 출력됨
	// ♥♥♥ <c:out value="${데이터}" default="No Data"/>		--> 데이터의 값이 없으면 아무것도 출력하지 않는게 아니라 "No Data"라는 문자열이 출력된다.

	


	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶2. 포매팅 라이브러리
	//---------------------------------------------------------------------------------------------------------------------------------------------
	

	// ★ <fmt:formatDate>	: 날짜와 시각을 포맷
	// java.util.Date클래스 타입을 넘겨주어야 하기 때문에 Date date = new Date(); 처럼 생성을 해줘야 함.
	// <fmt:formatDate value="${date}" type="출력형태"/>	--> value값이 반드시 EL문형태로 와야한다.
	
	// <c:set var="date" values="<%= new Date() % >"/>	--> date라는 애트리뷰트를 만든다.
	// <fmt:formatDate value="${date}" type="date"/>	--> EL형식으로 value를 설정한다.																
	// => 출력: "2013. 11. 23"
	
	// <fmt:formatDate value="${date}" type="date" dateStylet="long"/>	-->  날짜 포맷형식을 dateStylet으로 설정가능. 4가지(full, long, medium, short) 	
	// => 출력: "2013년 11월 23일(토)"
	
	// <fmt:formatDate value="${date}" type="time" dateStylet="full"/>	-->  시간 포맷형식																
	// => 출력: "오후 1시 31분 42초 KST"
	
	// <fmt:formatDate value="${date}" type="both" dateStylet="full" dateStylet="long"/>	--> 시간+날짜형태(both)에서 시간,날짜를 각각 지정 			
	// => 출력: "2013년 11월 23일(토) 오후 1:31"
	
	// ♥♥♥ <fmt:formatDate value="${date}" type="date" pattern="YYYY/MM/DD (E)"/>	--> 출력패턴을 직접 설정한다. => 출력: "2013/11/23 (토)"
	// ♥♥♥ <fmt:formatDate value="${date}" type="time" pattern="(a) hh:mm:ss"/>									  => 출력: "(오후) 1:31:50"
	// ♥♥♥ <fmt:formatDate value="${date}" type="both" pattern="YYYY년 MM월 DD일 (E) a hh시 mm분 ss초"/>		  => 출력: "2013년 11월 23일 (토) 오후 01시 31분 50초"
	// ♥♥♥ <fmt:formatDate value="${date}" type="both" pattern="YYYY년 M월 D일 (E) a h시 m분 s초"/>		  		  => 출력: "2013년 8월 15일 (토) 오후 1시 31분 9초"
	
	// ★ <fmt:formatNumber>	: 수치를 포맷
	// <fmt:formatNumber value="12345000" groupingUsed="true"/>		--> 세 자리마다 쉼표 첨가	=> 출력: "12,345,000"
	// <fmt:formatNumber value="3.1" pattern="#.##"/>				--> 소수점 둘째까지 표기. #은 해당자리 숫자가 없으면 출력하지 않음.  => 출력: "3.1"
	// <fmt:formatNumber value="10.5" pattern="#.00"/>				--> 소수점 둘째까지 표기. 0은 해당자리 숫자가 없으면 0을 출력.	 	 => 출력: "10.50"
	// <fmt:formatNumber value="0.5" type="percent"/>				--> 퍼센트 단위 표기. 주어진 value값에 100을 곱한뒤 %를 붙인다.		 => 출력: "50%"
	// <fmt:formatNumber value="2500000" type="currency"/>			--> 금액 단위 표기. 주어진 value값을 금액으로 표시(해당국가화폐단위) => 출력: "원표시2,500,000"
	// <fmt:formatNumber value="2500000" type="currency" currencySymbol="$"/> --> 금액단위 앞에 붙는 화폐단위 표기를 지정함.			 => 출력: "$2,500,000"
	
	
	// ★ <fmt:setLocale> : 지역을 설정
	// <fmt:setLocale value="en"/>			--> value의값은 언어코드 en은 영어권(날짜포맷형식 등이 자동으로 변경)
	// <fmt:setLocale value="en_us"/>		--> value의값은 '언어코드_국가코드' 형태로 국가와 언어코드를 설정.(금액단위 표기 등이 자동으로 변경) *한국: ko_kr, *일본: ja_jp
	
	
	// ★ <fmt:timeZone> : 시간대를 설정		--> value의 값으로 시간대의 기준이되는 지역이름. 해당 액션범위 안에서 유효함.
	// <fmt:timeZone value="America/New_York">
	//		<fmt:formatDate values="${date}" type="date"/>	--> 미국 뉴욕의 날짜 출력
	//		<fmt:formatDate values="${date}" type="time"/>	--> 미국 뉴욕의 시간 출력
	// </fmt:timeZone>
	
	
	// ★ <fmt:setTimeZone> : 시간대를 설정	--> value의 값으로 시간대의 기준이되는 지역이름. 해당 액션 실행이후의 모든 코드에 영향을 줌.
	// <fmt:setTimeZone value="Europe/London"/>				--> 유럽 런던으로 설정
	
	
	// 다국어 지원
	// 1. 파일대표명_언어코드.properties 라는 파일로 문서를 작성.  ex) Intro_en.properties, Intro_kr.properties, Intro_jp.properties
	// 2. 내용
	//		TITLE=Welcome To HomePage
	//		BODY=Hi~!
	//	=> 내용이 영어가 아니라면 다른이름으로 만든후 ascii2native.exe를 사용하여 ASCII코드로 바꾼다. ex) .../classes>native2ascii Intro_kr.org Intro_kr.properties
	// 3. WEB-INF/classes 폴더안에 파일을 설치
	
	// ★ <fmt:setBundle> : 사용할 프로퍼티 파일을 지정하는 역할
	// <fmt:setBundle basename="Intro"/>		--> 파일대표명만 쓴다. ( 웹브라우저의 기본언어 설정에따라 프로퍼티파일을 자동으로 선택한다.)
	
	// ★ <fmt:message> : 프로퍼티 파일 안의 데이터를 가져온다.
	// <fmt:message key="TITLE"/>				--> key라는 애트리뷰트를 통해서 해당 데이터의 키를 쓰고 내용을 가져온다.	=> 출력: "Welcome To HomePage"
	// <fmt:message var="title" key="TITLE"/>	--> key에 해당하는 데이터를 var라는 애트리뷰트의 값으로 설정한다. 			=> ${title}로 사용.
	
	// ★<fmt:bundle> : 사용할 프로퍼티 파일을 지정하는 역할 및 액션 범위내에서만 사용가능. 범위를 알수있어서 가독성이 좋다.
	// <fmt:bundle basename="Intro">
	//		<fmt:message var="title" key="TITLE"/>
	//		<fmt:message var="body" key="BODY"/>
	// </fmt:bundle>
	
	// properties파일에 변수를 포함시키기
	// Intro_kr.properties에서 TITLE=WELCOME To HomePage, {0}님 {1}번째 방문입니다.
	// <fmt:message var="title" key="TITLE">
	// 		<fmt:param>khr3757</fmt:param>		--> {0}에 들어갈 값
	//		<fmt:param>10</fmt:param>			--> {1}에 들어갈 값
	// </fmt:message>
	// 이후 ${title}	=> 출력: "WELCOME To HomePage, khr3757님 10번째 방문입니다."
	
	
	// ★ <fmt:requestEncoding> : POST메서드로 전송된 한글 입력 데이터를 받기위해 사용 ( <% request.setCharacterEncoding("euc-kr"); % >같은 스크립틀릿을 쓰지않을 경우 )
	//	--> 내부적으로 setCharacterEncoding메서드를 호출한다.
	// <fmt:requestEncoding value="euc-kr"/>
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶3. 함수 라이브러리
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// ● EL문 안에서 사용할 수 있는 EL함수들의 라이브러리. 자바 JDK라이브러리의 java.lang.String클래스에 속하는 메서드들과 비슷한 기능
	
	// ★ ${fn:substring(str, index1, index2)}	--> str의 index1부터 index2 -1 까지의 부문자열을 리턴
	// ★ ${fn:substringAfter(str1, str2)}		--> str1에서 str2를 찾아서 그 후의 부문자열을 리턴
	// ★ ${fn:substringBefore(str1, str2)}		--> str1에서 str2를 찾아서 그 전의 부문자열을 리턴
	// ★ ${fn:toUpperCase(str)}					--> 모든 소문자를 대문자로 치환한 값을 리턴
	// ★ ${fn:toLowerCase(str)}					--> 모든 대문자를 소문자로 치환한 값을 리턴
	// ★ ${fn:trim(str)}						--> 문자열에서 앞뒤 공백 문자를 제거한 결과를 리턴
	// ★ ${fn:replace(str, src, dest)}			--> str 문자열에 포함된 src를 모두 dest로 치환한 결과를 리턴
	// ★ ${fn:indexOf(str1, str2)}				--> str1에 포함된 str2의 시작 인덱스를 리턴
	// ★ ${fn:startsWith(str1, str2)}			--> str1이 str2로 시작하면 true, 그렇지 않으면 false를 리턴
	// ★ ${fn:endsWith(str1, str2)}				--> str1이 str2로 끝나면 true, 그렇지 않으면 false를 리턴
	// ★ ${fn:contains(str1, str2)}				--> str1이 str2를 포함하면 true, 그렇지 않으면 false를 리턴
	// ★ ${fn:containsIgnoreCase(str1, str2)}	--> str1이 str2를 포함하면 true, 그렇지 않으면 false를 리턴. contains 함수와 달리 대소무자를 구별하지 않고 비교함
	// ★ ${fn:split(str1, str2)}				--> str1을 str2를 기준으로 분리해서 만든 부문자열들의 배열을 리턴
	// ★ ${fn:join(arr, str2)}					--> arr 배열의 모든 항목을 합쳐서 리턴, 항목 사이에 구획문자로 str2가 들어감
	// ★ ${fn:escapeXml(str)}					--> HTML 문법에 의해 특수문자로 취급되는 모든 문자를 이스케이프 시퀀스로 치환한 결과를 리턴
	// ★ ${fn:length(obj)}						--> obj가 문자열이면 문자열의 길이(공백포함), List나 Collection이면 항목의 수를 리턴
	

	
%>	