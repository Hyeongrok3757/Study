<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	// JSTL( JSP Standard Tag Library )
	
	// ������ ���� ���� ( �ڹ��� ���� ����, if��, for�� ��)
	// �ٸ� jsp������ ȣ�� ( <c:redirect>, <c:import> )
	// ��¥, �ð�, ������ ����
	// JSP������ �ϳ��� ���� ����� �� ������ ����
	// �����ͺ��̽����� �Է�, ����, ����, ��ȸ
	// XML ������ ó��
	// ���ڿ��� ó���ϴ� �Լ� ȣ��
	
	// JSTL�� �����ϴ� ���� ���̺귯����
	// |	���̺귯��	|	���ξ�	|	URI										|	���
	// ---------------------------------------------------------------------------------------------------------------------------------------------------------------
	// |	�ھ�		|	c		|	http://java.sun.com/jsp/jstl/core		|	�Ϲ� ���α׷��� ���� �����ϴ°Ͱ� ������. ��������, �帧����, ������ �̵� ��
	// |	������		|	fmt		|	http://java.sun.com/jsp/jstl/fmt		|	����, ��¥, �ð��� �������ϰ� ����ȭ, �ٱ��� ���� ���
	// |	�����ͺ��̽�|	sql		|	http://java.sun.com/jsp/jstl/sql		|	�����ͺ��̽��� �����͸� �Է�, ����, ����, ��ȸ�ϴ� ���
	// |	XMLó��		|	x		|	http://java.sun.com/jsp/jstl/xml		|	XML������ ó���� �� �ʿ��� ���
	// |	�Լ�		|	fn		|	http://java.sun.com/jsp/jstl/functions	|	���ڿ��� ó���ϴ� �Լ��� ����

	// �������� --> <%@taglib prefix="���ξ�" uri="URI���" % >
	// �����ڴ� jsp�������� ���ʿ� ����ϴ� ���� �����ϴ�.(������ �ƴ�.)
	
	// jstl�� ���̺귯�� : jstl.jar + standard.jar (1.1����)
	// ��Ĺ ��ü���� ����ϵ��� �ϴ� ��� : ��Ĺ��ġ���/lib �� ��ġ
	// Ư�� �� ���ø����̼ǿ��� ��� : ���ϼ�ġ���/webapps/���ø����̼��̸�/WEB-INF/lib �� ��ġ
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��1. �ھ� ���̺귯��
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// �� <c:set> : ������ �����ϰ� �ʱⰪ�� �����ϴ� ���	ex) <c:set var="�����̸�" value="�ʱⰪ" scope="����� ����"/> (����Ÿ���� �����ʴ´�.)
	// XML������ ����� �ϹǷ� �����Ͱ� ��ġ���̶� �ݵ�� ����ǥ("")�� ��� ǥ���Ѵ�.
	// �ڹٺ����� �ƴ϶� page������ ������ ��Ʈ����Ʈ�� �ȴ�.  --> ��ũ����(<% % >)��ҷ� ����� �� ������ EL������ ��밡��.
	// value������ EL���̳� ��ũ����(<% % >)�������� ������ ������ ����Ҽ� �ִ�. --> ex) value="${name}" , value="<%=age% >"  ( ��ũ���� ��Ҵ� �� ���� �ʴ´�. )
	
	// �� <c:remove> : ������ �����Ѵ�.
	// <c:remove var="�����̸�"> 						--> 4������ �����Ϳ������� �����̸��� �ش��ϴ� �����͸� ��� �����.
	// <c:remove var="�����̸�" scope="�����Ϳ���"> 	--> ������ �������� �����̸��� �ش��ϴ� �����͸� �����.
	
	// �� <c:if> : �־��� ���ǿ� ���� � ������ �����ϵ��� �����.		ex) <c:if test="${param.num1 > param.num2}"> ���� </c:if>
	// <c:if test="����">	����	</c:if>				--> ���ǽ��� �ݵ�� EL������ ����ؾ� �Ѵ�.(�� true, false�� ���� �������� �ִ�.)
	
	// �� <c:choose>		: �ڹ��� switch ���� 	
	// �� <c:when>		: �ڹ��� case�� ����
	// �� <c:otherwise>	: �ڹ��� default�� ����
	//	<c:choose>
	//		<c:when test="${param.num > 0}">
	//				����Դϴ�.
	//		</c:when>
	//		<c:when test="${param.num < 0}">
	//				�����Դϴ�.
	//		</c:when>
	//		<c:otherwise>
	//				0�Դϴ�.
	//		</c:otherwise>
	//	</c:choose>
	
	// �� <c:forEach>	: �ڹ��� for�� ����
	
	// <c:forEach begin="���۰�" end="����">  �ݺ�����  </c:forEach>		--> begin�� end�Ӽ����� ���۰� ���� �����Ͽ� Ƚ���� ����
	
	// <c:forEach var="ī��Ʈ����" begin="���۰�" end="����">  ${ī��Ʈ����}  </c:forEach>		--> var�Ӽ����� ī���ͺ����� ���� ���� ����.
	
	// <c:forEach var="ī��Ʈ����" begin="���۰�" end="����" step="����ġ">  ${ī��Ʈ����}  </c:forEach>		--> step�Ӽ����� �����Ǵ� ��ġ�� ����
	
	// <c:forEach var="�迭���׸� ���庯��" items="${�迭�̸�}">  ${�迭���׸� ���庯��}  </c:forEach>		--> �迭�� �׸��� ������� ����Ѵ�. var�� �迭�� �׸��� ��´�.
	
	// items ��Ʈ����Ʈ�� �̿��Ҽ� �ִ� ������ 
	// 1.�迭	2.java.util.Collection	3.java.util.Iterator	4.java.util.Enumeration		5.java.util.Map		6.�޸�(,)�� ���е� �׸���� �����ϴ� ���ڿ�
	
	
	// �� <c:forTokens>	: �ڹ��� for���� java.util.StringTokenizer Ŭ������ ����� ��ģ�Ͱ� ����
	// items : ��ū�� �����ϴ� ���ڿ�, delims : �и��� ����� ��ȹ����, var : �и��� ��ũ�� ���� ���� --> 3���� ��Ʈ����Ʈ�� �����.
	// items�� "�����&��^�ܽ���#�̱��Ƴ�" ��� delims="&%#" ó�� ��ȹ���ڸ� ������ ����ϸ� �ȴ�.
	// <c:forTokens var="pet" items="�����,��,�ܽ���" delims=",">
	//				${pet} <br>
	// </c:forTokens>

	
	// �� <c:catch>		: �ڹ��� try���� ����� ����		--> ���ȿ��� �����߻��� var�Ӽ� ������ �ͼ��� ��ü�� ���� catch�� �Ʒ��� �帧�� �̵�
	// <c:catch var="exception">
	//		<%= 0 / 5 % >
	// </c:catch>
	// <c:if test="${exception != null}">		--> <c:catch>�� �ٱ������� var�Ӽ��� ��ü�� ����Ҽ� �ִ�.
	//		${e.message}						--> �ͼ��ǰ�ü�� getMessage()�޼��带 ȣ���� ���̴�. (������Ƽ)
	// </c:if>
	
	
	// �� <c:redirect>	: sendRedirect �޼���� ������ ���
	// <c:redirect url="�̵����ּ�"/>	--> �ٸ� ���ڿ� ȣ��
	
	// <c:redirect url="�̵����ּ�">
	//		<c:param name="name" value="�̸�"/>		--> �ٸ� �� �ڿ����� �̵��ϸ鼭 �����͸� �ѱ� �� ��� URL�ڿ� ���ٿ�����.
	//		<c:param name="age" value="30"/>
	// </c:redirect>
	
	
	// �� <c:import>		: �ٸ� �� ������ �������� �ٸ� ������ �� �ڿ��� ���� �������� ���Խ�Ų��.
	// <c:import url="ȣ���� �������� �ּ�">
	//		<c:param name="name" value="�̸�"/>		--> ȣ���ϴ� �� �ڿ��� �����͸� �Ѱ��־�� �� ��쿡 ���
	//		<c:param name="age" value="30"/>
	// </c:import>
	
	
	// �� <c:url>		: <c:set>�� ��������� URL�� �����ϱ� ���� ������ ���� �����.
	// <c:url var="�ּ��̸�����" value="�ش����������ּ�">
	//		<c:param name="name" value="�̸�"/>		--> URL�ڿ� ������Ʈ�� ���·� �����͸� ���� ��쿡 ���
	//		<c:param name="age" value="30"/>
	// </c:url>
	// <c:redirect url="${�ּ��̸�����}"/>		--> �����ؼ� ����� ���
	
	
	// �� <c:out>		: �� �������� ���� Ư�����ڷ� �ؼ��ɼ� �ִ� ���ڸ� �״�� ����ϴ� ���
	// <c:out value="<input>��<form>�� ���꿤����Ʈ�Դϴ�."/>	--> ""���� ���� �״�� ���
	// <c:out value="<font size=7>Ŀ�ٶ� �۾�</font>" escapeXml="true"/>	--> escapeXml����� ����ϰԵǸ� Ư�����ڰ� �̽������� �������� �ٲ��� �ʴ´�. "Ŀ�ٶ� �۾�"�� ��µ�
	// ������ <c:out value="${������}" default="No Data"/>		--> �������� ���� ������ �ƹ��͵� ������� �ʴ°� �ƴ϶� "No Data"��� ���ڿ��� ��µȴ�.

	


	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��2. ������ ���̺귯��
	//---------------------------------------------------------------------------------------------------------------------------------------------
	

	// �� <fmt:formatDate>	: ��¥�� �ð��� ����
	// java.util.DateŬ���� Ÿ���� �Ѱ��־�� �ϱ� ������ Date date = new Date(); ó�� ������ ����� ��.
	// <fmt:formatDate value="${date}" type="�������"/>	--> value���� �ݵ�� EL�����·� �;��Ѵ�.
	
	// <c:set var="date" values="<%= new Date() % >"/>	--> date��� ��Ʈ����Ʈ�� �����.
	// <fmt:formatDate value="${date}" type="date"/>	--> EL�������� value�� �����Ѵ�.																
	// => ���: "2013. 11. 23"
	
	// <fmt:formatDate value="${date}" type="date" dateStylet="long"/>	-->  ��¥ ���������� dateStylet���� ��������. 4����(full, long, medium, short) 	
	// => ���: "2013�� 11�� 23��(��)"
	
	// <fmt:formatDate value="${date}" type="time" dateStylet="full"/>	-->  �ð� ��������																
	// => ���: "���� 1�� 31�� 42�� KST"
	
	// <fmt:formatDate value="${date}" type="both" dateStylet="full" dateStylet="long"/>	--> �ð�+��¥����(both)���� �ð�,��¥�� ���� ���� 			
	// => ���: "2013�� 11�� 23��(��) ���� 1:31"
	
	// ������ <fmt:formatDate value="${date}" type="date" pattern="YYYY/MM/DD (E)"/>	--> ��������� ���� �����Ѵ�. => ���: "2013/11/23 (��)"
	// ������ <fmt:formatDate value="${date}" type="time" pattern="(a) hh:mm:ss"/>									  => ���: "(����) 1:31:50"
	// ������ <fmt:formatDate value="${date}" type="both" pattern="YYYY�� MM�� DD�� (E) a hh�� mm�� ss��"/>		  => ���: "2013�� 11�� 23�� (��) ���� 01�� 31�� 50��"
	// ������ <fmt:formatDate value="${date}" type="both" pattern="YYYY�� M�� D�� (E) a h�� m�� s��"/>		  		  => ���: "2013�� 8�� 15�� (��) ���� 1�� 31�� 9��"
	
	// �� <fmt:formatNumber>	: ��ġ�� ����
	// <fmt:formatNumber value="12345000" groupingUsed="true"/>		--> �� �ڸ����� ��ǥ ÷��	=> ���: "12,345,000"
	// <fmt:formatNumber value="3.1" pattern="#.##"/>				--> �Ҽ��� ��°���� ǥ��. #�� �ش��ڸ� ���ڰ� ������ ������� ����.  => ���: "3.1"
	// <fmt:formatNumber value="10.5" pattern="#.00"/>				--> �Ҽ��� ��°���� ǥ��. 0�� �ش��ڸ� ���ڰ� ������ 0�� ���.	 	 => ���: "10.50"
	// <fmt:formatNumber value="0.5" type="percent"/>				--> �ۼ�Ʈ ���� ǥ��. �־��� value���� 100�� ���ѵ� %�� ���δ�.		 => ���: "50%"
	// <fmt:formatNumber value="2500000" type="currency"/>			--> �ݾ� ���� ǥ��. �־��� value���� �ݾ����� ǥ��(�ش籹��ȭ�����) => ���: "��ǥ��2,500,000"
	// <fmt:formatNumber value="2500000" type="currency" currencySymbol="$"/> --> �ݾ״��� �տ� �ٴ� ȭ����� ǥ�⸦ ������.			 => ���: "$2,500,000"
	
	
	// �� <fmt:setLocale> : ������ ����
	// <fmt:setLocale value="en"/>			--> value�ǰ��� ����ڵ� en�� �����(��¥�������� ���� �ڵ����� ����)
	// <fmt:setLocale value="en_us"/>		--> value�ǰ��� '����ڵ�_�����ڵ�' ���·� ������ ����ڵ带 ����.(�ݾ״��� ǥ�� ���� �ڵ����� ����) *�ѱ�: ko_kr, *�Ϻ�: ja_jp
	
	
	// �� <fmt:timeZone> : �ð��븦 ����		--> value�� ������ �ð����� �����̵Ǵ� �����̸�. �ش� �׼ǹ��� �ȿ��� ��ȿ��.
	// <fmt:timeZone value="America/New_York">
	//		<fmt:formatDate values="${date}" type="date"/>	--> �̱� ������ ��¥ ���
	//		<fmt:formatDate values="${date}" type="time"/>	--> �̱� ������ �ð� ���
	// </fmt:timeZone>
	
	
	// �� <fmt:setTimeZone> : �ð��븦 ����	--> value�� ������ �ð����� �����̵Ǵ� �����̸�. �ش� �׼� ���������� ��� �ڵ忡 ������ ��.
	// <fmt:setTimeZone value="Europe/London"/>				--> ���� �������� ����
	
	
	// �ٱ��� ����
	// 1. ���ϴ�ǥ��_����ڵ�.properties ��� ���Ϸ� ������ �ۼ�.  ex) Intro_en.properties, Intro_kr.properties, Intro_jp.properties
	// 2. ����
	//		TITLE=Welcome To HomePage
	//		BODY=Hi~!
	//	=> ������ ��� �ƴ϶�� �ٸ��̸����� ������ ascii2native.exe�� ����Ͽ� ASCII�ڵ�� �ٲ۴�. ex) .../classes>native2ascii Intro_kr.org Intro_kr.properties
	// 3. WEB-INF/classes �����ȿ� ������ ��ġ
	
	// �� <fmt:setBundle> : ����� ������Ƽ ������ �����ϴ� ����
	// <fmt:setBundle basename="Intro"/>		--> ���ϴ�ǥ�� ����. ( ���������� �⺻��� ���������� ������Ƽ������ �ڵ����� �����Ѵ�.)
	
	// �� <fmt:message> : ������Ƽ ���� ���� �����͸� �����´�.
	// <fmt:message key="TITLE"/>				--> key��� ��Ʈ����Ʈ�� ���ؼ� �ش� �������� Ű�� ���� ������ �����´�.	=> ���: "Welcome To HomePage"
	// <fmt:message var="title" key="TITLE"/>	--> key�� �ش��ϴ� �����͸� var��� ��Ʈ����Ʈ�� ������ �����Ѵ�. 			=> ${title}�� ���.
	
	// ��<fmt:bundle> : ����� ������Ƽ ������ �����ϴ� ���� �� �׼� ������������ ��밡��. ������ �˼��־ �������� ����.
	// <fmt:bundle basename="Intro">
	//		<fmt:message var="title" key="TITLE"/>
	//		<fmt:message var="body" key="BODY"/>
	// </fmt:bundle>
	
	// properties���Ͽ� ������ ���Խ�Ű��
	// Intro_kr.properties���� TITLE=WELCOME To HomePage, {0}�� {1}��° �湮�Դϴ�.
	// <fmt:message var="title" key="TITLE">
	// 		<fmt:param>khr3757</fmt:param>		--> {0}�� �� ��
	//		<fmt:param>10</fmt:param>			--> {1}�� �� ��
	// </fmt:message>
	// ���� ${title}	=> ���: "WELCOME To HomePage, khr3757�� 10��° �湮�Դϴ�."
	
	
	// �� <fmt:requestEncoding> : POST�޼���� ���۵� �ѱ� �Է� �����͸� �ޱ����� ��� ( <% request.setCharacterEncoding("euc-kr"); % >���� ��ũ��Ʋ���� �������� ��� )
	//	--> ���������� setCharacterEncoding�޼��带 ȣ���Ѵ�.
	// <fmt:requestEncoding value="euc-kr"/>
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��3. �Լ� ���̺귯��
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// �� EL�� �ȿ��� ����� �� �ִ� EL�Լ����� ���̺귯��. �ڹ� JDK���̺귯���� java.lang.StringŬ������ ���ϴ� �޼����� ����� ���
	
	// �� ${fn:substring(str, index1, index2)}	--> str�� index1���� index2 -1 ������ �ι��ڿ��� ����
	// �� ${fn:substringAfter(str1, str2)}		--> str1���� str2�� ã�Ƽ� �� ���� �ι��ڿ��� ����
	// �� ${fn:substringBefore(str1, str2)}		--> str1���� str2�� ã�Ƽ� �� ���� �ι��ڿ��� ����
	// �� ${fn:toUpperCase(str)}					--> ��� �ҹ��ڸ� �빮�ڷ� ġȯ�� ���� ����
	// �� ${fn:toLowerCase(str)}					--> ��� �빮�ڸ� �ҹ��ڷ� ġȯ�� ���� ����
	// �� ${fn:trim(str)}						--> ���ڿ����� �յ� ���� ���ڸ� ������ ����� ����
	// �� ${fn:replace(str, src, dest)}			--> str ���ڿ��� ���Ե� src�� ��� dest�� ġȯ�� ����� ����
	// �� ${fn:indexOf(str1, str2)}				--> str1�� ���Ե� str2�� ���� �ε����� ����
	// �� ${fn:startsWith(str1, str2)}			--> str1�� str2�� �����ϸ� true, �׷��� ������ false�� ����
	// �� ${fn:endsWith(str1, str2)}				--> str1�� str2�� ������ true, �׷��� ������ false�� ����
	// �� ${fn:contains(str1, str2)}				--> str1�� str2�� �����ϸ� true, �׷��� ������ false�� ����
	// �� ${fn:containsIgnoreCase(str1, str2)}	--> str1�� str2�� �����ϸ� true, �׷��� ������ false�� ����. contains �Լ��� �޸� ��ҹ��ڸ� �������� �ʰ� ����
	// �� ${fn:split(str1, str2)}				--> str1�� str2�� �������� �и��ؼ� ���� �ι��ڿ����� �迭�� ����
	// �� ${fn:join(arr, str2)}					--> arr �迭�� ��� �׸��� ���ļ� ����, �׸� ���̿� ��ȹ���ڷ� str2�� ��
	// �� ${fn:escapeXml(str)}					--> HTML ������ ���� Ư�����ڷ� ��޵Ǵ� ��� ���ڸ� �̽������� �������� ġȯ�� ����� ����
	// �� ${fn:length(obj)}						--> obj�� ���ڿ��̸� ���ڿ��� ����(��������), List�� Collection�̸� �׸��� ���� ����
	

	
%>	