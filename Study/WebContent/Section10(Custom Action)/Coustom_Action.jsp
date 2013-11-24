<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	// Ŀ���� �׼��� ����� ���
	// 1. �±� ������ �ۼ��ؼ� ����� ���
	//		--> jsp�������� ����� �������� �±� ������ �ۼ� �� �� �����̳��� ���͸��� ������ ���⸸ �ϸ� �ȴ�.
	//		--> �ҽ� �ڵ尡 �����ȴ�.
	//		--> HTML�߽��� �����̱� ������ �����ΰ��� Ȱ���� ����. �ܼ��� ������ ������.
	//		--> �±� ���ϵ� �� Ŀ���̳ʰ� �±� Ŭ������ ��ȯ��Ų ������ �����Ѵ�.
	// 2. �±� Ŭ������ �ۼ��ؼ� ����� ���
	//		--> �ڹٹ��� + �±� Ŭ���� �ۼ���Ģ���� �ۼ��Ѵ�.( ����ϴ� ����Ŭ����, �޼��� ��)
	//		--> ������, ��Ŀ���̳� ���͸��� ��ġ, TLD���Ͽ� ���, TLD������ web.xml�� ��� ������ �ʿ�
	//		--> �ҽ��ڵ尡 �������� �ʴ´�.
	//		--> ������ ���� ������ ����.
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��1. �±� ������ �̿��� Ŀ���Ҿ׼� ����
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	
	// �����̸��� "�׼��±��̸�.tag" ����								ex) line.tag
	// ��³����� �ۼ� 													ex) --------------------------------
	// Ŀ���� �׼��� �Ӽ��� ����.										--> tag�����ڸ� �̿��Ѵ�.
	// �ѱ��� �����ϴ� �±������� ���.									--> pageEncoding��Ʈ����Ʈ�� ���	=> <%@tag pageEncoding="euc-kr"% > (euc-kr�� ����)
	// line.tag �̶�� �׼��� Ŀ���Ҿ׼� ��ü(body)�� ������� �������	-->	body-content��Ʈ����Ʈ�� ���	=> <%@tag body-content="empty"% >
	// 		=>	<util:line> ��ü���� </util:line>  : ����
	//		=>	<util:line/>					   : ����ó��
	// �� �����̳��� ���͸��� ��ġ.									--> ���ø����̼ǵ��͸�/WEB-INF/tags �Ǵ� ������ ��ġ ( WEB-INF���η� )

	// �� �������� ����
	// 1. tag ������		: �� �����̳ʰ� �±������� ó���� �� �ʿ��� ������ ���
	// 2. include ������	: �ٸ� �±� ������ ����
	// 3. taglib ������		: �±� ���Ͽ��� ����� �ٸ� Ŀ���� �׼��� �±� ���̺귯���� ���� ������ ���
	// 4. attribute ������	: Ŀ���� �׼��� ��Ʈ����Ʈ�� ���� ������ ���
	// 5. variable ������	: Ŀ���� �׼��� ������ ���� ������ ���( tag���Ͽ� �����ؼ� �����͸� jsp���������� ���� �ִ�.)
	
	// �� JSP���������� ���
	// 1. taglib �����ڸ� ����Ѵ�.		--> uri�� �ƴ� tagdir ��Ʈ����Ʈ�� �̿��Ͽ� ���͸��� ������.(�ݵ�� /�� �����ϴ� �����θ��� ����)
	//		ex) <%@taglib prefix="util" tagdir="/WEB-INF/tags" % >
	// 2. ���ϴ� ��ġ�� <util:line/> ���� ���
	
	// �� ��Ʈ����Ʈ�� �����ϴ� �±�����	--> attribute�����ڸ� ���		ex) <%@attribute name="color" % >
	// attribute�����ڸ� ����Ͽ� ��ϵ� ��Ʈ����Ʈ�� ��ũ���ÿ��( <% % > )���� �ڹٺ���ó��, EL���ȿ��� �������̸����� ��� ����	ex) <%= color % >, ${color}
	//		=> �⺻������ ���ڿ� Ÿ������ ���޵ȴ�.
	//		=> ��ġŸ������ �����ϱ� ���ؼ��� type��Ʈ����Ʈ�� ���		ex) <%@attribute name="size" type="java.lang.Integer" % >	������Ƽ�� Ÿ���� ���� ����. ����Ÿ������ ���
	//		=> ��Ʈ����Ʈ �Ӽ��� �ݵ�� �ԷµǾ�� �ϴ� ��� : required��Ʈ����Ʈ�� ���	ex) <%@attribute name="size" type="java.lang.Integer" required="true" % >
	// ��� ex) <util:line color="blue" size="25"/> : size�� �Ⱦ��� �����߻�
	
	// �� �±������� ���庯��
	// 1. request		: �� �������κ����� ��û ó��
	// 2. response		: �� ���������� ���� ó��
	// 3. out			: HTML ���
	// 4. application	: �� ���ø����̼ǿ� ���õ� ����
	// 5. session		: ���ǿ� ���õ� ����
	// 6. config		: �����̳� JSP �������� ���� ����
	// 7. jspContext	: Ŀ���� �׼��� ����� JSP �������� ���õ� ����
	
	// �� ���� ��Ʈ����Ʈ�� �����ϴ� �±�����	--> attribute�����ڸ� ���� �ʰ� ��� ��Ʈ����Ʈ�� �ѹ��� ����. dynamic-attributes ��Ʈ����Ʈ�� ����Ѵ�.
	// 		ex) line.tag
	//			<%@tag body-content="empty" % >
	//			<%@tag dynamic-attributes="attrs" % >	--> <�̸�, ��>�� java.util.Map ��ü�ȿ� ������ �� �� ��ü�� �����Ѵ�.
	//			<font color="${attrs.color}">			--> ${attrs.color} ���·� ����
	//													--> ���� ������ � ó��(��ũ��Ʈ ��ҷ�)�� �ؾ��� ���, attrs�� �ڹٺ����� ��������� �ʱ� ������ ó���� �ʿ��ϴ�.
	//			<%
	//					java.util.Map attrs = (java.util.Map) jspContext.getAttribute("attrs");		--> �±������� ����ϴ� jsp���������� ������ �����´�.
	//			 		String str = (String) attrs.get("size");
	//					int size = Integer.parseInt(str);
	//					for (int cnt = 0; cnt < size; cnt++){
	//							out.print("-");
	//					}
	//			% >
	//			</font>
	//		ex) jsp ������ 
	//			<util:line	color="blue" size="30"/>S
	//	���� ��Ʈ����Ʈ�� �����ϴ� Ŀ���� �׼��� JSP�󿡼� �ʿ�ġ ���� ��Ʈ����Ʈ�� ���Ǵ��� ��ȿ���� Ȯ������ �ʱ� ������ ������ �߻����� �ʴ´�.
	//		ex) <util:line color="blue" size"25" style="bold"/>	: style�̶� ��Ʈ����Ʈ�� ���ǵǾ� ���� ������ ������ �߻����� �ʴ´�.
	
	// �� Ŀ���� �׼��� ��ü�� ó���ϴ� �±� ����	--> tag�����ڿ� body-content��Ʈ����Ʈ ������ "scriptless" �̳� "tagdefendent"�� ����ϰ� <jsp:doBody>�� ��ü�� ��� 
	//		--> "scriptless" 	: Ŀ���� �׼��� ��ü�� ��ũ���� ��Ҹ� ����ϸ� �ȵȴ�.
	//		--> "tagdefendent"	: Ŀ���� �׼��� ��ü�� ����(��ũ��Ʋ��, EL��, �׼�)�� ��� �ؽ�Ʈ�� ����Ѵ�.
	// 		--> <jsp:doBody>	: jsp������������ ����� �� ����, tag ���Ͽ����� ��� ����
	//	ex)	box.tag
	//		<%@tag body-content="scriptless" % >
	//		<table border="1">
	//			<tr>
	//				<td>
	//					<jsp:doBody/>	=> �̰��� ��ü�� ��ġ��. ( ������ �׼��� ������ ���� ������ŭ ��ü�� �þ. )
	//				</td>
	//			</tr>
	//		</table>
	//	ex) jsp ������
	//		<util:box>��������</util:box>		--> "��������"�̶�� ��ü�� �±������� <jsp:doBody/>�� ��ġ�Ѵ�.
	
	
	// �� ������ �����ϴ� Ŀ���� �׼�						--> tag������ ������ > jsp���������� ���
	// variable �����ڸ� �̿��ؼ� ������ ������ ���´�.		ex) <%@variable name-given="result" % >		: �⺻������ StringŸ���� �ȴ�.
	// 		--> String�� �ƴ� Ÿ������ ���� : variable-class ��Ʈ����Ʈ�� ���( ������Ƽ�� Ÿ���� ���� ���� ����Ÿ���� ����Ѵ�. )
	//				ex)	<%@variable name-given="result" variable-class="java.lang.Integer" % >	:	int�� ������ ���
	//
	// Ŀ���� �׼� �±� ������ ������ jsp���������� Ŀ���� �׼� �±� ��ü �ܿ����� ����ϱ� ���ؼ��� scope ��Ʈ����Ʈ�� ���
	//		ex) <%@variable name-given="result" variable-class="java.lang.Integer" scope="AT_END"% >	: NESTED(��ü��), AT_BEGIN(�����±� ����), AT_END 3���� ���(�����±� ����)
	// 		variable �����ڷ� ������ ������ �ڹٺ����� �ƴϱ� ������ <c:set> �׼��� ����Ͽ� ���� �����Ѵ�.	ex) <c:set var="result" value="100"/>
	// 		ex) add.tag
	//			<%@attribute name="num1" type="java.lang.Integer" % >
	//			<%@attribute name="num2" type="java.lang.Integer" % >
	//			<%@variable name-given="sum" variable-class="java.lang.Integer" scopte="AT_END" % >
	//			<%	int num3 = num1 + num2; % >
	//			<c:set var="sum" value="<%= num3 % >"/>		--> variable �����ڷ� ������ ���� sum�� ���� �����Ѵ�.(jsp���� sum�� �����.)
	// 		ex) jsp������
	//			<util:add num1="10" num2="20"/>
	//				���� ���: ${sum}
	//
	// Ŀ���� �׼��� ����� �����ϴ� ������ �̸��� �±����Ͼȿ� �����Ǿ� ������ �߻��Ҽ� ���� �� �ذ�
	// 		ex) add.tag
	//			<%@attribute name="num1" type="java.lang.Integer" % >
	//			<%@attribute name="num2" type="java.lang.Integer" % >
	//		 	<%@attribute name="var" required="true" rtexprvalue="false" % >	:	��Ʈ����Ʈ�̸�, �ʼ���Ʈ����Ʈ ǥ��, ��Ʈ����Ʈ������ ��ũ���ÿ�ҳ� EL���� ���� ���� ǥ��
	//		 	<%@varialbe name-from-attribute="var" alias="sum" variable-class="java.lang.Integer" scopte="AT_END" % >	:	�����̸� sum, �±����ϳ����� ����� �̸� result
	//			<%	int num3 = num1 + num2; % >
	//		 	<c:set var="sum" value="num3"/>
	// 		ex) jsp������
	//		 	<util:add var="result" num1="10" num2="20"/>
	//		 		���� ���: ${result}
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��2. �±� Ŭ������ �̿��� Ŀ���Ҿ׼� ����
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// JSP1.2�� �±� Ŭ���� �ۼ��� : IterationTag�������̽�, BodyTag�������̽��� ����	--> ��ü�ȿ� ��ũ���� ��Ҹ� ��� ����
	// JSP2.0�� �±� Ŭ���� �ۼ��� : SimpleTag�������̽��� ����							--> ��ü�ȿ� ��ũ���� ��Ҹ� ��� �Ұ�
	
	// SimpleTag �������̽��� �����ϴ� �±� Ŭ����
	// SimpleTag �������̽����� ��� 5���� �޼��尡 �ִ�. 
	// SimpleTagSupport Ŭ���� : SimpleTag�������̽��� ��� �޼��带 ������ ���� Ŭ����
	
	// �� SimpleTagSupport Ŭ������ �̿��ؼ� �±� Ŭ������ �ۼ��ϴ� ���
	// �츮�� �ۼ��ؾ� �ϴ� �޼���� doTag �޼��� �ϳ����̴�.	--> Ŀ���� �׼��� ����� �� ȣ��ȴ�. ������ �޼���ȿ� ���
	// doTag �޼��� ��Ģ
	// 	1. public ����
	// 	2. �Ķ���Ͱ� ����� ��
	// 	3. �ܺη� ���� �� �ִ� �ͼ����� JspException, IOException
	// ����Ŭ������ SimpleTagSupport�κ��� ��ӹ��� getJspContext �޼��带 ȣ���Ͽ� JspContext��ü�� ������ getOut �޼��带 ȣ���Ͽ� JspWriter ��ü�� ��´�.
	//		--> JspWriter ��ü�� �̿��Ͽ� ��¹��� �ۼ�.
	// �⺻����
	// ex) 	public class LineTag extends SimpleTagSupport {					--> SimpleTagSupport Ŭ������ ���
	//			public void doTag() throws JspException, IOException {		--> public, �Ķ���� ����, JspException + IOException
	//				JspContext context = getJspContext();					--> Ŀ���Ҿ׼��� ����� JSP �������� ���� ������ ����ִ� JspContext ��ü
	//				JspWriter out = context.getOut();						-->	�������� HTML�� ����� JspWriter ��ü
	//				out.println("--------------------<br>");				--> ��¹�
	//				return;
	//			}
	//		}
	// �����Ͻ� javax.servlet.jsp �� javax.servlet.jsp.tagext ��Ű���� �ʿ���
	//		--> ��Ĺ�� lib ���͸��� �̾� jsp-api.jar ������ JDK�� jre/lib/ext ���͸��� ��ġ�ϸ� �ȴ�.
	// Ŭ���������� ���ø����̼ŵ��͸�/WEB-INF/classes�� ������ ��ġ��Ų��.		ex) /WEB-INF/classes/tool
	// ��ϰ���
	// 		--> 1. TLD���Ͽ� ���	: /WEB-INF/�� ���� ���͸��� ����(��, classes�� lib�Ǵ� tags ������͸� �Ʒ��� �ȵ�)
	//				tools.tld
	//				<taglib xmlns="http://java.sun.com/xml/ns/javaee" version="2.1">
	//					<tlib-version>1.0</tlib-version>					--> TLD������ ����
	//					<short-name>tool</short-name>						--> TLD������ �̸�
	//					<tag>
	//						<name>Line</name>								--> Ŀ���� �׼��� �̸�
	//						<tag-class>tool.LineTag</tag-class>				--> �±� Ŭ������ �̸�
	//						<body-content>empty</body-content>				--> ��ü�� ����
	//					</tag>
	//				</taglib>
	//		--> 2. web.xml�� TLD������ ���
	//				<taglib>
	//					<taglib-uri>/taglibs/tools.tld</taglib-uri>					--> TLD������ �ĺ��ϴ� URI (���ϴ´��)
	//					<taglib-location>/WEB-INF/tlds/tools.tld</taglib-location>	--> TLD������ ��θ�
	//				</taglib>
	
	
	// �� ��Ʈ����Ʈ�� �ִ� Ŀ���� �׼��� ����� �±� Ŭ����
	// �±� Ŭ������ ��쿡 ������ ��Ʈ����Ʈ ���� �޴� �޼��带 ���� �����ؾ� ��
	// 	1. public
	//	2. �޼����� �̸��� set���� �����ϰ� ��Ʈ����Ʈ�� ���� �̸��� ù��° ���ڸ� �빮�ڷ� �ٲ� �̸��� ���δ�.
	//	3. ��Ʈ����Ʈ ���� �ޱ����� �Ķ���� ������ ����
	//		ex)	public class LineTag extends SimpleTagSupport {
	//				private String color;
	//				...
	//				public void setColor(String color) {
	//					this.color = color;					--> ��Ʈ����Ʈ ���� �ʵ忡 ����
	//				}
	//			}
	//	TLD���Ͽ� <attribute> ������Ʈ�� �߰��ؾ� ��
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
	//					<attribute>							--> attribute ������Ʈ �߰�
	//						<name>color</name>				--> ��Ʈ����Ʈ�� �̸�
	//						<type>java.lang.String</type>	--> ��Ʈ����Ʈ�� Ÿ��
	//						<rtexprvalue>true</rtexprvalue>	--> Ŀ���� �׼��� ��Ʈ����Ʈ ���� �ͽ�������(<%=���� % >)�̳� EL��(${����})�� ���� �ִ��� ���θ� ����
	//					</attribute>
	//				</tag>
	//			</taglib>
	
	
	// �� ���� ��Ʈ����Ʈ�� �����ϴ� �±� Ŭ����
	// ��������� ������� ���� ��Ʈ����Ʈ�� ����ص� ������ �߻����� �ʴ� ������ ������
	// setDynamicAttribute ��� �̸��� �޼��常 �����ϸ� �ȴ�. ��Ʈ����Ʈ �ϳ��ϳ��� ���� �� �޼��尡 �ѹ��� ȣ��ȴ�.
	//		ex)	public class LineTag extends SimpleTagSupport implements DynamicAttributes {
	//				private Map<String, Object> attrs = new HashMap<String, Object>();			--> ��Ʈ����Ʈ���� �̸��� ���� ������ MapŸ�� �ʵ�
	//				public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {	--> uri:���ӽ����̽�, localName:��Ʈ����Ʈ�̸�, value:��
	//					attrs.put(localName, value);											--> ��Ʈ����Ʈ�� �̸��� ���� Map��ü�� ����
	//				}
	//				public void doTag() throws JspException, IOException {		
	//					JspContext context = getJspContext();					
	//					JspWriter out = context.getOut();	
	//					String color = (String) attrs.get("color");								--> Map��ü�� ����Ǿ� �ִ� ��Ʈ����Ʈ ���� �����´�.
	//					out.println("<font color='" + color + "'" + ">ȯ���մϴ�.</font>" );				
	//					return;
	//				}
	//			}
	// �ϳ��� JSP������ �ȿ��� ���� ���� �±� ���̺귯���� ����� ���� ���� �ٸ� ���ξ ���µ� �����δ� �� ���ξ�� ������ URI�� �����Ѵ�.
	// ��Ʈ����Ʈ�� �̸��� �̷� ������ ������ �����ϴ�.
	//		--> <util:line size="30" grf:font="����ü"/> : grf�� ���ӽ����̽�URI�� ����Ű�� ���ξ�
	//		--> �� ��Ʈ����Ʈ�� setDynamicAttribute �޼��忡 ���� ó���Ǵ� ���� ��Ʈ����Ʈ��� ù��° �Ķ���͸� ���� URI�� ���޵ȴ�.
	// ���� ��Ʈ����Ʈ�� �����ϴ� �±� Ŭ������ ��� TLD���� ��Ͻÿ� <attribute> ������Ʈ�� �ʿ���� <dynamic-attributes> ������Ʈ �ϳ��� ���
	// 		ex)	<taglib xmlns="http://java.sun.com/xml/ns/javaee" version="2.1">
	//				<tlib-version>1.0</tlib-version>					
	//				<short-name>tool</short-name>						
	//				<tag>
	//					<name>Line</name>								
	//					<tag-class>tool.LineTag</tag-class>				
	//					<body-content>empty</body-content>		
	//					<dynamic-attributes>true</dynamic-attributes>	--> ���� ��Ʈ����Ʈ�� �����Ѵٴ� ǥ��
	//				</tag>
	//			</taglib>
	
	
	// �� ��ü�� �ִ� Ŀ���� �׼��� ����� �±� Ŭ����
	// 1. Ŀ���� �׼��� ��ü ������ �����;� �Ѵ�.				--> getJspBody �޼��带 ���, JspFragment Ÿ���� ����
	// 2. JspFragment ��ü�� �̿��ؼ� ��ü�� ������ ���.		--> invoke �޼��带 ���, �Ķ���ͷ� ��ü ��¿� ���� ��� ��Ʈ���� �Ѱ��ش�.
	//		ex) JspFragment body = getJspBody();				--> Ŀ���� �׼��� ��ü�� �����´�.
	//			body.invoke(out)	: ���ڸ��� ��ü�� �´�.		--> out�� JspWriter ��üŸ��, null�� �־��ָ� JSP������ ��¿� ���Ǵ� ��Ʈ���� ����ȴ�.
	// TLD���Ͽ� ���
	//		--> body-content ��Ʈ����Ʈ�� ������ scripteless(��ũ��Ʋ���� ��������) �� tagdependant(��ü������ ��� ���� �ؽ�Ʈ�� �ν�)�� ����Ѵ�.
	
	
	// �� Ŀ���� �׼��� ��ü ������ �����ϴ� �±� Ŭ����
	// �±� Ŭ�������� ��ü�� ������ ���ڿ��� ���� ������, �� ���ڿ��� �����ؼ� ����ϸ� ��.
	// java.io.StringWriter Ŭ������ �̿��Ѵ�.
	//		ex) JspFragment body = getJspBody();
	//			StringWriter writer = new StringWriter();			--> StringWriter : ����� ��� �����͸� ��Ƽ� String ��ü�� ����� ����� ����
	//			body.invoke(writer)									--> ��ü�� ������ StringWriter ��ü������ ����Ѵ�.
	//			String str = writer.toString();						--> StringWriter ��ü ���� ������ ���ڿ��� �����.
	//			String newStr = str.replaceAll(oldWord, newWord);	--> ���ڿ� ����
	//			out.print(newStr);									--> ����
	
	
	// �� ������ �����ϴ� Ŀ���� �׼��� ����� �±� Ŭ����
	// page ������ ������ �ش� ������ �̸��� ���� ������ ������ �ȴ�.
	//	ex)	JspContext context = getJspContext();					--> JSP�������� ���ؽ�Ʈ ������ ������ ������.
	//		context.setAttribute("minimum", num1);					--> page������ �̸��� ���� ����.
	//	TLD���Ͽ� ���
	//	<tag>
	//		...
	//		<variable>
	//			<name-given>minimum</name-given>					--> ������ �̸�
	//			<variable-class>java.lang.Integer</variable-class>	--> ������ Ÿ��
	//			<scope>AT_END</scope>								--> ������ ��� ����
	//		</variable>
	//	</tag>
	// ������ �̸��� �����ȴٴ� ������ �����ϱ�
	// <tool:min var="minimum" num1="12" num2="35"/> : var ��Ʈ����Ʈ ���
	// �±� Ŭ���� ������ �����̸�(���⼭minimum)�� ���� ������ set-�޼��带 ����
	//		ex) private String var;
	//			public void setVar(String var) {
	//				this.var = var;
	//			}
	// TLD���Ͽ� ���
	//	<tag>
	//		...
	//		<attribute>
	//			<name>var</name>									--> ��Ʈ����Ʈ �̸�
	//			<type>java.lang.String</type>						--> ��Ʈ����Ʈ�� Ÿ��
	//			<required>true</required>							--> �ʼ� ��Ʈ����Ʈ���� ǥ��
	//			<rtexprvalue>false</rtexprvalue>					--> �ͽ��������̳� EL���� ��Ʈ����Ʈ ������ ����� �� ������ ����� ǥ��
	//		<//attribute>
	//		<variable>
	//			<name-from-attribute>var</name-from-attribute>		--> ���� �̸��� ������ ����� ��Ʈ����Ʈ�� �̸�
	//			<variable-class>java.lang.Integer</variable-class>	--> ������ Ÿ��
	//			<scope>AT_END</scope>								--> ������ ��� ����
	//		</variable>
	//		...
	//	</tag>
	
	
	// �� ���ϵ� Ŀ���� �׼�
	// <tool:list>
	//		<tool:item>������</tool:item>
	// </tool:list>
	// �θ� Ŀ���� Ŭ����, �ڽ� Ŀ���� Ŭ������ �ʿ�
	// �θ� Ŀ���� Ŭ���� : getJspBody �޼��带 ȣ���ؼ� JspFragment ��ü�� ���Ͽ� inVoke �޼��带 ȣ�⸸ �ϸ�ȴ�.
	//	ex) public void doTag() throws JspException, IOException {		
	//			JspFragment body = getJspBody();			
	//			body.inVoke(null);					--> inVoke �޼��尡 Ŀ���� �׼ǿ� ���Ե� �ڽ� Ŀ���� �׼��� �±� Ŭ������ �˾Ƽ� ȣ��
	//			return;
	//		}
	// �ڽ� Ŀ���� Ŭ���� : getParent �޼��带 ����ϰ� JspTag ��ü�� �̿��Ͽ� �θ� Ŀ���� �׼��� �´��� ��
	//	ex) public void doTag() throws JspException, IOException {		
	//			JspTag parent = getParent();
	//			if((parent == null) || !(parent instanceof ListTag)) 
	//				throw new JspException("�θ� Ŀ���� Ŭ������ �ƴϴ�.");
	//				...
	//			body.inVoke(null);
	//			return;
	//		}
	// TLD���Ͽ��� ���� �±� Ŭ������ ���
	// <tool:list bullet="@">						--> �θ� Ŀ���� �׼ǿ� ���޹��� ��Ʈ����Ʈ ���� �ڽ� Ŀ���� �׼ǿ��� ����� ���(Ŀ�´����̼�)
	//		<tool:item>������</tool:item>
	// </tool:list> 
	// �θ� Ŀ���� Ŭ���� : ��Ʈ����Ʈ���� ���� ����, set-�޼���, get-�޼���(�ڽ��ʿ��� ȣ��)�� ���� (TLD���Ͽ� attribute�� �߰�)
	// �ڽ� Ŀ���� Ŭ���� : JspTag ��ü�� �̿��Ͽ� �θ� Ŀ���� Ŭ������ ĳ�����ؼ� set-�޼��带 ȣ���Ѵ�.
	
	
	
	//---------------------------------------------------------------------------------------------------------------------------------------------
	// ��3. �±� ���̺귯�� ����� ���	--> jar
	//---------------------------------------------------------------------------------------------------------------------------------------------
	
	// �� �±� Ŭ������ ��Ƽ� �±� ���̺귯���� �����
	// 1. ���͸� ���� ������ ����� ���ϵ��� �װ��� ����
	// 2. TLD ������ ����
	// 3. ���͸� ���� ���� ��ü�� JAR ���Ϸ� ����
	
	
	
	
	
	
	
	
	
	
	
	
	

%>