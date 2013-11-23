<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    
	// Action Tag(Action) = XML����� �̿��Ͽ� ������ JSP������ Ȯ�� 
	// 1. ǥ�� �׼�(standard action)	: jsp���������� �ٷ� ���		-> ���ξ�(prefix)�� jsp�� ���		ex) <jsp:include page="sub.sjp"/>
	// 2. Ŀ���� �׼�(custom action)	: ������ ���̺귯���� ��ġ �� ���	-> ���ξ�(prefix)�� �����ؼ� ���	ex) <c:set var="cnt" value="0"/>
	// �� �����̳� �ʿ��� ����ǰ� �� ����� �� �������� ��µȴ�.
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��1. ǥ�� �׼�
	//---------------------------------------------------------------------------------------------------------------------------------------------
 	
	// �� jsp:include		-> �ش� ������ �ٸ� �� �ڿ��� ���Խ�Ų��.    ex) <jsp:include page="jsp�����̳� html������ �ּ�"/>
	// jsp�������� ����� �� �������� �ڿ��� ���Խ�Ų��.( <%@include% >�����ڴ� jsp�������� ���� Ŭ������ ��ȯ�� �� ���ԵǹǷ� ���� Ŭ������ �ڵ� �Ϻΰ� �ȴ�.)
	//	GregorianCalendar now = new GregorianCalendar();
	//	String date = String.format("%TY�� %Tm�� %Td��", now, now, now);	-> 2013�� 11�� 23��
	//	String time = String.format("%Tp %TR", now, now);					-> ���� 14:00
	
	// �� jsp:forward		-> �ٸ� jsp�������� ��� �ѱ涧 ���.(request�� ���޵ȴ�)		ex) <jsp:forward page="jsp����"/>   
	
	// javaBean�� Ȱ�� : �ڹٺ� Ŭ������ �ַ� ������Ƽ ���� �а� ���� ��ɿ� ������ ������ �ִ�.
	// �� jsp:useBean		-> ���ο� �ڹٺ� ��ü�� �����ϰų� ������ �ڹٺ� ��ü�� �������� ���� ǥ�ؾ׼�
	//	ex) <jsp:useBean id="�����̸�" class="Ŭ�����̸�" scope="���ϴµ����� ����"/>
	
	// �� jsp:setProperty	-> �ڹٺ� ������Ƽ�� ���� �����ϴ� ǥ�ؾ׼�
	//	ex) <jsp:setProperty name="�����̸�" property="������Ƽ�̸�" value="������Ƽ��"/>
	
	// �� jsp:getProperty	-> �ڹٺ� ������Ƽ�� ���� �����ٰ� ����ϴ� ǥ�ؾ׼�
	//	ex) <jsp:getProperty name="�����̸�" property="������Ƽ�̸�"/>		--> �׼��±� �ڸ��� ������Ƽ�̸��� ���� ��µȴ�.
	
	// ������Ƽ���� Ÿ���� ���� Ŭ������ ��ȯ�� �� �ڵ����� ��ȯ�ȴ�.
	// jsp:useBean���� ������ ��ü�� �⺻����(default) ���������� �ش�jsp�̴�. ( scope="page" �� �����ϴ�. )
	// scope�Ӽ��� page, request, session, application �� ������ ������ �����ؼ� ���������� ������ �� �ִ�.
	// ���� �ٸ� jsp��� ����ϱ� ���ؼ��� �ּ� request�̻��� �����ؾ� �Ѵ�.
	
	// jsp ���� forward	---> jsp������ :  scope������ request�� �����ϰ� �Ȱ��� jsp:useBean�׼��� ����Ѵ�.( ������ ����� �ִٸ� ������ ����. )
	
	// servlet ���� request�� ���ε� �� forward	---> jsp������ : scope������ request�� �����ϰ� jsp:useBean�׼��� ���.
	
	// �� �������κ��� �Էµ� �����͸� �ڹٺ� ������Ƽ�� �޴¹��
	// 1. <jsp:setProperty name="�����̸�" property="������Ƽ�̸�" value="<%=age % >"/>  ( �ڹ��ڵ�� int������ age�� �ְ��� ��� ) ( ���� ��ȿ�� �Ⱦ� )
	// 2. �� <jsp:setProperty name="�����̸�" property="������Ƽ�̸�" value="${param.age}"/> ( EL���� ���Ͽ� �Ķ���Ϳ� ����. �ڵ����� �˸°� ����ȯ�� )
	// 3. �� <jsp:setProperty name="�����̸�" property="������Ƽ�̸�" param="age"/>	( ���������� �Էµ� �������̸������� ����. �ڵ����� ����ȯ )
	// 4. ������ <jsp:setProperty name="�����̸�" property="*"/> ( ���������� �Էµ� ��� �����Ͱ� �Ȱ��� �̸��� ���� �ڹٺ� ������Ƽ�� ���� �����ȴ�. )(����� �����ϰ� ������ ��)
	
	// �ڹٺ��� ������ Ȱ��
	// Ŭ���� Animal�� ����ϴ� Cat, Dog�� ������ ��
	// <jsp:useBean id="ani" class="my.Cat" scope="request"/>  -- cat.jsp
	// <jsp:useBean id="ani" class="my.Animal" scope="request"/>  -- animal.jsp
	// <jsp:useBean id="ani" class="my.Dog" scope="request"/>  -- dog.jsp
	// ���� �������� ����Ǵµ� ���� AnimalŬ������ �������̽� �Ǵ� �߻�Ŭ������� class�� �ƴ� type ���� �ٲ��� �Ѵ�.
	// <jsp:useBean id="ani" type="my.Animal" scope="request"/>  -- animal.jsp
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��2. �� �ۿ� ������ ǥ�� �׼�
	//---------------------------------------------------------------------------------------------------------------------------------------------
 	
	// 1. ���ø��� �ҷ����� �±׸� ����� ǥ�� �׼�
	// <jsp:plugin type="applet" code="HelloJavaApplet.class" width="200" height="100"/>  (���ø�Ŭ������ jsp���ϰ� ������ ��ġ�� �����)
	
	// ���ø��� �Ķ���͸� �ʿ�� �Ѵٸ�
	// <jsp:plugin type="applet" code="HelloJavaApplet.class" width="200" height="100">
	// 		<jsp:params>
	//			<jsp:param name="greeting" value="�ȳ��ϼ���"/>
	//			<jsp:param name="font" value="�ü�ü"/>
	//		</jsp:params>
	// </jsp:plugin>
	
	
	// 2. ��ũ���� ���(<% % >, <%= % >, <%! % >���� ����)�� ����ϴ� ǥ�� �׼�
	
	// <jsp:scriptlet> int cnt = 0; </jsp:scriptlet>	-->  ��ũ��Ʋ���� ������ ����		== <% int cnt = 0; % >
	// <jsp:expression> cnt + 1 </jsp:expression>		-->  �ͽ������ǰ� ������ ����(EL��) == <%= cnt + 1 % >
	// <jsp:declaration> 								-->  ����ο� ������ ����			== <%! add�޼��� % >
	//		private int add(int num1, int num2){
	//			return num1+num2;
	//		}
	// </jsp:declaration>
	
	// �� �ۿ� : �����ڿ� ���� ������ �Ѵ�. ( �ַ� ���α׷��Ӱ� ���� ¥�� �ڵ尡 �ƴ� jsp�ڵ带 �ڵ����� �����ϴ� �������� �̿��Ҷ� ����Ѵ�. )
	// <jsp:directive.page contentType="text/html; charset=euc-kr"/>	--> page�����ڿ� ������ ����
	// <jsp:directive.include file="sub.jsp"/>							--> include�����ڿ� ������ ����
	
	
	
	
    
%>