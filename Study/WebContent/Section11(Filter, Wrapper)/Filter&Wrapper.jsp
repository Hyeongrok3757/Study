<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	// ���� ���� �� ������Ʈ(JSP�������� ���� Ŭ����)�� ���� �Ȱ��� �����۾�, �����۾��� �����ϵ��� ������ �� ��쿡 ���Ϳ� ���۰� ������ ����̴�.
	//	ex) ���������� �α��� Ȯ��, ������� �������� ��� ���� �Ŀ� ����� �ΰ�
	// �̷��� �ڵ带 ���� �ۼ��صξ �ڵ� ���� �ϰ����� �����ϰ� �������� ����Ͽ� ���ϴ�.
	// Filter : ������ ����, �ڹ� Ŭ���� ���·� �����ؾ� ��(���� Ŭ����)
	//
	// ���� Ŭ���� ---------------> ���� ��ü ---------------> ����
	//					�ν��Ͻ�ȭ					�ʱ�ȭ
	//
	// 					ȣ��					ȣ��
	// �� ������ ---------------> ���� ---------------> �� ������Ʈ��
	//			   <---------------		 <---------------
	//					����					����
	//
	// �� �������� �� ������Ʈ�� ȣ��	--> ���Ͱ� ȣ���, �����۾����� --> �� ������Ʈ ȣ��, ������Ʈ �۾� ���� --> ���ͷ� ���� �� ������ �����۾� --> �� �������� ����
	//
	// �� �������� �� ������Ʈ ���̸� ������ �����͸� �����ϴ� ���� �� �� ����. ex) �޽����� ��ȣȭ�ϰų�, ������ �Ϻθ� �ɷ��� ������ ���� �� �� ����.
	// 		--> ���Ϳ� ���۸� ���� ����ϸ� ����
	
	// Wrapper : �����ϴ� ����, �� �������� �� ������Ʈ ���̸� ������ ��û �޽����� ���� �޽����� �����Ѵ�.
	// [��û ���� Ŭ����]�� [���� ���� Ŭ����]�� �� ������ ���� Ŭ���� ���·� �����ȴ�.
	//
	//												   ��û��ü			 [��û���۰�ü]
	//		�� ������ -----ȣ��----> �� �����̳� --------------> ���� --------------> �� ������Ʈ
	//												   ���䰴ü			 [���䷡�۰�ü]
	//
	// 1. ������ --ȣ��--> ������Ʈ  : ��û��ü�� ���䰴ü�� ����. doGet, doPost �޼����� �Ķ���� ������ request, response ���尴ü�� ���� ������ JSP�������� ���޵Ǵ� ��
	// 2. ���Ͱ� �����ϸ� �� �� ��ü�� ���ͷ� �Ѱ�����.
	// 3. ���Ͱ� [��û ���� Ŭ����]�� [���� ���� Ŭ����]�� ������ �� ��ü�� ������ ������ �� ������Ʈ�� ����
	// 4. �� ������Ʈ�� ���ο� �� ��ü�� ������ ��üó�� �����.
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��1. ���� Ŭ������ �ۼ�, ��ġ, ���
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// �� ���� Ŭ���� �ۼ�
	// javax.servlet.Filter �������̽��� �����ؾ� �Ѵ�.		--> init �޼���, doFilter �޼���, destroy �޼��带 ����
	// doFilter �޼��� : �� �������� �� �����̳ʷ� ��û�� ������ �� ȣ��Ǵ� �޼���	--> �����۾�, �����۾�, �� ������Ʈ ȣ���ϴ� ���� �����ؾ� ��.
	// init �޼��� : ���Ͱ�ü�� ��������� �ʱ�ȭ �۾��� �� �� ȣ��Ǵ� �޼���(���� ��ü�� ������ ����Ŭ ���� �� �ѹ��� ����)
	// destory �޼��� : �� �����̳ʰ� ���͸� �ʿ� ���ٰ� �Ǵ��ؼ� �����ϱ� ������ ȣ��Ǵ� �޼���(���� ��ü�� ������ ����Ŭ ���� �� �ѹ��� ����)
	// init �޼���� destory �޼���� �� ���� ������ �ݵ�� �� ����� ������ �Ѵ�.
	
	// doFileter �޼��� �Ķ����
	// ServletRequestŸ�� request : �� �����̳ʰ� �Ѱ��ִ� ��û ��ü
	// ServletResponseŸ�� response : �� Ŀ���̳ʰ� �Ѱ��ִ� ���� ��ü
	// ������ FilterChainŸ�� chain : ����ü���� ǥ���ϴ� Ÿ��
	//	--> ����ü�� : ���� ���� ���Ͱ� ����� ���� �ִµ� ������ ������ ���� 1->2->3->4->�� ������Ʈ->4->3->2->1 �������� ȣ��� �������� �̾��� ���͵�
	//
	//					  ȣ��			ȣ��					   ȣ��
	//		�� ������ -------> ���� -------> ����   ������   ���� -------> �� ������Ʈ
	//					<-------	  <-------					 <-------
	//					  ����			����					   ����
	//							 ��------------����ü��----------��
	//
	// �� �����̳�(����)�� ���Ͱ� ����Ǳ� ���� ����ü�ο� ���� ������ FilterChain ��ü�� ���� doFilter �޼���� �����Ѵ�.
	// 		--> ����ü���� ������ ����� ȣ���� �� �ʿ���.
	// ex) 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//				System.out.println("���� �� �� ������Ʈ�� ���۵˴ϴ�.");		--> �� ������Ʈ�� ���� �����۾� ����
	//				chain.doFilter(reqeust, response);								--> ����ü���� ������ ����� ȣ����. ( �������� ���� �Ǵ� �� ������Ʈ�� �ɼ� ���� )
	//				System.out.println("���� �� �� ������Ʈ�� �Ϸ� �Ǿ����ϴ�.");	--> �� ������Ʈ�� ���� �����۾� ����
	//		}
	//		--> System.out.println �޼����� ��¸޽����� �� �����ʿ� �α����Ͽ� ��ϵȴ�.
	
	
	// �� ���� Ŭ���� ��ġ, ���
	// 1. ���� Ŭ������ ������								--> javac ���
	// 2. ���� Ŭ������ ������ ������� �� �����̳ʿ� ��ġ	--> WEB-INF/classes �Ʒ��� ���� 	ex) WEB-INF/classes/myfilter �ȿ� ����
	// 3. ���� Ŭ������ web.xml ���Ͽ� ���
	//		--> 1. <filter> ������Ʈ�� �߰�			: ���͸� ����ϴ� ������Ʈ  
	//		--> 2. <filter-mapping> ������Ʈ�� �߰�	: ���͸� ������ �� ������Ʈ�� �����ϴ� ������Ʈ
	//	ex)	<filter>
	//			<filter-name>simple-filter</filter-name>			--> ���� �̸�
	//			<filter-class>myfilter.SimpleFilter</filter-class>	--> ���� Ŭ���� �̸�(��Ű�� �̸��� �����ؾ� ��)
	//		</filter>
	//		<filter-mapping>
	//			<filter-name>simple-filter</filter-name>			--> ���� �̸�
	//
	//		���ϴ� ������� �����ϰų� �������� �����ؼ� ����Ѵ�.
	//			<servlet-name>hello-servlet</servlet-name>			--> �ϳ��� �� ������Ʈ�� ������ �� ���, ���͸� ������ �� ������Ʈ�� �̸��� ����.(������ ��Ͻ� �̸�)
	//			<uri-pattern>test.jsp<uri-pattern>					--> * �� �������� �ʴ� ��θ��� �� ������Ʈ �ϳ��� ����ȴ�. �� ����� JSP�������� web.xml�� ��� ���ص� ��.
	//			<uri-pattern>/*<uri-pattern>						--> ���� ���� �� ������Ʈ�� �Ѳ����� ����
	//			<uri-pattern>*.jsp<uri-pattern>						--> ��� JSP �������� ����
	//			<uri-pattern>/sub1/*<uri-pattern>					--> /sub1/ �̶�� ��θ����� �����ϴ� ��� �� ������Ʈ�� ����
	//			<uri-pattern>/sub2/*<uri-pattern>					--> /sub2/ �̶�� ��θ����� �����ϴ� ��� �� ������Ʈ�� ����
	//
	//		<filter-mapping>
	//
	// ���� Ŭ���� ������ �α����� ���� ������ init�޼��忡�� ���������� destroy�޼��忡�� �ݴ°� ����.
	// ���� Ŭ���� ���ο��� ����ϴ� ���� �ʱ�ȭ �Ķ������ ��� ȿ�������� �ٷ�� ���ؼ� Ŭ���� ���κ��ٴ� web.xml�� ���� �Ķ���ͷ� �����ϴ°� ����.
	//		ex)	<filter>
	//					...
	//					...
	//				<init-param>
	//					<param-name>FILE_NAME</param-name>
	//					<param-value>C:\\logs\\myfilter.log</param-value>
	//				</init-param>
	//			</filter>
	// ���� Ŭ���� �ȿ��� ������ �ʱ�ȭ �Ķ���͸� ������ؼ��� FilterConfigŸ�� config�� �̿��Ͽ� getInitParameter�޼���� ���� �� �ִ�.
	//		ex) String filename = config.getInitParameter("FILE_NAME");
	// �� ������Ʈ�� ȣ���ϴ� ���
	//	--> 1. �������� ȣ��
	//		2. forward �޼���� ȣ��
	//		3. include �޼���� ȣ��
	//		4. �ͼ����� �߻����� �� �� Ŀ���̳ʰ� ȣ��
	// <filter-mapping> ������Ʈ ���ο� <dispatcher>������Ʈ�� ����ϸ� ȣ���Ŀ� ���� ������ ��뿩�θ� ���� ����( �������� �����ص� �� )
	//	ex) <dispatcher>REQUEST</dispatcher>	: ������
	//		<dispatcher>FORWARD</dispatcher>	: forward
	//		<dispatcher>INCLUDE</dispatcher>	: include
	//		<dispatcher>ERROR</dispatcher>		: �ͼ��� �߻�
	
	
	// �� ��û �޽����� ���� �޽������� ���Ե� ���� ��ȸ�ϱ�
	// doFilter�޼��� �ȿ��� ServletRequest�Ķ���Ϳ� ServletResponse�Ķ���͸� ���
	// ���ǻ��� : ServletResponse�Ķ���Ϳ� ���� ȣ���� �ݵ�� chain.doFilter�޼��庸�� ���߿� ȣ���ؾ� �Ѵ�. �׷��� ������� �޽����� ���� �Ǿ�����.
	// ServletRequest�� ServletResponseŸ���� �Ķ���ʹ� ������ �� �����̳ʰ� HttpServletRequest�� HttpServletResponseŸ������ �ִ� ��ü�̴�.
	//		--> Ÿ�Ժ�ȯ�� ���ؼ� �� �پ��� ������ ��� �� �� �ִ�.
	
	
	// �� ���� ü���� ���� �ٲٱ�
	// 
	//						ȣ��											�α��� ���� ��
	//	�� ������ ------------------>	������� �α����� üũ�ϴ� ����	------------------------> �α����� ȸ���� ���� �� ������Ʈ
	//													|
	//													|		�α����� �� ���� ��
	//													----------------------------------------> �α����� �����ϴ� �� ������
	//
	//	--> �α��� ���θ� üũ�ϴ� ���ʹ� ����ڰ� �α������� �ʰ� �� ������Ʈ�� ȣ������ �� ������ �� ������Ʈ ��� �α����� �����ϴ� �� ������Ʈ�� ������ �ٲ۴�.
	//
	// ex) 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//				HttpServletRequest httpRequest = (HttpServletRequest)request;		--> getSession�޼���� HttpServletRequest �������̽��� ���ϹǷ� Ÿ�� ��ȯ
	//				HttpServletResponse httpResponse = (HttpServletResponse)Response;	--> sendRedirect�޼���� HttpServletResponse �������̽��� ���ϹǷ� Ÿ�� ��ȯ
	//				HttpSession session = httpRequest.getSession();						--> ����Ȯ���� ���ؼ� ����
	//				if(session == null){
	//					httpResponse.sendRedirect("�α��������� �ּ�");					--> ������ null�̸� �α��� �������� �̵�
	//				}
	//				String id = (String) httpRequest.getAttribute("ID");
	//				if(id == null){
	//					httpResponse.sendRedirect("�α��������� �ּ�");					--> ��û ������ ID�� ���� ���ٸ� �α��� �������� �̵�
	//				}
	//				chain.doFilter(reqeust, response);								
	//		}
	
	
	// �� ����ü���� ���� ������ �������� ���
	// web.xml���Ͼ��� <filter-mapping>������Ʈ�� ������ ���� �����ȴ�.
	// ��, <url-pattern>������Ʈ�� <servlet-name>������Ʈ�� ������ ���� ��쿡�� <url-pattern>������Ʈ�� �ش��ϴ� ���͵��� ������� ���� ����ǰ�
	//		<servlet-name>������Ʈ�� �ش��ϴ� ���͵��� ������� ����ȴ�.
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��2. ���� Ŭ������ �ۼ�, ��ġ, ���
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// ��û ��ü�� �����ϴ� Ŭ������ HttpServletRequestWrapper Ŭ����(HttpServletRequest�������̽��� �����ϰ� ����)�� ����ؾ� ��.
	// ���� ��ü�� �����ϴ� Ŭ������ HttpServletResponseWrapper Ŭ����(HttpServletResponse�������̽��� �����ϰ� ����)�� ����ؾ� ��.
	// 	--> ���� �� ������Ʈ�� [��û ���� ��ü]�� [���� ���� ��ü]�� ��û��ü�� ���䰴ü�� �ν��� �� �ִ� ������ �� �� �ִ�.
	//	--> doFilter�޼����� �Ķ���� Ÿ���� ServletRequest�� ServletResponse�� ������ �������� ���۽� HttpServletRequest�� HttpServletResponseŸ���̴�.
	//
	
	
	// �� ��û ���� Ŭ������ �ۼ��ϴ� ���
	// ex) public class MyRequestWrapper extends HttpServletRequestWrapper{		--> HttpServletRequestWrapperŬ������ ����Ѵ�.
	//		private HttpServletRequest request;	
	//		public MyRequestWrapper(HttpServletRequest request) {
	//				super(request);	
	//				this.request = request;										--> �����ڷ� �Ѱܹ��� ��û ��ü�� �ʵ忡 ����
	//			}
	//		}
	//	�� super(request)
	//		--> ����Ŭ������ �Ķ���͸� ���� �ʴ� �����ڰ� �����Ƿ� ����Ŭ������ ������ �ȿ��� ����Ŭ������ ������ �� �ϳ��� ��������� ȣ���ؾ� �ϱ� ������ �ۼ�.
	//		--> �ڹ��� �������� ����Ŭ������ �����ڸ� ȣ���ϴ� ��ɹ��� �ݵ�� ����Ŭ���� ������ �ȿ��� ù ��° ��ġ�� �־�� ��.
	//
	// �����͸� �����ϴ� �ڵ��� �ۼ�
	//	--> �� ������Ʈ���� �Էµ� �����͸� �������� ���ؼ� ȣ���ϴ� �޼���� �Ȱ��� �ñ״�ó�� �޼��带 ������ ���� �� �ȿ� �ۼ��ؾ� ��.
	//  ex) ��������Ʈ���� <form>������Ʈ�� �Էµ� �����͸� �����ö� getParameter�޼���(String�Ķ���͸� �ް� String�� ����)�� ����Ѵٰ� �ϸ�
	//		public class MyRequestWrapper extends HttpServletRequestWrapper{		
	//			...
	//			public String getParameter(String name){			--> ����� �޼���� ������ �ñ״�ó�� �ۼ��Ѵ�.
	//				String value = request.getParameter(name);		
	//				if(value == null) return null;
	//				return value.toUpperCase();						--> ����ڰ� ����ϴ� �۵���Ŀ� �µ��� ������ ��.
	//			}
	//		}
	//	--> �� ������Ʈ������ ��û ��ü�� �޼����� �� �˰� ȣ���ϰ� ��.
	//
	//	���� Ŭ������ doFilter�޼��� ���ο��� ���� Ŭ������ ������ ���� chain.doFilter�޼����� �Ķ���ͷ� �Ѱ��־�� �Ѵ�.
	//	ex) MyRequestWrapper requestWrapper = new MyRequestWrapper((HttpServletRequest) request);
	//		chain.doFilter(requestWrapper, response);				--> ��û ���� ��ü�� rrequestWrapper�� �Ѱ��ش�.
	
	
	// �� ���� ���� Ŭ������ �ۼ��ϴ� ���
	// ex) public class MyResponseWrapper extends HttpServletResponseWrapper{		--> HttpServletResponseWrapperŬ������ ����Ѵ�.
	//		private HttpServletResponse response;	
	//		public MyResponseWrapper(HttpServletResponse response) {
	//				super(response);	
	//				this.response = response;										--> �����ڷ� �Ѱܹ��� ��û ��ü�� �ʵ忡 ����
	//			}
	//		}
	// �����͸� �����ϴ� �ڵ��� �ۼ�
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
	//	���� Ŭ������ doFilter�޼��� ���ο��� ���� Ŭ������ ������ ���� chain.doFilter�޼����� �Ķ���ͷ� �Ѱ��־�� �Ѵ�.
	//	ex) MyResponseWrapper responseWrapper = new MyResponseWrapper((HttpServletResponse) response);
	//		chain.doFilter(request, responseWrapper);				--> ��û ���� ��ü�� responseWrapper�� �Ѱ��ش�.
	
	
	// �� ���� �޽����� ��ü ������ �����ϴ� ���� Ŭ����
	// ���� Ŭ�������� HTML�ڵ带 ����ϱ� ���ؼ��� HttpServletResponse �Ķ���Ϳ� ���� getWriter�޼��带 ȣ���ؼ� PrintWriter ��ü�� ���Ͽ�
	// print, printf, println ���� �޼��带 ȣ���߾���. ������ �ſ� ���� Ÿ������ �����ε� �Ǿ��ְ� �̷� ������� ������ �Ұ����� ��쵵 �ִ�.
	// ���� PrintWriter ��ü�� ���� ��µǴ� HTML�ڵ带 ��� ��Ƽ� �ѹ��� �����ϴ� ����� ����ؾ���.
	//
	// - StringWriter ��ü�� ����Ͽ� �ؽ�Ʈ ����� ���ۿ� ��Ƴ��� �� ������ toString�޼��带 ȣ���ؼ� �̿��Ѵ�.
	// - StringWriter ��ü�� ���� PrintWriter �����ڿ� �Ķ���ͷ� �Ѱ��ָ� ���۷� ���� ��ų�� �ִ�.
	// 
	// ���
	// 1. ���� ���� Ŭ�����ȿ� ServletResponse �������̽��� getWriter�޼���� ������ �ñ״�ó�� ���� �޼��带 ����
	// 2. �޼��� ���ο��� PrintWriter�����ڿ� StringWriter��ü�� �Ķ���ͷ� �Ѱܼ� ���ϵǴ� PrintWriter��ü�� Ŭ������ �ʵ�� �޴´�.
	//			--> getWriter�޼��尡 ó�� ȣ��ø� ��ü�� ����� �����ϰ�, �� �������ʹ� �����ص� ��ü�� �����ϹǷ� ���� �߻��� ������ ���ֱ� ���Ͽ�
	// 3. �޼��� ���ο��� StringWriter��ü�� ������ �ʵ�� ������ �ξ�� �Ѵ�.
	//			--> ���߿� StringWriter��ü�� ���� ���ۿ� �̽� ������ �Ѳ����� �������� ���ؼ�(�޼����� ���������� ���� �ȵ�)
	// 4. �����ϴ� �ڵ�� ���� Ŭ�������� chain.doFilter�޼��带 ȣ���� ������ ����Ǿ�� �Ѵ�.(�� ������Ʈ�� ����� ����)
	// 5. ���� �޽����� ������ ����Ŭ���� ���ٴ� ����Ŭ�������� �ؾ��ϴ� ���̱� ������ ����Ŭ������ �޼��带 ����� ȣ���Ѵ�.
	// 
	// ex) 
	// ���� ���� Ŭ����
	//		public class MyResponseWrapper extends HttpServletResponseWrapper{		
	//			...
	//			PrintWriter newWriter;			--> �޼��� ȣ�⸶�� ������� �������Ͽ�
	//			StringWriter strWriter;			--> ��ü�� ���ι��ۿ� ������ �ξ��ٰ� modifyAndSend�޼��忡�� ������ �������ؼ� �޼����� ���������� ���� �ȵ�
	//			
	//			...
	//			
	//			public PrintWriter getWriter() throws IOException {		--> �� ������Ʈ�� getWriter()�� ȣ��� �۵�
	//				if (newWriter == null) {
	//					strWriter = new StringWriter();					--> ���ι��ۿ� �����ϱ� ���ؼ� ����� ��ü
	//					newWriter = new PrintWriter(strWriter);			--> ���ι��ۿ� �����ϱ� ���ؼ� ����� ��ü
	//				}
	//				return newWriter;
	//			}
	//			public void modifyAndSend() throws IOException {				--> ���� Ŭ�������� ���뺯ȯ �� ������ ���Ͽ� ȣ��� �۵�
	//				String content = strWriter.toString();						--> ���ۿ� ����� ������ ���ڿ��� ����
	//				String newContent = content.replaceAll("������", "�۸���");	--> ��ü���뿡 ������ �ش�.
	//				PrintWriter writer = response.getWriter();					--> �� �������� ����ϱ� ���� ��ü�� ���Ϲ���
	//				writer.print(newContet);									--> �������� ������ ������ ���
	//			}
	//		}
	//
	// ���� Ŭ����
	//	 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//			MyResponseWrapper responseWrapper = new MyResponseWrapper((HttpServletResponse) response);	--> ���� ���� Ŭ���� ����
	//			chain.doFilter(request, responseWrapper);													--> ����ü���� ���������� �ѱ��.
	//			responseWrapper.modifyAndSend();															--> ���䳻�뿡 ������ �ְ� �������� �����ϴ� �޼��带 ȣ��
	//		}
	
	
	// ���Ϳ� ���۰� ����Ǵ� �� �ڿ�
	//	--> �� ������Ʈ�Ӹ� �ƴ϶� �Ϲ� �� �ڿ�(HTML����, �̹������� ��)���� ����� �� �ִ�.
	//	--> ���Ϳ� ������ ���� ����� ���� � ������ �� �ڿ����� �ùٸ��� ����� �� ���� ��쵵 ����.
	//	--> getWriter�޼��带 �̿��� ����� �� ������Ʈ�� �����ϴ� ���� HTML������ ���ؼ��� ������ ���������� ���� HTML ������ getWriter�޼��带 ���� �������
	//		�ʱ� ������ ������� �ʴ´�.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
%>