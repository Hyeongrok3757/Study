<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		
	// 사용자에게 편리한 소프트웨어 제공, 개발작업의 효율성과 유지관리의 용이성을 추구
	//		--> "개발 표준" 필요
	//			1. 설계 모델 : 개략적인 설계 방침을 제시	ex) 모델1 이나 모델2
	//			2. 웹 템플릿 : 웹페이지의 골격에 해당하는 공통부분만을 추출해서 단일 파일로 만들고, 웹 서버가 URL요청을 받았을 때 단일파일들을 이용해서
	//							동적으로 웹 페이지를 생성하도록 만드는는데 이러한 공통 코드 파일을 웹 템플릿이라고 한다.
	//
	// 설계
	// 프로그램이 해야 할 일을 적당한 크기로 나누어서 모듈화를 해야함
	//
	// 모델1 : 비교적 간단한 웹 애플리케이션에 적합한 설계 모델, 2종류의 모듈화
	//		--> JSP페이지 : 데이터 입출력 담당
	//		--> 자바빈 클래스 : 데이터 처리를 담당
	//
	// 모델2 : 비교적 복잡한 웹 애플리케이션에 적합한 설계 모델, 3종류의 모듈화
	//		--> 서블릿 클래스 : 데이터 입력과 데이터 처리
	//		--> JSP페이지	  : 데이터 출력
	//		--> 자바빈 클래스 : 서블릿클래스가 JSP페이지로 넘겨주는 데이터를 포장하는 일
	//
	// 웹 탬플릿
	// 같은 웹사이트에 속하는 웹 페이지들끼리 사용자 이터페이스에 일관성을 부여함
	// 웹페이지의 골격에 해당하는 공통부분만을 추출해서 단일 파일로 만들고, 웹 서버가 URL요청을 받았을 때 단일파일들을 이용해서
	//							동적으로 웹 페이지를 생성하도록 만든다.
	// 웹 템플릿 : 똑같은 모양을 그려낼 수 있는 판
	// - 공통부분을 구현하는 코드 --> HTML과 JSP의 문법을 이용해서 작성
	// - 웹 페이지마다 달라져야 하는 부분 --> <jsp:include>표준액션을 이용해서 외부 파일로부터 불러온다.
	
	

	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶1. 모델1과 모델2로 웹 애플리케이션 설계하고 구현하기
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	
	// ★ 모델1
	// JSP페이지 	: 데이터 입출력 담당
	// 자바빈 클래스: 데이터 처리를 담당
	// 	--> 자바빈클래스는 순수 클래스의 형태로 만들고 메서드로 데이터 처리
	//	--> JSP페이지에서 자바빈클래스를 생성하고 자바빈 클래스 객체를 호출해서 입출력한다.
	
	// ★ 모델2
	// JSP페이지로부터 자바 코드가 확실히 제거될수 있다.	--> 프로그래머와 웹 디자이너 간의 분업화가 더 깔끔하게 이루어짐.
	// 요즘은 난이도와 상관없이 모델2의 사용이 권장된다.
	// 서블릿 클래스 : 데이터 입력과 데이터 처리
	// JSP페이지	 : 데이터 출력
	// 자바빈 클래스 : 서블릿클래스가 JSP페이지로 넘겨주는 데이터를 포장하는 일
	
	// ★ MVC패턴
	// 객체지향 프로그래밍의 아키텍처 패턴중 하나
	// 애플리케이션을 구성하는 방법이 모델2의 모듈화 방법과 상당히 유사하다. 그래서 모델2를 MVC패턴을 따르는 설계모델로 보기도 한다.
	// M : 모델(Model)			--> 데이터 처리 로직을 구현
	// V : 뷰(View)				--> 실행 결과를 출력
	// C : 컨트롤러(Controller)	--> 데이터를 입력받고, 모델과 뷰를 호출
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ▶2. 웹 템플릿으로 일관되 사용자 인터페이스 만들기
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// 웹 페이지상의 각 구성요소들을 분할시켜 각각의 파일로 만든다. ex) 보통 머리부, 좌측메뉴, 우측메뉴, 꼬리뷰 등으로 나뉜다.
	// 웹 페이지상에 각 구성요소들이 자리를 잡기 위해서는 HTML의 <TALBE>엘리먼트를 사용하는 것이 좋다.
	// 웹 페이지마다 달라져야 하는 몸체의 내용은 <jsp:include> 표준 액션을 이용해서 외부 파일로부터 포함시키는 것이 적당하다.
	//		--> 비슷한 기능을 하는 include 지시자는 웹 템플릿의 내용이 바뀔 때마다 모든 웹 페이지의 서블릿 클래스가 다시 생성되기 때문에 웹사이트의 성능이 저하된다.
	//			따라서 적합하지 않다.
	
	
	// 장바구니 기능 중에서...
	// <a href="#" onClick='window.open("add-item-to-cart?CODE=${BOOKS_INFO.code[cnt]", "cart_result", "width=400, heigth=150".focus())'> 장바구니 담기 </a>
	//	--> href애트리뷰트의 값에 #을 준 이유 : 본래 있던 창의 내용이 바뀌지 않도록 만들기 위함.
	//	--> 400x150의 새로운 창을 만들어서(window.open()) cart_result라는 이름을 부여하고, 그 창에서 장바구니 관리 애플리케이션(add-item-to-cart)을 호출한 후 
	//		그 결과를 출력하고, 그 창이 컴퓨터 화면의 전면에 나타나도록 만들어라(focus())는 의미.
	
	// 간단한 장바구니 데이터는 사용자가 웹 브라우저를 닫기 전까지 유지하면 되므로 session데이터 영역에 저장하는 것이 적합하다.(물론 DB도 가능)
	// <a href="#" onClick='self.close()'>닫기</a>
	//	--> 닫기 링크를 클릭하면 현재의 창(self)을 단는(close())일을 하는 자바스크립트 명령문
	
	
	

%>