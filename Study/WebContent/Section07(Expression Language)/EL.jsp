<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	// EL문의 목적 : 식을 계산해서 그 결과를 출력하는 것 --->  ${ 식 }
	
	// EL식에 포함된 데이터의 이름은 기본적으로 애트리뷰트의 이름으로 해석된다.   ${cnt+1}  에서 cnt는 애트리뷰트 이름
	// EL식으로 복잡한 데이터 처리로직은 안되지만 간단한 형태는 가능하다.
	
	// 산술 연산자인 -, + , *, / 과 비교 연산자인 <, >, >=, <=, != , 논리 연사자인 &&, || 등을 사용 가능

	// 기본적 사용   ${RESULT}  ,  ${RESULT + 101},  ${m:sqrt(100)}

	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// 1. 데이터 이름 하나로만 구성된 EL식 : ${RESULT}
	//---------------------------------------------------------------------------------------------------------------------------------------------

	// 애트리뷰트의 종류는 4가지가 있다  --->  pageContext 내장변수, request 내장변수, session 내장변수, application 내장변수
	// 이때 EL식 안에 데이터의 이름은 4가지의 애트리뷰트 중 어느 것으로도 해석될 수 있다.
	
	// ▶EL식안의 데이터 이름이 해석되는 순서 : page애트리뷰트 --> request애트리뷰트 --> session애트리뷰트 --> application애트리뷰트
	
	// 순서에 상관없이 특정한 종류의 애트리뷰트를 선택할 경우 : 각각의 내장객체 이름을 사용
	// ${pageScope.sum} : page 애트리뷰트
	// ${requestScope.sum} : request 애트리뷰트
	// ${sessionScope.sum} : session 애트리뷰트
	// ${applicationScope.sum} : application 애트리뷰트
	
	// ▶EL문의 내장객체
	// 속성명이 자바의 식별자 명명규칙을 따르지 않는경우에는 .연산자로 접근할수 없고 [""]로 접근한다.
	
	// ★ pageScope
	// ★ requestScope
	// ★ sessionScope
	// ★ applicationScope
	
	// ★ param : 웹 브라우저의 FORM엘리먼트를 통해서 입력된 데이터를 가져올때 사용
	// 1. ${param.num} 2. ${param["num"]} 으로 사용
	
	// ★ paramValues : 웹 브라우저의 FORM엘리먼트를 통해서 입력된 데이터가 여러개이고 이름이 같을때 사용
	// 1. ${paramValues.num[0]} 2. ${paramValues["num"][0]} 으로 사용 ( 0은 인덱스 )
	// FROM엘리먼트 속성에 동일이름의 항목이 3개일때 각각 ${paramValues["num"][0]}, ${paramValues["num"][1]}, ${paramValues["num"][2]} 로 가져오는데
	// 해당 인덱스의 항목에 데이터가 없어도 에러를 발생시키지 않고, 그냥 데이터만 출력하지 않는다.
	
	// ★ header : HTTP요청 메시지에 포함된 HTTP 헤더값을 가져올때 사용
	// 1. ${header.Host} 2. ${header["Host"]} 으로 사용 : 헤더의 이름이 자바의 식별자 명명규칙을 따르지 않는경우 1번 방법은 사용할수 없다. "User-Host" 같이  '-'같은 기호 포함의 경우임.
	
	// ★ headerValues : HTTP요청 메시지 안에 똑같은 이름의 HTTP헤더가 둘 이상의 경우 사용
	// 1. ${headerValues.Host[0]} 2. ${headerValues["Host"][0]}
	
	// ★ cookie : 웹 브라우저가 웹 서버로 보낸 쿠키를 가져올 때 사용
	// 1. ${cookie.list} 2. ${cookie["list"]} 으로 사용 : 이 때 쿠키의 객체를 가져오므로 원하는 쿠키의 값을 출력하도록 해야함 --> 뒤에 .value 또는 ["value"] 라고 연결
	// 세부속성 : value, domain, path, maxAge 등
	// ex) ${cookie.list.value} , ${cookie.list["value"]} , ${cookie["list"].domain} : 도메인명 출력 , ${cookies["list"]["path"]} : URL경로
	
	// ★ initParam : 웹 애플리케이션의 초기화 파라미터 값을 가져올 때 사용 ( web.xml에서 init-param 이 아닌 context-param 속성 )
	// 1. ${initParam.name} 2. ${initParam["name"]}
	
	// ★ pageContext : JSP페이지의 주변환경에 대한 정보를 제공, java.servlet.jsp.PageContext 타입이다.  이 클래스의 get으로 시작하고 !!파라미터가 없는!! 메서드의 기능을 사용 가능함.
	// get메서드 사용시 get글자는 떼어내고 이후 첫자를 소문자로한다. ex) getRequest메서드를 호출시 request로 한다.
	// ex) getRequest().getRequestURI()형태로 사용하려면 request.requestURI로 사용 --->  ${pageContext.request.requestURI}, ${pageContext["request"]["requestURI"]} 등
	
	

	//---------------------------------------------------------------------------------------------------------------------------------------------
	// 2. 연산자를 포함하는 EL식 : ${RESULT + 101}
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// 산술 연산자:	 + - * / % div mod
	// 비교 연산자:	 < > <= >= == != lt gt le ge eq ne
	// 논리 연산자:	 && || ! and or not
	// 조건 연산자:	 ?:
	// 엠프티 연산자:	 empty
	// 대괄호, 마침표:	 [] .
	// 괄호:			 ()
	
	// EL문에서는 문자데이터를 가지고 수치연산을 하면 자동으로 타입 변환이 발생한다. ex) ${param.num1 + param.num2}
	// <와 >는 HTML 태그기호, %는 jsp에서 스크립팅기호 등으로 쓰이는데 툴에따라 호환성을 위하여 동일한 기능을 하는 단어 연산자를 지원한다.
	
	//	 / 동일한 div
	// 	 % 동일한 mod
	//	 < 동일한 lt
	//	 > 동일한 gt
	//	 <= 동일한 le
	//	 >= 동일한 ge
	//	 == 동일한 eq
	//	 != 동일한 ne
	//	 && 동일한 and
	//	 || 동일한 or
	
	// EL문에서 비교연산자는 수치데이터 비교뿐만 아니라 문자데이터 비교에도 사용한다.
	// ex) ${gender == "female"} , ${"car" < "cat"}
	
	// EL문의 상수표현
	// 100, -5, +7, 0, 3.14, -10.1 등이며 10의 거듭제곱형식은 10E5 형태로 사용.
	// 문자열타입: 큰따옴표(""), 작은따옴표('') 으로 묶어서 사용
	// 불리언타입: true 또는 false
	// 객체타입: 없는경우 null
	// EL문에서는 char타입이 없으므로 문자하나의 상수도 문자열처럼 사용한다.
	
	// empty : 데이터의 존재 여부를 확인. ex) ${empty name ? "guest" : "name"}
	
	// []와 .
	// 배열 : 반드시 [] 사용					ex) String list = {"딸기", "사과"} 일 경우  ---> ${list[0]}
	// java.util.List : 반드시 [] 사용			ex) list.add("딸기"), list.add("사과") 일 경우  ---> ${list[0]}
	// java.util.Map : [] 또는 . 사용			ex) map.put("apple", "사과") 일 경우 ---> ${map.apple} 또는 ${map["apple"]
	// javaBean의 Property : [] 또는 . 사용
	
	// javaBean : javaBean규격서에 따라 작성된 자바 클래스 --> 파라미터가없는 생성자 필요 + 외부에서 접근시 반드시 메서드를 이용(멤버변수가 private)(메서드 이름은 get- 또는 set- 형식)
	//										    ( 이러한 데이터를 프로퍼티라고 부르며, get-과 set-타입의 메서드에서 get,set을 제거하고 첫자를 소문자로 바꾼 이름을 프로퍼티 이름으로 사용 한다.	)
	// Animal ani = new Animal();	ani.setName("고양이")  reqeust.setAttribute("animal", ani);  일 경우 --->	${animal.name} 또는 ${animal["name"]}
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// 3. 정적(static) 메서드를 포함하는 EL식 : ${RESULT}
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// 웹 컨테이너에 함수를 등록해야함
	// 1. tld파일을 생성
	// 2. 태그를 작성
	//	<taglib xmlns="http://java.sun.com/xml/ns/javaee" version="2.1">	-> TLD문법의 식별자 + 문법의 버전 ( 톰캣 6.0 기준 )
	//		<tlib-version>1.0</tlib-version>	-> 버전
	//		<short-name>math</short-name>		-> 이름
	//		<function>
	//			<name>square</name>				-> EL함수 이름
	//			<function-class>java.lang.Math</function-class>		-> 자바 클래스 이름(풀네임)
	//			<function-signature>double sqrt(double)</function-signature>	-> 정적메서드의 시그니처(반환형, 메서드이름, 파라미터 타입)(리턴타입이나 파라미터가 클래스나 인터페이스일경우 풀네임)
	//		</function>
	//	</taglib>
	// 3. 톰켓 디렉터리에 설치 ( WEB-INF 아래 아무데나 )
	// 4. web.xml에 연결( 내부에 선언 )
	//	<taglib>
	//		<taglib-uri>/functions.tld</taglib-uri>		-> TLD파일의 식별자
	//		<taglib-location>/WEB-INF/tlds/functions.tld</taglib-location>		-> TLD파일의 경로명
	//	</taglib>
	// 5. EL함수를 호출
	// jsp페이지 상단에 <%@taglib prefix="m" uri="/functions.tld" % > 지시자를 선언
	// ${m:square(4.0)}	-> EL함수이름으로 호출
	
	// 직접작성한 클래스의 정적메서드 사용방법
	// 1. 클래스파일 및 정적메서드 작성. 상단에 패키지 이름을 정해준다 ex) package util;
	// 2. WEB-INF/util 폴더에 넣는다.(class파일)
	// 3. tld파일을 만들거나 기존의 파일을 수정
	//		<function>
	//			<name>total</name>				-> EL함수 이름
	//			<function-class>util.MyMath</function-class>		-> 작성한 클래스 이름(풀네임)
	//			<function-signature>int sum(int, int)</function-signature>	-> 정적메서드의 시그니처(반환형, 메서드이름, 파라미터 타입)(리턴타입이나 파라미터가 클래스나 인터페이스일경우 풀네임)
	//		</function>
	// 4. EL함수 호출
	// jsp페이지 상단에 <%@taglib prefix="m" uri="/functions.tld" % > 지시자를 선언
	// ${m:total(4, 4)}	-> EL함수이름으로 호출
	
	
	
	
	
	

%>
