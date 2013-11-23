<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    
	// Action Tag(Action) = XML기술을 이용하여 기존의 JSP문법을 확장 
	// 1. 표준 액션(standard action)	: jsp페이지에서 바로 사용		-> 접두어(prefix)로 jsp를 사용		ex) <jsp:include page="sub.sjp"/>
	// 2. 커스텀 액션(custom action)	: 별도의 라이브러리를 설치 후 사용	-> 접두어(prefix)를 지정해서 사용	ex) <c:set var="cnt" value="0"/>
	// 웹 컨테이너 쪽에서 실행되고 그 결과만 웹 브라우저로 출력된다.
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶1. 표준 액션
	//---------------------------------------------------------------------------------------------------------------------------------------------
 	
	// ★ jsp:include		-> 해당 영역에 다른 웹 자원을 포함시킨다.    ex) <jsp:include page="jsp파일이나 html파일의 주소"/>
	// jsp페이지가 실행될 때 동적으로 자원을 포함시킨다.( <%@include% >지시자는 jsp페이지가 서블릿 클래스로 변환될 때 포함되므로 서블릿 클래스의 코드 일부가 된다.)
	//	GregorianCalendar now = new GregorianCalendar();
	//	String date = String.format("%TY년 %Tm월 %Td일", now, now, now);	-> 2013년 11월 23일
	//	String time = String.format("%Tp %TR", now, now);					-> 오후 14:00
	
	// ★ jsp:forward		-> 다른 jsp페이지로 제어를 넘길때 사용.(request도 전달된다)		ex) <jsp:forward page="jsp파일"/>   
	
	// javaBean을 활용 : 자바빈 클래스는 주로 프로퍼티 값을 읽고 쓰는 기능에 초점이 맞춰져 있다.
	// ★ jsp:useBean		-> 새로운 자바빈 객체를 생성하거나 기존의 자바빈 객체를 가져오기 위한 표준액션
	//	ex) <jsp:useBean id="변수이름" class="클래스이름" scope="원하는데이터 영역"/>
	
	// ★ jsp:setProperty	-> 자바빈 프로퍼티의 값을 설정하는 표준액션
	//	ex) <jsp:setProperty name="변수이름" property="프로퍼티이름" value="프로퍼티값"/>
	
	// ★ jsp:getProperty	-> 자바빈 프로퍼티의 값을 가져다가 출력하는 표준액션
	//	ex) <jsp:getProperty name="변수이름" property="프로퍼티이름"/>		--> 액션태그 자리에 프로퍼티이름의 값이 출력된다.
	
	// 프로퍼티들의 타입은 서블릿 클래스로 변환될 때 자동으로 변환된다.
	// jsp:useBean으로 생성된 객체의 기본적인(default) 생존범위는 해당jsp이다. ( scope="page" 와 동일하다. )
	// scope속성은 page, request, session, application 의 데이터 영역을 선택해서 생존범위를 지정할 수 있다.
	// 따라서 다른 jsp등에서 사용하기 위해서는 최소 request이상을 설정해야 한다.
	
	// jsp 에서 forward	---> jsp페이지 :  scope영역을 request로 설정하고 똑같이 jsp:useBean액션을 사용한다.( 없으면 만들고 있다면 가져다 쓴다. )
	
	// servlet 에서 request에 바인딩 후 forward	---> jsp페이지 : scope영역을 request로 설정하고 jsp:useBean액션을 사용.
	
	// 웹 브라우저로부터 입력된 데이터를 자바빈 프로퍼티로 받는방법
	// 1. <jsp:setProperty name="변수이름" property="프로퍼티이름" value="<%=age % >"/>  ( 자바코드로 int형변수 age에 넣고나서 사용 ) ( 완전 비효율 안씀 )
	// 2. ♥ <jsp:setProperty name="변수이름" property="프로퍼티이름" value="${param.age}"/> ( EL문을 통하여 파라미터에 접근. 자동으로 알맞게 형변환됨 )
	// 3. ♥ <jsp:setProperty name="변수이름" property="프로퍼티이름" param="age"/>	( 브라우저에서 입력된 데이터이름만으로 접근. 자동으로 형변환 )
	// 4. ♥♥♥ <jsp:setProperty name="변수이름" property="*"/> ( 브라우저에서 입력된 모든 데이터가 똑같은 이름을 갖는 자바빈 프로퍼티에 각각 설정된다. )(설계시 동일하게 만들어야 함)
	
	// 자바빈의 다형성 활용
	// 클래스 Animal을 상속하는 Cat, Dog가 존재할 시
	// <jsp:useBean id="ani" class="my.Cat" scope="request"/>  -- cat.jsp
	// <jsp:useBean id="ani" class="my.Animal" scope="request"/>  -- animal.jsp
	// <jsp:useBean id="ani" class="my.Dog" scope="request"/>  -- dog.jsp
	// 으로 다형성이 적용되는데 만약 Animal클래스가 인터페이스 또는 추상클래스라면 class가 아닌 type 으로 바뀌어야 한다.
	// <jsp:useBean id="ani" type="my.Animal" scope="request"/>  -- animal.jsp
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶2. 그 밖에 유용한 표준 액션
	//---------------------------------------------------------------------------------------------------------------------------------------------
 	
	// 1. 애플릿을 불러오는 태그를 만드는 표준 액션
	// <jsp:plugin type="applet" code="HelloJavaApplet.class" width="200" height="100"/>  (애플릿클래스가 jsp파일과 동일한 위치에 존재시)
	
	// 애플릿이 파라미터를 필요로 한다면
	// <jsp:plugin type="applet" code="HelloJavaApplet.class" width="200" height="100">
	// 		<jsp:params>
	//			<jsp:param name="greeting" value="안녕하세요"/>
	//			<jsp:param name="font" value="궁서체"/>
	//		</jsp:params>
	// </jsp:plugin>
	
	
	// 2. 스크립팅 요소(<% % >, <%= % >, <%! % >등의 형태)를 대신하는 표준 액션
	
	// <jsp:scriptlet> int cnt = 0; </jsp:scriptlet>	-->  스크립틀릿과 동일한 역할		== <% int cnt = 0; % >
	// <jsp:expression> cnt + 1 </jsp:expression>		-->  익스프레션과 동일한 역할(EL문) == <%= cnt + 1 % >
	// <jsp:declaration> 								-->  선언부와 동일한 역할			== <%! add메서드 % >
	//		private int add(int num1, int num2){
	//			return num1+num2;
	//		}
	// </jsp:declaration>
	
	// 그 밖에 : 지시자와 같은 역할을 한다. ( 주로 프로그래머가 직접 짜는 코드가 아닌 jsp코드를 자동으로 생성하는 개발툴을 이용할때 사용한다. )
	// <jsp:directive.page contentType="text/html; charset=euc-kr"/>	--> page지시자와 동일한 역할
	// <jsp:directive.include file="sub.jsp"/>							--> include지시자와 동일한 역할
	
	
	
	
    
%>