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
	// 슈퍼클래스인 SimpleTagSupport로부터 상속받은 getJspContext 메서드를 호출하여 JspContext객체를 얻은뒤 getOut 메서드를 호출하여 JspWriter 객체를 얻는다.
	//		--> JspWriter 객체를 이용하여 출력문을 작성.
	// 기본형태
	// ex) 	public class LineTag extends SimpleTagSupport {					--> SimpleTagSupport 클래스를 상속
	//			public void doTag() throws JspException, IOException {		--> public, 파라미터 없음, JspException + IOException
	//				JspContext context = getJspContext();					--> 커스텀액션을 사용한 JSP 페이지에 관한 정보가 들어있는 JspContext 객체
	//				JspWriter out = context.getOut();						-->	브라우저로 HTML을 출력할 JspWriter 객체
	//				out.println("--------------------<br>");				--> 출력문
	//				return;
	//			}
	//		}
	// 컴파일시 javax.servlet.jsp 와 javax.servlet.jsp.tagext 패키지가 필요함
	//		--> 톰캣의 lib 디렉터리에 이쓴 jsp-api.jar 파일을 JDK의 jre/lib/ext 디렉터리에 설치하면 된다.
	// 클래스파일은 애플리케이셔디렉터리/WEB-INF/classes나 하위에 위치시킨다.		ex) /WEB-INF/classes/tool
	// 등록과정
	// 		--> 1. TLD파일에 등록	: /WEB-INF/나 하위 디렉터리에 저장(단, classes나 lib또는 tags 서브디렉터리 아래는 안됨)
	//				tools.tld
	//				<taglib xmlns="http://java.sun.com/xml/ns/javaee" version="2.1">
	//					<tlib-version>1.0</tlib-version>					--> TLD파일의 버전
	//					<short-name>tool</short-name>						--> TLD파일의 이름
	//					<tag>
	//						<name>Line</name>								--> 커스텀 액션의 이름
	//						<tag-class>tool.LineTag</tag-class>				--> 태그 클래스의 이름
	//						<body-content>empty</body-content>				--> 본체의 형태
	//					</tag>
	//				</taglib>
	//		--> 2. web.xml에 TLD파일을 등록
	//				<taglib>
	//					<taglib-uri>/taglibs/tools.tld</taglib-uri>					--> TLD파일을 식별하는 URI (원하는대로)
	//					<taglib-location>/WEB-INF/tlds/tools.tld</taglib-location>	--> TLD파일의 경로명
	//				</taglib>
	
	
	// ★ 애트리뷰트가 있는 커스텀 액션을 만드는 태그 클래스
	// 태그 클래스의 경우에 각각의 애트리뷰트 값을 받는 메서드를 따로 선언해야 함
	// 	1. public
	//	2. 메서드의 이름은 set으로 시작하고 애트리뷰트의 본래 이름에 첫번째 문자를 대문자로 바꾼 이름을 붙인다.
	//	3. 애트리뷰트 값을 받기위한 파라미터 변수도 선언
	//		ex)	public class LineTag extends SimpleTagSupport {
	//				private String color;
	//				...
	//				public void setColor(String color) {
	//					this.color = color;					--> 애트리뷰트 값을 필드에 저장
	//				}
	//			}
	//	TLD파일에 <attribute> 엘리머트를 추가해야 함
	//		ex)	<taglib xmlns="http://java.sun.com/xml/ns/javaee" version="2.1">
	//				<tlib-version>1.0</tlib-version>					
	//				<short-name>tool</short-name>						
	//				<tag>
	//					<name>Line</name>								
	//					<tag-class>tool.LineTag</tag-class>				
	//					<body-content>empty</body-content>				
	//				</tag>
	//				<tag>
	//					<name>newLine</name>							
	//					<tag-class>tool.NewLineTag</tag-class>			
	//					<body-content>empty</body-content>				
	//					<attribute>							--> attribute 엘리머트 추가
	//						<name>color</name>				--> 애트리뷰트의 이름
	//						<type>java.lang.String</type>	--> 애트리뷰트의 타입
	//						<rtexprvalue>true</rtexprvalue>	--> 커스텀 액션의 애트리뷰트 값에 익스프레션(<%=변수 % >)이나 EL문(${변수})을 쓸수 있는지 여부를 결정
	//					</attribute>
	//				</tag>
	//			</taglib>
	
	
	// ★ 동적 애트리뷰트를 지원하는 태그 클래스
	// 명시적으로 선언되지 않은 애트리뷰트를 사용해도 오류가 발생하지 않는 문법적 유연성
	// setDynamicAttribute 라는 이름의 메서드만 선언하면 된다. 애트리뷰트 하나하나에 대해 이 메서드가 한번씩 호출된다.
	//		ex)	public class LineTag extends SimpleTagSupport implements DynamicAttributes {
	//				private Map<String, Object> attrs = new HashMap<String, Object>();			--> 애트리뷰트들의 이름과 값을 저장할 Map타입 필드
	//				public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {	--> uri:네임스페이스, localName:애트리뷰트이름, value:값
	//					attrs.put(localName, value);											--> 애트리뷰트의 이름과 값을 Map객체에 저장
	//				}
	//				public void doTag() throws JspException, IOException {		
	//					JspContext context = getJspContext();					
	//					JspWriter out = context.getOut();	
	//					String color = (String) attrs.get("color");								--> Map객체에 저장되어 있는 애트리뷰트 값을 가져온다.
	//					out.println("<font color='" + color + "'" + ">환영합니다.</font>" );				
	//					return;
	//				}
	//			}
	// 하나의 JSP페이지 안에서 여러 개의 태그 라이브러리를 사용할 때는 서로 다른 접두어를 쓰는데 실제로는 이 접두어와 연관된 URI로 구분한다.
	// 애트리뷰트의 이름도 이런 식으로 구분이 가능하다.
	//		--> <util:line size="30" grf:font="굴림체"/> : grf는 네임스페이스URI를 가리키는 접두어
	//		--> 이 애트리뷰트가 setDynamicAttribute 메서드에 의해 처리되는 동적 애트리뷰트라면 첫번째 파라미터를 통해 URI가 전달된다.
	// 동적 애트리뷰트를 지원하는 태그 클래스의 경우 TLD파일 등록시에 <attribute> 엘리먼트는 필요없고 <dynamic-attributes> 엘리먼트 하나만 등록
	// 		ex)	<taglib xmlns="http://java.sun.com/xml/ns/javaee" version="2.1">
	//				<tlib-version>1.0</tlib-version>					
	//				<short-name>tool</short-name>						
	//				<tag>
	//					<name>Line</name>								
	//					<tag-class>tool.LineTag</tag-class>				
	//					<body-content>empty</body-content>		
	//					<dynamic-attributes>true</dynamic-attributes>	--> 동적 애트리뷰트를 지원한다는 표시
	//				</tag>
	//			</taglib>
	
	
	// ★ 본체가 있는 커스텀 액션을 만드는 태그 클래스
	// 1. 커스텀 액션의 본체 내용을 가져와야 한다.				--> getJspBody 메서드를 사용, JspFragment 타입을 리턴
	// 2. JspFragment 객체를 이용해서 본체의 내용을 출력.		--> invoke 메서드를 사용, 파라미터로 본체 출력에 사용될 출력 스트림을 넘겨준다.
	//		ex) JspFragment body = getJspBody();				--> 커스텀 액션의 본체를 가져온다.
	//			body.invoke(out)	: 이자리에 본체가 온다.		--> out은 JspWriter 객체타입, null을 넣어주면 JSP페이지 출력에 사용되는 스트림이 적용된다.
	// TLD파일에 등록
	//		--> body-content 애트리뷰트의 내용을 scripteless(스크립틀릿을 쓸수없는) 나 tagdependant(본체내용이 모두 순수 텍스트로 인식)로 써야한다.
	
	
	// ★ 커스텀 액션의 본체 내용을 조작하는 태그 클래스
	// 태그 클래스에서 본체의 내용을 문자열로 만드 다음에, 그 문자열을 조작해서 출력하면 됨.
	// java.io.StringWriter 클래스를 이용한다.
	//		ex) JspFragment body = getJspBody();
	//			StringWriter writer = new StringWriter();			--> StringWriter : 출력한 모든 데이터를 모아서 String 객체로 만드는 기능을 제공
	//			body.invoke(writer)									--> 본체의 내용을 StringWriter 객체안으로 출력한다.
	//			String str = writer.toString();						--> StringWriter 객체 안의 내용을 문자열로 만든다.
	//			String newStr = str.replaceAll(oldWord, newWord);	--> 문자열 조작
	//			out.print(newStr);									--> 전송
	
	
	// ★ 변수를 지원하는 커스텀 액션을 만드는 태그 클래스
	// page 데이터 영역에 해당 변수의 이름과 값을 저장해 놓으면 된다.
	//	ex)	JspContext context = getJspContext();					--> JSP페이지의 컨텍스트 페이지 정보를 가져옴.
	//		context.setAttribute("minimum", num1);					--> page영역에 이름과 값을 저장.
	//	TLD파일에 등록
	//	<tag>
	//		...
	//		<variable>
	//			<name-given>minimum</name-given>					--> 변수의 이름
	//			<variable-class>java.lang.Integer</variable-class>	--> 변수의 타입
	//			<scope>AT_END</scope>								--> 변수의 사용 범위
	//		</variable>
	//	</tag>
	// 변수의 이름이 고정된다는 단점을 제거하기
	// <tool:min var="minimum" num1="12" num2="35"/> : var 애트리뷰트 사용
	// 태그 클래스 내에서 변수이름(여기서minimum)을 담을 변수와 set-메서드를 선언
	//		ex) private String var;
	//			public void setVar(String var) {
	//				this.var = var;
	//			}
	// TLD파일에 등록
	//	<tag>
	//		...
	//		<attribute>
	//			<name>var</name>									--> 애트리뷰트 이름
	//			<type>java.lang.String</type>						--> 애트리뷰트의 타입
	//			<required>true</required>							--> 필수 애트리뷰트임을 표시
	//			<rtexprvalue>false</rtexprvalue>					--> 익스프레션이나 EL문을 애트리뷰트 값으로 사용할 수 없도록 만드는 표시
	//		<//attribute>
	//		<variable>
	//			<name-from-attribute>var</name-from-attribute>		--> 변수 이름의 지정에 사용할 애트리뷰트의 이름
	//			<variable-class>java.lang.Integer</variable-class>	--> 변수의 타입
	//			<scope>AT_END</scope>								--> 변수의 사용 범위
	//		</variable>
	//		...
	//	</tag>
	
	
	// ★ 차일드 커스텀 액션
	// <tool:list>
	//		<tool:item>오렌지</tool:item>
	// </tool:list>
	// 부모 커스텀 클래스, 자식 커스텀 클래스가 필요
	// 부모 커스텀 클래스 : getJspBody 메서드를 호출해서 JspFragment 객체를 구하여 inVoke 메서드를 호출만 하면된다.
	//	ex) public void doTag() throws JspException, IOException {		
	//			JspFragment body = getJspBody();			
	//			body.inVoke(null);					--> inVoke 메서드가 커스텀 액션에 포함된 자식 커스텀 액션의 태그 클래스를 알아서 호출
	//			return;
	//		}
	// 자식 커스텀 클래스 : getParent 메서드를 사용하고 JspTag 객체를 이용하여 부모 커스텀 액션이 맞는지 비교
	//	ex) public void doTag() throws JspException, IOException {		
	//			JspTag parent = getParent();
	//			if((parent == null) || !(parent instanceof ListTag)) 
	//				throw new JspException("부모 커스텀 클래스가 아니다.");
	//				...
	//			body.inVoke(null);
	//			return;
	//		}
	// TLD파일에는 각각 태그 클래스를 등록
	// <tool:list bullet="@">						--> 부모 커스텀 액션에 전달받은 애트리뷰트 값을 자식 커스텀 액션에서 써야할 경우(커뮤니케이션)
	//		<tool:item>오렌지</tool:item>
	// </tool:list> 
	// 부모 커스텀 클래스 : 애트리뷰트값을 받을 변수, set-메서드, get-메서드(자식쪽에서 호출)를 구현 (TLD파일에 attribute도 추가)
	// 자식 커스텀 클래스 : JspTag 객체를 이용하여 부모 커스텀 클래스로 캐스팅해서 set-메서드를 호출한다.
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶3. 태그 라이브러리 만드는 방법	--> jar
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// ★ 태그 클래스를 모아서 태그 라이브러리를 만들기
	// 1. 디렉터리 계층 구조를 만들고 파일들을 그곳에 저장
	// 2. TLD 파일을 수정
	// 3. 디렉터리 계층 구조 전체를 JAR 파일로 만듬
	
	
	
	
	
	
	
	
	
	
	
	
	

%>