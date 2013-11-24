<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	// 커스텀 액션을 만드는 방법
	// 1. 태그 파일을 작성해서 만드는 방법
	//		--> jsp페이지와 비슷한 문법으로 태그 파일을 작성 후 웹 컨테이너의 디렉터리에 저장해 놓기만 하면 된다.
	//		--> 소스 코드가 공개된다.
	//		--> HTML중심의 구조이기 때문에 디자인관련 활용이 많다. 단순한 로직에 적당함.
	//		--> 태그 파일도 웹 커테이너가 태그 클래스로 변환시킨 다음에 실행한다.
	// 2. 태그 클래스를 작성해서 만드는 방법
	//		--> 자바문법 + 태그 클래스 작성규칙으로 작성한다.( 상속하는 슈퍼클래스, 메서드 등)
	//		--> 컴파일, 웹커테이너 디렉터리에 설치, TLD파일에 등록, TLD파일을 web.xml에 등록 과정이 필요
	//		--> 소스코드가 공개되지 않는다.
	//		--> 복잡한 로직 구현에 적합.
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶1. 태그 파일을 이용한 커스텀액션 제작
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	
	// 파일이름은 "액션태그이름.tag" 형식								ex) line.tag
	// 출력내용을 작성 													ex) --------------------------------
	// 커스텀 액션의 속성을 지정.										--> tag지시자를 이용한다.
	// 한글을 포함하는 태그파일의 경우.									--> pageEncoding애트리뷰트를 사용	=> <%@tag pageEncoding="euc-kr"% > (euc-kr만 쓴다)
	// line.tag 이라는 액션의 커스텀액션 본체(body)를 사용하지 않을경우	-->	body-content애트리뷰트를 사용	=> <%@tag body-content="empty"% >
	// 		=>	<util:line> 본체내용 </util:line>  : 에러
	//		=>	<util:line/>					   : 정상처리
	// 웹 컨테이너의 디렉터리에 설치.									--> 애플리케이션디렉터리/WEB-INF/tags 또는 하위에 위치 ( WEB-INF내부로 )

	// ★ 지시자의 종류
	// 1. tag 지시자		: 웹 컨테이너가 태그파일을 처리할 때 필요한 정보를 기술
	// 2. include 지시자	: 다른 태그 파일을 포함
	// 3. taglib 지시자		: 태그 파일에서 사용할 다른 커스텀 액션의 태그 라이브러리에 대한 정보를 기술
	// 4. attribute 지시자	: 커스텀 액션의 애트리뷰트에 대한 정보를 기술
	// 5. variable 지시자	: 커스텀 액션의 변수에 대한 정보를 기술( tag파일에 선언해서 데이터를 jsp페이지에서 쓸수 있다.)
	
	// ★ JSP페이지에서 사용
	// 1. taglib 지시자를 사용한다.		--> uri가 아닌 tagdir 애트리뷰트를 이용하여 디렉터리를 지정함.(반드시 /로 시작하는 절대경로명을 지정)
	//		ex) <%@taglib prefix="util" tagdir="/WEB-INF/tags" % >
	// 2. 원하는 위치에 <util:line/> 으로 사용
	
	// ★ 애트리뷰트를 지원하는 태그파일	--> attribute지시자를 사용		ex) <%@attribute name="color" % >
	// attribute지시자를 사용하여 등록된 애트리뷰트는 스크립팅요소( <% % > )에서 자바변수처럼, EL문안에서 데이터이름으로 사용 가능	ex) <%= color % >, ${color}
	//		=> 기본적으로 문자열 타입으로 전달된다.
	//		=> 수치타입으로 전달하기 위해서는 type애트리뷰트를 사용		ex) <%@attribute name="size" type="java.lang.Integer" % >	프리미티브 타입은 쓸수 없다. 래퍼타입으로 사용
	//		=> 애트리뷰트 속성이 반드시 입력되어야 하는 경우 : required애트리뷰트를 사용	ex) <%@attribute name="size" type="java.lang.Integer" required="true" % >
	// 사용 ex) <util:line color="blue" size="25"/> : size를 안쓰면 에러발생
	
	// ★ 태그파일의 내장변수
	// 1. request		: 웹 브라우저로부터의 요청 처리
	// 2. response		: 웹 브라우저로의 응답 처리
	// 3. out			: HTML 출력
	// 4. application	: 웹 애플리케이션에 관련된 정보
	// 5. session		: 세션에 관련된 정보
	// 6. config		: 서블릿이나 JSP 페이지의 구성 정보
	// 7. jspContext	: 커스텀 액션을 사용한 JSP 페이지에 관련된 정보
	
	// ★ 동적 애트리뷰트를 지원하는 태그파일	--> attribute지시자를 쓰지 않고 모든 애트리뷰트를 한번에 선언. dynamic-attributes 애트리뷰트를 사용한다.
	// 		ex) line.tag
	//			<%@tag body-content="empty" % >
	//			<%@tag dynamic-attributes="attrs" % >	--> <이름, 값>을 java.util.Map 객체안에 저장한 후 그 객체를 전달한다.
	//			<font color="${attrs.color}">			--> ${attrs.color} 형태로 접근
	//													--> 값을 가지고 어떤 처리(스크립트 요소로)를 해야할 경우, attrs가 자바변수로 만들어지지 않기 때문에 처리가 필요하다.
	//			<%
	//					java.util.Map attrs = (java.util.Map) jspContext.getAttribute("attrs");		--> 태그파일을 사용하는 jsp페이지에서 정보를 가져온다.
	//			 		String str = (String) attrs.get("size");
	//					int size = Integer.parseInt(str);
	//					for (int cnt = 0; cnt < size; cnt++){
	//							out.print("-");
	//					}
	//			% >
	//			</font>
	//		ex) jsp 페이지 
	//			<util:line	color="blue" size="30"/>S
	//	동적 애트리뷰트를 지원하는 커스텀 액션은 JSP상에서 필요치 않은 애트리뷰트가 사용되더라도 유효성을 확인하지 않기 때문에 에러가 발생하지 않는다.
	//		ex) <util:line color="blue" size"25" style="bold"/>	: style이란 애트리뷰트가 정의되어 있지 않지만 에러는 발생하지 않는다.
	
	// ★ 커스텀 액션의 본체를 처리하는 태그 파일	--> tag지시자에 body-content애트리뷰트 값으로 "scriptless" 이나 "tagdefendent"을 사용하고 <jsp:doBody>로 본체를 사용 
	//		--> "scriptless" 	: 커스텀 액션의 본체에 스크립팅 요소를 사용하며 안된다.
	//		--> "tagdefendent"	: 커스텀 액셔의 본체의 내용(스크립틀릿, EL문, 액션)을 모두 텍스트로 취급한다.
	// 		--> <jsp:doBody>	: jsp페이지에서는 사용할 수 없고, tag 파일에서만 사용 가능
	//	ex)	box.tag
	//		<%@tag body-content="scriptless" % >
	//		<table border="1">
	//			<tr>
	//				<td>
	//					<jsp:doBody/>	=> 이곳에 본체가 위치함. ( 동일한 액션을 여러개 쓰면 갯수만큼 본체가 늘어남. )
	//				</td>
	//			</tr>
	//		</table>
	//	ex) jsp 페이지
	//		<util:box>공지사항</util:box>		--> "공지사항"이라는 본체가 태그파일의 <jsp:doBody/>에 위치한다.
	
	
	// ★ 변수를 지원하는 커스텀 액션						--> tag파일의 데이터 > jsp페이지에서 사용
	// variable 지시자를 이용해서 변수를 선언해 놓는다.		ex) <%@variable name-given="result" % >		: 기본적으로 String타입이 된다.
	// 		--> String이 아닌 타입으로 선언 : variable-class 애트리뷰트를 사용( 프리미티브 타입을 쓸수 없고 래퍼타입을 사용한다. )
	//				ex)	<%@variable name-given="result" variable-class="java.lang.Integer" % >	:	int형 변수를 사용
	//
	// 커스텀 액션 태그 파일의 변수를 jsp페이지에서 커스텀 액션 태그 본체 외에서도 사용하기 위해서는 scope 애트리뷰트를 사용
	//		ex) <%@variable name-given="result" variable-class="java.lang.Integer" scope="AT_END"% >	: NESTED(본체안), AT_BEGIN(시작태그 다음), AT_END 3가지 사용(종료태그 다음)
	// 		variable 지시자로 선언한 변수는 자바변수가 아니기 때문에 <c:set> 액션을 사용하여 값을 대입한다.	ex) <c:set var="result" value="100"/>
	// 		ex) add.tag
	//			<%@attribute name="num1" type="java.lang.Integer" % >
	//			<%@attribute name="num2" type="java.lang.Integer" % >
	//			<%@variable name-given="sum" variable-class="java.lang.Integer" scopte="AT_END" % >
	//			<%	int num3 = num1 + num2; % >
	//			<c:set var="sum" value="<%= num3 % >"/>		--> variable 지시자로 선언한 변수 sum에 값을 대입한다.(jsp에서 sum을 사용함.)
	// 		ex) jsp페이지
	//			<util:add num1="10" num2="20"/>
	//				합의 결과: ${sum}
	//
	// 커스텀 액션의 결과를 리턴하는 변수의 이름이 태그파일안에 고정되어 문제가 발생할수 있을 때 해결
	// 		ex) add.tag
	//			<%@attribute name="num1" type="java.lang.Integer" % >
	//			<%@attribute name="num2" type="java.lang.Integer" % >
	//		 	<%@attribute name="var" required="true" rtexprvalue="false" % >	:	애트리뷰트이름, 필수애트리뷰트 표시, 애트리뷰트값으로 스크립팅요소나 EL문을 쓸수 없음 표시
	//		 	<%@varialbe name-from-attribute="var" alias="sum" variable-class="java.lang.Integer" scopte="AT_END" % >	:	변수이름 sum, 태그파일내에서 사용할 이름 result
	//			<%	int num3 = num1 + num2; % >
	//		 	<c:set var="sum" value="num3"/>
	// 		ex) jsp페이지
	//		 	<util:add var="result" num1="10" num2="20"/>
	//		 		합의 결과: ${result}
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶2. 태그 클래스를 이용한 커스텀액션 제작
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// JSP1.2의 태그 클래스 작성법 : IterationTag인터페이스, BodyTag인터페이스로 구현	--> 본체안에 스크립팅 요소를 사용 가능
	// JSP2.0의 태그 클래스 작성법 : SimpleTag인터페이스로 구현							--> 본체안에 스크립팅 요소를 사용 불가
	
	// SimpleTag 인터페이스를 구현하는 태그 클래스
	// SimpleTag 인터페이스에는 모두 5개의 메서드가 있다. 
	// SimpleTagSupport 클래스 : SimpleTag인터페이스의 모든 메서드를 구현해 놓은 클래스
	
	// ★ SimpleTagSupport 클래스를 이용해서 태그 클래스를 작성하는 방법
	// 우리가 작성해야 하는 메서드는 doTag 메서드 하나뿐이다.	--> 커스텀 액션이 실행될 때 호출된다. 할일을 메서드안에 기술
	// doTag 메서드 규칙
	// 	1. public 선언
	// 	2. 파라미터가 없어야 함
	// 	3. 외부로 던질 수 있는 익셉션은 JspException, IOException
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

%>