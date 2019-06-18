<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" errorPage=""%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<html>
	<head>
		<TITLE>CIMS教室信息管理系统 －－ 修改用户密码SQL</TITLE>	
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta http-equiv="refresh" content="0;url=adminWelcome.jsp">
		
	</head>
	<body>
		<%
		    boolean isUpdateOk = false;
			String user = (String) session.getAttribute("userName");
			String alterpwd1 = new String(((request.getParameter("alterpwd1"))
					.trim()).getBytes("ISO-8859-1"));
			String alterpwd2 = new String(((request.getParameter("alterpwd2"))
					.trim()).getBytes("ISO-8859-1"));
			String strUpdate = "update admin set password='"+alterpwd2+"'";
	
	     strUpdate += "where userName='"+user+"'";
	dbCourse.connect("CmisDB");
	        isUpdateOk = dbCourse.updateDB(strUpdate);
    dbCourse.disConnect();

			
			
			
			
			
		%>
		<script language="javascript">
alert("修改用户密码成功！");
</script>


	</body>
</html>
