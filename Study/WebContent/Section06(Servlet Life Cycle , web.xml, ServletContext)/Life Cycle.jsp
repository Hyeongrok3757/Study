<%@page import="javax.servlet.annotation.WebServlet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
/*

	 Servlet Life Cycle :  서블릿 클래스  ---------> 서블릿 객체 ---------> 서블릿 ---------> 안쓰는 서블릿
				      		       	      인스턴스화			         초기화		        마무리 작업
							  		   init()호출						   destroy()호출
	
		=> 인스턴스화, 초기화 단계에서 자원을 많이 사용하므로 일단 만들어진 서블릿은 메모리에 남겨두었다가 또 요청이오면 곧바로 호출한다. 
	
		=> 시스템 자원을 절약하기 위하여 동일한 로직을 거쳐 같은 결과를 도출하는 코드는 한번만 실행되도록 한다.
	
*/


	//---------------------------------------------------------------------------------------------------------------------------------------------
	// Servlet 클래스의 경우 ( init() 과 destroy()이 자동으로 호출 )
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	public class servletName extends HttpServlet{
		
		public void init() throws ServletException{
			
			// 서블릿이 초기화될 때 할 일을 기술
			
		}
		protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException ,java.io.IOException{  // 또는 doGet 이나 doPost
			// 로직
		}
		public void destroy(){
			
			// 서블릿이 제거되기 전에 해야 할 일을 기술
			
		}
	}
	
	
	// init() 조건 : 파라미터는 없음, 리턴타입은 void, 접근지시자는 public, throws ServletException은 생략가능
	// destroy() 조건 : 파라미터는 없음, 리턴타입은 void, 접근지시자는 public
	
	// web.xml에서 <servlet></servlet>의 내부에 <load-on-startup/> 선언할 경우  : 웹컨테이너가 시작될 때 해당 서블릿이 미리 초기화되게 만든다.(작업시간이 오래걸리는 서블릿에 활용한다) 
	
	// init() 대신  init(ServletConfig config)를 사용해도 되지만 꼭 super.init(config);를 해야하며 굳이 이런 방법을 쓸 필요는없다. (알아만두자)
	// 실제 서블릿호출시 init(ServletConfig config)가 호출되지만 이후에 내부에서 또 init()을 호출한다.
	
	// init()가 ServletException을 발생하면 서블릿이 계속 생성되지 못하고 지속적으로 호출되므로써 성능이 나빠지므로 
	// throw new UnavailableException("초기화 실패", 600); 형식을 사용하여 다음번 초기화까지 대기시간(초단위)을 주는게 좋다.
	
	// 서블릿 초기화 파라미터 : 서블릿의 초기화 작업에 필요한 데이터
	// -> web.xml이나 annotation기법(Tomcat 7.0이상)으로 initParams값을 설정한후 getInitParameter(name)을 사용해서 값을 추출후 사용함.( init()내부에서 쓰려고 )
	// -> getInitParameter(name)은 ServletConfig(서블릿 구성정보 객체)을 통해서 간접적으로 데이터를 가져온다.
	// -> ServletConfig config = getServletConfig(); 를 하여   config.getInitParameter(name)나 마찬가지임.
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// JSP 페이지의 경우 ( jspInit() 과 jspDestroy()이 자동으로 호출 )
	//---------------------------------------------------------------------------------------------------------------------------------------------
																																													%>
	<%!
		public void jspInit(){
			// jsp에서 변환된 servlet이 초기화될 때 할 일
		}
	%>
	
	<html>
		<head>test</head>
		<body>
			
		</body>
	</html>
	
	<%!
		public void jspDetroy(){
			// jsp에서 변환되 servlet이 제거되기 전에 해야 할 일
		}
	%>
																																													<%
	// 반드시 선언문( <%! 내용 %.> )안에 기술해야 한다.  jsp 페이지에서 선언문의 위치는 상관없다.
	// jspInit() 조건 : 파라미터는 없음, 리턴타입은 void, 접근지시자는 public, throws절은 쓸수없다.( init()과 차이점 )
	// jspDestroy() 조건 : 파라미터는 없음, 리턴타입은 void, 접근지시자는 public
	
	// Tomcat에서 System.out.printf()같은 System.out객체를 이용한 출력 메시지는 톰켓경로/logs 디렉터리에 stdout_yyyymmdd.log 로 기록된다. 
	// -> System.err객체를 사용시 stderr_yyyymmdd.log 로 기록된다. 
	
	// JSP 페이지의 초기화 파라미터 사용 : jsp 페이지를 web.xml 파일에 등록해야 함.
	// -> 접근시 등록된 url-pattern 으로 접근해야 jsp 페이지가 초기화 파라미터를 읽을 수 있다.
	// -> 서블릿 클래스방식과 마찬가지로  getInitParameter(name)을 사용해서 값을 추출후 사용함. 또한 ServletConfig타입의 내장객체 config를 이용가능.
	
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// 서블릿 환경을 표현하는 ServletContext 객체
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// 서블릿 클래스의 경우 : ServletContext context = getServletContext() 로 획득하여 사용.
	// JSP 페이지의 경우 : ServletContext객체로 생성된 application 내장객체를 사용함.
	// 서블릿이 속한 웹 애플리케이션 디렉터리와 웹 컨테이너의 다양한 정보를 가져올수 있다.
	
	// ServletContext 객체를 통하여 웹 애플리케이션 전체에 속하는 초기화 파라미터를 사용 가능.
	// -> web.xml 에 <context-param> 형태로 파라미터를 등록
	// -> ServletContext객체.getInitParameter(데이터이름) 형태로 추출.
	
	// log() 라는 메서드를 사용하여 톰켓/logs 디렉터리에 로그를 남길수 있다.  application.log("로그입니다.") 파일명은 localhost.yyyy-mm-dd.log 형태
	
	
	// setAttribute(), getAttribute(), removeAttribute() 메서드를 이용하여 같은 웹 애플리케이션에 속하는 웹 컴포넌트끼리 데이터를 주고받을수 있다.
	// => 세션 데이터 영역과는 다른 웹 애플리케이션에 할당된 영역에 데이터를 저장한다.( 각각 다른 컴퓨터에서 접속해도 모든 사용자가 데이터를 공유가능 )
	// => 웹 애플리케이션에 속하기만 하면 인터넷을 통해 연결된 모든 사용자들이 데이터를 공유할 수 있다.
	// 					-> 모두 공유할 임시디렉터리 경로명을 저장하거나, 전체 접속 횟수를 카운트하는 등의 용도로 사용한다.
	
	
	// setAttribute(), getAttribute(), removeAttribute() 메서드를 이용하는 4가지 객체
	// 1. ServletRequest : 현재 컴포넌트 및 forward, include 메서드로 호출된 컴포넌트
	// 2. HttpSession    : 같은 세션에 속하는 모든 웹 컴포넌트
	// 3. ServletContext : 같은 웹 애플리케이션에 속하는 모든 웹 컴포넌트
	// 4. JspContext	 : 현재 JSP 페이지 내
	
	
	
	
	
	
	// ??? web.xml 없이 <error-page> 등록방법    annotation키워드
	// ??? web.xml 없이 jsp 페이지 등록방법
	// ??? web.xml 없이 <context-param> 등록방법
%>
