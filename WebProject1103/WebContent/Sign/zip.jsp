<%@ page pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setContentType("text/html;euc-kr");
	String dong = request.getParameter("post_name");
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
%>
<script language="javascript"> 
   function search() { 
     if (document.search_form.post_name.value=="") { 
     alert("ã�����ϴ� ��/��/���� �Է��ϼ���~"); 
     document.search_form.post_name.focus(); 
     return false; 
        } 
          else { 
                     document.search_form.submit; 
        } 
     } 
     
     function set(zip1, zip2, s_ok) { 
       opener.document.form_user.user_zipcode1.value=zip1;  // 
       opener.document.form_user.user_zipcode2.value=zip2;
       opener.document.form_user.m_addr_base.value=s_ok;
       self.close(); 
         } 
</script>

<html>
<head>
<title>�����ȣ �˻�</title>
</head>
<body onLoad="document.search_form.post_name.focus()">
	<form method="post" action="zip.jsp" name="search_form">
		<table width="420" border="0" height="79" align="center">
			<tr>
				<td height="22" align="center">�����ȣ �˻�</td>
			</tr>
			<tr>
				<td height="30" align="center">��/��/�� ������ �Է��� �ּ���(��:����)</td>
			</tr>
		</table>
		<table width="316" border="0" cellspacing="0" align="center">
			<tr>
				<td width="92" height="32" align="center">�˻��ܾ�</td>
				<td width="224" height="32">
					<%
						if (request.getParameter("post_name") == null) {
					%> 
					<input type="text" name="post_name" size="20"> <%
 	} else {
 %> 
					<input type="text" name="post_name" size="20" value="<%=dong%>"> <%
 	}
 %>
					<input type="submit" name="submit" value="ã ��" onClick="search()">
				</td>
			</tr>
		</table>
		<table width="420" border="0" cellspacing="0" align="center">
			<tr height="25" bgcolor="#6699FF">
				<td width="60" align="center"><font color=white>POST</font>
				</td>
				<td width="360" align="center"><font color=white>�ּ�</font>
				</td>
			<tr>
<%
	if (request.getParameter("post_name") != null) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521", "system",
					"14251425");
			stmt = con.createStatement();
		} catch (ClassNotFoundException e) {
			out.println("Couldn't load database driver: " + e.getMessage());
		}

		String sql = "select * from zipcode where dong like '" + dong+ "%'";
		rs = stmt.executeQuery(sql);
		for (int i = 1; rs.next(); i++) {
			String zipcode = rs.getString("zipcode");
			String sido = rs.getString("sido");
			String gugun = rs.getString("gugun");
			String dong1 = rs.getString("dong");
			String bunji = rs.getString("bunji");

			String temp_s_ok = sido + " " + gugun + " " + dong1 + " " + bunji;
			String s_ok = temp_s_ok.replaceAll("null", " ");
			String zip1 = zipcode.substring(0, 3);
			String zip2 = zipcode.substring(4, 7);
%>
			
			<tr>
				<td width="60" bgcolor="aliceblue" align="center"><%=zip1%>-<%=zip2%></td>
				<td width="360"><a
					href="javascript:set('<%=zip1%>','<%=zip2%>','<%=s_ok%>')"><%=s_ok%></a>
				</td>
			</tr>

			<%
				}
				} else {
			%>
			<tr>
				<td width="60"></td>
				<td width="360">[�˻��ϼ���]</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
	<%
		if (con != null) {
			con.close();
		}
	%>
</body>
</html>


