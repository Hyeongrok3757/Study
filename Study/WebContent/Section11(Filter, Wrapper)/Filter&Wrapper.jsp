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
	// 요청 래퍼 클래스와 응답 래퍼클래스의 두 종류의 래퍼 클래스 형태로 구현된다.
	//
	//												   요청객체			 요청래퍼객체
	//		웹 브라우저 -----호출----> 웹 컨테이너 --------------> 필터 --------------> 웹 컴포넌트
	//												   응답객체			 요청래퍼객체
	//
	// 1. 브라우저 --호출--> 컴포넌트  : 요청객체와 응답객체를 전달. doGet, doPost 메서드의 파라미터 변수나 request, response 내장객체를 통해 서블릿과 JSP페이지로 전달되는 값
	// 2. 필터가 존재하면 이 두 객체는 필터로 넘겨진다.
	// 3. 필터가 요청래퍼클래스와 응답래퍼클래스를 가지고 두 객체를 포장한 다음에 웹 컴포넌트로 전달
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
	
	
	
	
	
	
	
	
	
	
	
%>