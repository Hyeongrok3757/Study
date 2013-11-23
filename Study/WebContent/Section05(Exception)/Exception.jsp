<%@page import="java.sql.SQLException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" isErrorPage="true"%>
<%

	// 에러를 처리하는 부분만 따로 떼어서 별도의 웹 컴포넌트로 만든 다음에 호출하는 것이 좋은방법 : 에러 페이지
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// 1. JSP 페이지에서 사용하는 방법  : <%@page 속성 %.> 지시자를 사용 
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	
	// 데이터를 처리하는 페이지에서  <%@page errorPage="에러페이지.jsp" %.> 설정 : try문을 사용하지 않고 jsp페이지에서 에러 발생시 자동으로 호출

	// 에러페이지는 <%@page isErrorPage="true" %.> 처럼 설정  isErrorPage="true" : exception 내장변수가 생기도록 만듬

	// errorPage="에러페이지.jsp" 로 호출된 에러페이지에는 exception개체가 자동으로 전달되어 exception 내장변수에 저장된다.
	
	String errorMessage = exception.getMessage(); // 에러메시지를 가져옴.

	// HTTP 응답메시지 상태코드가 200이면 정상, 500이면 비정상인데 에러페이지 호출시 종종 500이 발생하여 브라우저 자체의 에러페이지가 사용되므로
	// HTTP 응답메시지 상태코드를 항상 200이 되도록 설정해주는게 좋음( 직접 작성한 에러페이지만 호출 )
	response.setStatus(200);
	
	// 에러 종류를 판별하여 페이지를 분할 가능
	if(exception instanceof FileNotFoundException){
		response.sendRedirect("file에러페이지.jsp");
	}
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// 2. 서블릿 클래스에서 사용하는 방법  : try문을 걸어서 exception발생시 forward로 에러페이지를 호출
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	
	try{
		int x = 10 / 0 ; // 에러발생
	}catch(Exception e){
		RequestDispatcher rd = request.getRequestDispatcher("에러페이지.jsp");
		rd.forward(request, response);
	}
	
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// 3. web.xml 파일에 에러 페이지 등록하기 : 여러 웹 컴포넌트에서 발생하는 익셉션을 하나의 에러페이지가 공통으로 처리(★)
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	
	// 해당 웹 애플리케이션 디렉터리 안에서 익셉션에 발생시 해당하는 타입의 에러 페이지가 자동으로 호출
	
	/*
	web.xml의 <web-app></web-app> 내부에 추가한다.
	
	<error-page>
		<exception-type>java.lang.NumberFormatException</exception-type>   : 에러종류 전체클래스 경로
		<location>/error/NumberFormatError.jsp</location>				   : 웹 애플리케이션 디렉터리내에서의 전체경로  ( /로 시작함 )
	</error-page>
		  .
		  .
	     여러개 추가
	
	*/
	
	// web.xml에 등록된 익셉션중 슈퍼-서브클래스 관계가 여러개라면 발생한 익셉션의 가장 가까운 타입이 호출된다.
	
	/////////////////// - JSP 페이지에서 사용시 - /////////////////
	// 익셉션이 발생한 JSP 페이지에서는 page지시자에서 errorPage메서드를 사용하면 안된다.(디폴트값) 
	// 익셉션이 발생한 JSP 페이지에서는 page지시자에서 errorPage메서드를 사용하고 web.xml의 에러페이지도 사용시 우선권은 page지시자가 된다.
	
	// "/error/NumberFormatError.jsp" 의 에러페이지에서는 별다른건 없음
	// exception 내장변수를 쓰려면 page지시자에서 isErrorPage="true" 설정, 안정적 동작을 위하여 response.setStatus(200) 설정
	
	/////////////////// - 서블릿 클래스에서 사용시 - /////////////////
	// doGet, doPost, Service 메서드에 throws IOEception 등을 등록하여 밖으로 던진다. (throws로 사용항목이 한정적임)
	// Exception 이나 SQLException 등은 throws로 안되므로 try문으로 잡아서 ServletException()으로 포장한다. ( 웹컨테이너에서 자동으로 뽑아서 처리해줌 )
	
	try{
		// 에러코드
	}catch(SQLException e){
		throw new ServletException(e);
	}catch(Exception ex){
		throw new ServletException(ex);
	}
	
	
	// 웹서버가 발생시키는 HTTP 상태코드 에러를 web.xml에 등록하여 에러페이지를 이용할수 있다.
	// 대신 전달되는 Exception 객체가 없으므로 page지시자의 isErrorPage속성을 true로 할 필요는 없다.
	// response.setstatus(200)은 해줘야함.
	
	/*
	
	<error-page>
		<error-code>404</error-code>					: HTTP 상태코드 값  ( 404: 존재하지않는 페이지, 500: 웹서버 내부의 에러  등)
		<location>/error/NotFoundError.jsp</location>	: 웹 애플리케이션 디렉터리내에서의 전체경로  ( /로 시작함 )
	</error-page>
	
	*/
	
	// error-code 타입과 exception-type 타입에서 발생되는 에러페이지가 모두 있을경우 exception-type으로 등록된 에러페이지가 우선권을 갖는다.
	
%>
