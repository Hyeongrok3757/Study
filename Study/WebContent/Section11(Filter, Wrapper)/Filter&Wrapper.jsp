<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	// 여러 개의 웹 컴포넌트(JSP페이지와 서블릿 클래스)에 대해 똑같은 사전작업, 사후작업을 수행하도록 만들어야 할 경우에 필터와 래퍼가 유용한 기술이다.
	//	ex) 페이지마다 로그인 확인, 유료결제 페이지일 경우 실행 후에 요금을 부과
	// 이러한 코드를 따로 작성해두어서 코드 간의 일관성을 유지하고 공통으로 사용하여 편리하다.
	// Filter : 여과기 역할, 자바 클래스 형태로 구현해야 함(필터 클래스)
	//
	// 필터 클래스 ---------------> 필터 객체 ---------------> 필터
	//					인스턴스화					초기화
	//
	// 					호출					호출
	// 웹 브라우저 ---------------> 필터 ---------------> 웹 컴포넌트들
	//			   <---------------		 <---------------
	//					응답					응답
	//
	// 웹 브라우저가 웹 컴포넌트를 호출	--> 필터가 호출됨, 필터작업수행 --> 웹 컴포넌트 호출, 컴포넌트 작업 수행 --> 필터로 응답 및 필터의 사후작업 --> 웹 브라우저로 응답
	//
	// 웹 브라우저와 웹 컴포넌트 사이를 오가는 데이터를 변형하는 일은 할 수 없다. ex) 메시지를 암호화하거나, 데이터 일부를 걸러서 막는일 등을 할 수 없다.
	// 		--> 필터와 래퍼를 같이 사용하면 가능
	
	// Wrapper : 포장하는 역할, 웹 브라우저와 웹 컴포넌트 사이를 오가는 요청 메시지와 응답 메시지를 포장한다.
	// [요청 래퍼 클래스]와 [응답 래퍼 클래스]의 두 종류의 래퍼 클래스 형태로 구현된다.
	//
	//												   요청객체			 [요청래퍼객체]
	//		웹 브라우저 -----호출----> 웹 컨테이너 --------------> 필터 --------------> 웹 컴포넌트
	//												   응답객체			 [응답래퍼객체]
	//
	// 1. 브라우저 --호출--> 컴포넌트  : 요청객체와 응답객체를 전달. doGet, doPost 메서드의 파라미터 변수나 request, response 내장객체를 통해 서블릿과 JSP페이지로 전달되는 값
	// 2. 필터가 존재하면 이 두 객체는 필터로 넘겨진다.
	// 3. 필터가 [요청 래퍼 클래스]와 [응답 래퍼 클래스]를 가지고 두 객체를 포장한 다음에 웹 컴포넌트로 전달
	// 4. 웹 컴포넌트는 새로운 두 객체를 기존의 객체처럼 사용함.
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶1. 필터 클래스의 작성, 설치, 등록
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// ★ 필터 클래스 작성
	// javax.servlet.Filter 인터페이스를 구현해야 한다.		--> init 메서드, doFilter 메서드, destroy 메서드를 구현
	// doFilter 메서드 : 웹 브라우저가 웹 컨테이너로 요청을 보냈을 때 호출되는 메서드	--> 사전작업, 사후작업, 웹 컴포넌트 호출하는 일을 구현해야 함.
	// init 메서드 : 필터객체가 만들어지고 초기화 작업을 할 때 호출되는 메서드(필터 전체의 라이프 사이클 동안 단 한번만 실행)
	// destory 메서드 : 웹 컨테이너가 필터를 필요 없다고 판단해서 제거하기 직전에 호출되는 메서드(필터 전체의 라이프 사이클 동안 단 한번만 실행)
	// init 메서드와 destory 메서드는 할 일이 없더라도 반드시 빈 골격을 만들어야 한다.
	
	// doFileter 메서드 파라미터
	// ServletRequest타입 request : 웹 컨테이너가 넘겨주는 요청 객체
	// ServletResponse타입 response : 웹 커테이너가 넘겨주는 응답 객체
	// ♥♥♥ FilterChain타입 chain : 필터체인을 표현하는 타입
	//	--> 필터체인 : 여러 개의 필터가 실행될 수도 있는데 정해진 순서에 따라서 1->2->3->4->웹 컴포넌트->4->3->2->1 형식으로 호출과 응답으로 이어진 필터들
	//
	//					  호출			호출					   호출
	//		웹 브라우저 -------> 필터 -------> 필터   ···   필터 -------> 웹 컴포넌트
	//					<-------	  <-------					 <-------
	//					  응답			응답					   응답
	//							 │------------필터체인----------│
	//
	// 웹 컨테이너(서버)는 필터가 실행되기 전에 필터체인에 대한 정보를 FilterChain 객체로 만들어서 doFilter 메서드로 전달한다.
	// 		--> 필터체인의 다음번 멤버를 호출할 때 필요함.
	// ex) 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//				System.out.println("이제 곧 웹 컴포넌트가 시작됩니다.");		--> 웹 컴포넌트에 대한 사전작업 로직
	//				chain.doFilter(reqeust, response);								--> 필터체인의 다음번 멤버를 호출함. ( 다음번이 필터 또는 웹 컴포넌트가 될수 있음 )
	//				System.out.println("조금 전 웹 컴포넌트가 완료 되었습니다.");	--> 웹 컴포넌트에 대한 사후작업 로직
	//		}
	//		--> System.out.println 메서드의 출력메시지는 웹 서버쪽에 로그파일에 기록된다.
	
	
	// ★ 필터 클래스 설치, 등록
	// 1. 필터 클래스를 컴파일								--> javac 명령
	// 2. 필터 클래스의 컴파일 결과물을 웹 컨테이너에 설치	--> WEB-INF/classes 아래에 저장 	ex) WEB-INF/classes/myfilter 안에 저장
	// 3. 필터 클래스를 web.xml 파일에 등록
	//		--> 1. <filter> 엘리먼트를 추가			: 필터를 등록하는 엘리먼트  
	//		--> 2. <filter-mapping> 엘리먼트를 추가	: 필터를 적용할 웹 컴포넌트를 지정하는 엘리먼트
	//	ex)	<filter>
	//			<filter-name>simple-filter</filter-name>			--> 필터 이름
	//			<filter-class>myfilter.SimpleFilter</filter-class>	--> 필터 클래스 이름(패키지 이름을 포함해야 함)
	//		</filter>
	//		<filter-mapping>
	//			<filter-name>simple-filter</filter-name>			--> 필터 이름
	//
	//		원하는 방식으로 조합하거나 여러개를 선언해서 사용한다.
	//			<servlet-name>hello-servlet</servlet-name>			--> 하나의 웹 컴포넌트에 적용할 때 사용, 필터를 적용할 웹 컴포넌트의 이름을 쓴다.(서블릿을 등록시 이름)
	//			<uri-pattern>test.jsp<uri-pattern>					--> * 를 포함하지 않는 경로명은 웹 컴포넌트 하나에 적용된다. 이 방법은 JSP페이지를 web.xml에 등록 안해도 됨.
	//			<uri-pattern>/*<uri-pattern>						--> 여러 개의 웹 컴포넌트에 한꺼번에 적용
	//			<uri-pattern>*.jsp<uri-pattern>						--> 모든 JSP 페이지에 적용
	//			<uri-pattern>/sub1/*<uri-pattern>					--> /sub1/ 이라는 경로명으로 시작하는 모든 웹 컴포넌트에 적용
	//			<uri-pattern>/sub2/*<uri-pattern>					--> /sub2/ 이라는 경로명으로 시작하는 모든 웹 컴포넌트에 적용
	//
	//		<filter-mapping>
	//
	// 필터 클래스 동작중 로그파일 등을 남길경우 init메서드에서 파일을열고 destroy메서드에서 닫는게 좋다.
	// 필터 클래스 내부에서 사용하는 필터 초기화 파라미터의 경우 효율적으로 다루기 위해서 클래스 내부보다는 web.xml에 필터 파라미터로 선언하는게 좋다.
	//		ex)	<filter>
	//					...
	//					...
	//				<init-param>
	//					<param-name>FILE_NAME</param-name>
	//					<param-value>C:\\logs\\myfilter.log</param-value>
	//				</init-param>
	//			</filter>
	// 필터 클래스 안에서 필터의 초기화 파라미터를 얻기위해서는 FilterConfig타입 config을 이용하여 getInitParameter메서드로 얻을 수 있다.
	//		ex) String filename = config.getInitParameter("FILE_NAME");
	// 웹 컴포넌트를 호출하는 방법
	//	--> 1. 브라우저로 호출
	//		2. forward 메서드로 호출
	//		3. include 메서드로 호출
	//		4. 익셉션이 발생했을 때 웹 커테이너가 호출
	// <filter-mapping> 엘리먼트 내부에 <dispatcher>엘리먼트를 사용하면 호출방식에 따라 필터의 사용여부를 적용 가능( 여러개를 선언해도 됨 )
	//	ex) <dispatcher>REQUEST</dispatcher>	: 브라우저
	//		<dispatcher>FORWARD</dispatcher>	: forward
	//		<dispatcher>INCLUDE</dispatcher>	: include
	//		<dispatcher>ERROR</dispatcher>		: 익셉션 발생
	
	
	// ★ 요청 메시지와 응답 메시지에서 포함된 정보 조회하기
	// doFilter메서드 안에서 ServletRequest파라미터와 ServletResponse파라미터를 사용
	// 주의사항 : ServletResponse파라미터에 대한 호출은 반드시 chain.doFilter메서드보다 나중에 호출해야 한다. 그래야 응답관련 메시지가 저장 되어있음.
	// ServletRequest와 ServletResponse타입의 파라미터는 실제로 웹 컨테이너가 HttpServletRequest와 HttpServletResponse타입으로 주는 객체이다.
	//		--> 타입변환을 통해서 더 다양한 정보를 사용 할 수 있다.
	
	
	// ★ 필터 체인의 방향 바꾸기
	// 
	//						호출											로그인 성공 시
	//	웹 브라우저 ------------------>	사용자의 로그인을 체크하는 필터	------------------------> 로그인한 회원만 쓰는 웹 컴포넌트
	//													|
	//													|		로그인을 안 했을 때
	//													----------------------------------------> 로그인을 유도하는 웹 페이지
	//
	//	--> 로그인 여부를 체크하는 필터는 사용자가 로그인하지 않고 웹 컴포넌트를 호출했을 때 본래의 웹 컴포넌트 대신 로그인을 유도하는 웹 컴포넌트로 방향을 바꾼다.
	//
	// ex) 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//				HttpServletRequest httpRequest = (HttpServletRequest)request;		--> getSession메서드는 HttpServletRequest 인터페이스에 속하므로 타입 변환
	//				HttpServletResponse httpResponse = (HttpServletResponse)Response;	--> sendRedirect메서드는 HttpServletResponse 인터페이스에 속하므로 타입 변환
	//				HttpSession session = httpRequest.getSession();						--> 세션확인을 위해서 얻어옴
	//				if(session == null){
	//					httpResponse.sendRedirect("로그인페이지 주소");					--> 세션이 null이면 로그인 페이지로 이동
	//				}
	//				String id = (String) httpRequest.getAttribute("ID");
	//				if(id == null){
	//					httpResponse.sendRedirect("로그인페이지 주소");					--> 요청 정보에 ID의 값이 없다면 로그인 페이지로 이동
	//				}
	//				chain.doFilter(reqeust, response);								
	//		}
	
	
	// ★ 필터체인의 필터 순서가 정해지는 방법
	// web.xml파일안의 <filter-mapping>엘리머트의 순서에 따라서 결정된다.
	// 단, <url-pattern>엘리먼트와 <servlet-name>엘리먼트가 섞여서 사용될 경우에는 <url-pattern>엘리먼트에 해당하는 필터들이 순서대로 먼저 적용되고
	//		<servlet-name>엘리먼트에 해당하는 필터들이 순서대로 적용된다.
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶2. 래퍼 클래스의 작성, 설치, 사용
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// 요청 객체를 포장하는 클래스는 HttpServletRequestWrapper 클래스(HttpServletRequest인터페이스를 구현하고 있음)를 상속해야 함.
	// 응답 객체를 포장하는 클래스는 HttpServletResponseWrapper 클래스(HttpServletResponse인터페이스를 구현하고 있음)를 상속해야 함.
	// 	--> 따라서 웹 컴포넌트가 [요청 래퍼 객체]와 [응답 래퍼 객체]를 요청객체와 응답객체로 인식할 수 있는 이유를 알 수 있다.
	//	--> doFilter메서드의 파라미터 타입인 ServletRequest와 ServletResponse는 실제로 브라우저가 전송시 HttpServletRequest와 HttpServletResponse타입이다.
	//
	
	
	// ★ 요청 래퍼 클래스를 작성하는 방법
	// ex) public class MyRequestWrapper extends HttpServletRequestWrapper{		--> HttpServletRequestWrapper클래스를 상속한다.
	//		private HttpServletRequest request;	
	//		public MyRequestWrapper(HttpServletRequest request) {
	//				super(request);	
	//				this.request = request;										--> 생성자로 넘겨받은 요청 객체를 필드에 저장
	//			}
	//		}
	//	☆ super(request)
	//		--> 슈퍼클래스에 파라미터를 받지 않는 생성자가 없으므로 서브클래스의 생성자 안에서 슈퍼클래스의 생성자 중 하나를 명시적으로 호출해야 하기 때문에 작성.
	//		--> 자바의 문법에서 슈퍼클래스의 생성자를 호출하는 명령문은 반드시 서브클래스 생성자 안에서 첫 번째 위치에 있어야 함.
	//
	// 데이터를 변형하는 코드의 작성
	//	--> 웹 컴포넌트에서 입력된 데이터를 가져오기 위해서 호출하는 메서드와 똑같은 시그니처의 메서드를 선언해 놓고 그 안에 작성해야 함.
	//  ex) 웹컴포넌트에서 <form>엘리먼트로 입력된 데이터를 가져올때 getParameter메서드(String파라미터를 받고 String을 리턴)를 사용한다고 하면
	//		public class MyRequestWrapper extends HttpServletRequestWrapper{		
	//			...
	//			public String getParameter(String name){			--> 사용할 메서드와 동일한 시그니처를 작성한다.
	//				String value = request.getParameter(name);		
	//				if(value == null) return null;
	//				return value.toUpperCase();						--> 사용자가 기대하는 작동방식에 맞도록 만들어야 함.
	//			}
	//		}
	//	--> 웹 컴포넌트에서는 요청 객체의 메서드인 줄 알고 호출하게 됨.
	//
	//	필터 클래스의 doFilter메서드 내부에서 래퍼 클래스를 생성한 다음 chain.doFilter메서드의 파라미터로 넘겨주어야 한다.
	//	ex) MyRequestWrapper requestWrapper = new MyRequestWrapper((HttpServletRequest) request);
	//		chain.doFilter(requestWrapper, response);				--> 요청 래퍼 객체인 rrequestWrapper를 넘겨준다.
	
	
	// ★ 응답 래퍼 클래스를 작성하는 방법
	// ex) public class MyResponseWrapper extends HttpServletResponseWrapper{		--> HttpServletResponseWrapper클래스를 상속한다.
	//		private HttpServletResponse response;	
	//		public MyResponseWrapper(HttpServletResponse response) {
	//				super(response);	
	//				this.response = response;										--> 생성자로 넘겨받은 요청 객체를 필드에 저장
	//			}
	//		}
	// 데이터를 변형하는 코드의 작성
	//		public class MyResponseWrapper extends HttpServletResponseWrapper{		
	//			...
	//			public void addCookie(Cookie cookie){
	//				String name = cookie.getName();
	//				String value = cookie.getValue();
	//				String newVlaue = value.toLowerCase();
	//				Cookie newCookie = new Cookie(name, newValue);
	//				response.addCookie(newCookie);
	//			}
	//		}
	//	필터 클래스의 doFilter메서드 내부에서 래퍼 클래스를 생성한 다음 chain.doFilter메서드의 파라미터로 넘겨주어야 한다.
	//	ex) MyResponseWrapper responseWrapper = new MyResponseWrapper((HttpServletResponse) response);
	//		chain.doFilter(request, responseWrapper);				--> 요청 래퍼 객체인 responseWrapper를 넘겨준다.
	
	
	// ★ 응답 메시지의 본체 내용을 변형하는 래퍼 클래스
	// 서블릿 클래스에서 HTML코드를 출력하기 위해서는 HttpServletResponse 파라미터에 대해 getWriter메서드를 호출해서 PrintWriter 객체를 구하여
	// print, printf, println 등의 메서드를 호출했었다. 하지만 매우 많은 타입으로 오버로딩 되어있고 이런 방식으로 변경이 불가능한 경우도 있다.
	// 따라서 PrintWriter 객체를 통해 출력되는 HTML코드를 모두 모아서 한번에 변형하는 방법을 사용해야함.
	//
	// - StringWriter 객체를 사용하여 텍스트 출력을 버퍼에 모아놓고 그 내용을 toString메서드를 호출해서 이용한다.
	// - StringWriter 객체를 만들어서 PrintWriter 생성자에 파라미터로 넘겨주면 버퍼로 저장 시킬수 있다.
	// 
	// 방법
	// 1. 응답 래퍼 클래스안에 ServletResponse 이터페이스의 getWriter메서드와 동일한 시그니처를 갖는 메서드를 선언
	// 2. 메서드 내부에서 PrintWriter생성자에 StringWriter객체를 파라미터로 넘겨서 리턴되는 PrintWriter객체를 클래스의 필드로 받는다.
	//			--> getWriter메서드가 처음 호출시만 객체를 만들어 리턴하고, 그 다음부터는 생성해둔 객체를 리턴하므로 문제 발생의 여지를 없애기 위하여
	// 3. 메서드 내부에서 StringWriter객체를 생성시 필드로 저장해 두어야 한다.
	//			--> 나중에 StringWriter객체의 내부 버퍼에 이슨 내용을 한꺼번에 가져오기 위해서(메서드의 지역변수로 쓰면 안됨)
	// 4. 변형하는 코드는 필터 클래스에서 chain.doFilter메서드를 호출한 다음에 실행되어야 한다.(웹 컴포넌트가 출력한 다음)
	// 5. 응답 메시지의 변형은 필터클래스 보다는 래퍼클래스에서 해야하는 일이기 때문에 래퍼클래스에 메서드를 만들고 호출한다.
	// 
	// ex) 
	// 응답 래퍼 클래스
	//		public class MyResponseWrapper extends HttpServletResponseWrapper{		
	//			...
	//			PrintWriter newWriter;			--> 메서드 호출마다 재생성을 막기위하여
	//			StringWriter strWriter;			--> 객체의 내부버퍼에 저장해 두었다가 modifyAndSend메서드에서 가져다 쓰기위해서 메서드의 지역변수로 쓰면 안됨
	//			
	//			...
	//			
	//			public PrintWriter getWriter() throws IOException {		--> 웹 컴포넌트가 getWriter()를 호출시 작동
	//				if (newWriter == null) {
	//					strWriter = new StringWriter();					--> 내부버퍼에 저장하기 위해서 사용할 객체
	//					newWriter = new PrintWriter(strWriter);			--> 내부버퍼에 저장하기 위해서 사용할 객체
	//				}
	//				return newWriter;
	//			}
	//			public void modifyAndSend() throws IOException {				--> 필터 클래스에서 내용변환 및 전송을 위하여 호출시 작동
	//				String content = strWriter.toString();						--> 버퍼에 저장된 내용을 문자열로 리턴
	//				String newContent = content.replaceAll("강아지", "멍멍이");	--> 전체내용에 변형을 준다.
	//				PrintWriter writer = response.getWriter();					--> 웹 브라우저로 출력하기 위해 객체를 리턴받음
	//				writer.print(newContet);									--> 브라우저로 변형된 내용을 출력
	//			}
	//		}
	//
	// 필터 클래스
	//	 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//			MyResponseWrapper responseWrapper = new MyResponseWrapper((HttpServletResponse) response);	--> 응답 래퍼 클래스 생성
	//			chain.doFilter(request, responseWrapper);													--> 필터체인의 다음번으로 넘긴다.
	//			responseWrapper.modifyAndSend();															--> 응답내용에 변형을 주고 브라우저로 전송하는 메서드를 호출
	//		}
	
	
	// 필터와 래퍼가 적용되는 웹 자원
	//	--> 웹 컴포넌트뿐만 아니라 일반 웹 자원(HTML문서, 이미지파일 등)에도 적용될 수 있다.
	//	--> 필터와 래퍼의 구현 방법에 따라 어떤 종류의 웹 자원에는 올바르게 적용될 수 없는 경우도 있음.
	//	--> getWriter메서드를 이용한 방법은 웹 컴포넌트가 생성하는 동적 HTML문서에 대해서는 적용이 가능하지만 정적 HTML 문서는 getWriter메서드를 통해 출력하지
	//		않기 때문에 적용되지 않는다.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
%>