<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" errorPage=""%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<jsp:useBean id="result" class="cd.ConnetDB" scope="page"/>
<HTML>
	<HEAD>
		<TITLE>CIMS������Ϣ����ϵͳ ���� �޸�����SQL</TITLE>

		<meta http-equiv="refresh" content="0;url=alterpasswd.jsp">
	</HEAD>
	<BODY>
		<%
			boolean isUpdateOk = false;
			String user = (String) session.getAttribute("userName");
			String type = (String) session.getAttribute("role");
			String alterpasswd1 = new String(((request.getParameter("alterpwd1"))
					.trim()).getBytes("ISO-8859-1"));
			String alterpasswd2 = new String(((request.getParameter("alterpwd2"))
					.trim()).getBytes("ISO-8859-1"));
			String oldpassword = new String(((request.getParameter("userpasswd"))
					.trim()).getBytes("ISO-8859-1"));
			String s="select * from admin where userName='"
					+ user + "' and role='" + type + "' and password='"
					+ oldpassword + "'";
            ResultSet rs = result.connetSQL(s);

			if (rs.next()) {
				
				String strUpdate = "update admin set password='"+alterpasswd2+"'";
	            strUpdate += "where userName='"+user+"'";
	            dbCourse.connect("CmisDB");
	            isUpdateOk = dbCourse.updateDB(strUpdate);
                dbCourse.disConnect();rs.close();
		%>
		<script language="javascript">
alert("�����޸ĳɹ������ס�����룡");
</script>
		<% }else { %>
		<script language="javascript">
alert("ԭ��������������������룡");
</script>
		<% } %>
	</BODY>
</HTML>


