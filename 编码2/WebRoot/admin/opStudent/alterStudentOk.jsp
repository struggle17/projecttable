<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>后台首页</title>
<%!
	boolean isUpdateOk = false;
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String studentNum   = (String)request.getParameter("studentNum");
	String studentName  = (String)request.getParameter("studentName");
	byte b1[] = studentName.getBytes("ISO-8859-1");
	studentName = new String(b1);
	String strDeptname = (String)request.getParameter("deptname");
	byte b2[] = strDeptname.getBytes("ISO-8859-1");
	strDeptname = new String(b2);
	
	String strUpdate = "update Student set sname='";
	strUpdate += studentName+"',deptname='"+strDeptname+"' ";
	strUpdate += "where sno='"+studentNum+"'";
	dbCourse.connect("CmisDB");
	isUpdateOk = dbCourse.updateDB(strUpdate);
    dbCourse.disConnect();
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<% if (isUpdateOk) {
            	%>
            	<center>
            	<font size=6>修改学生信息成功!</font>
            	<table width="270", height="200">
            	<tr><td>
            	<font size=4>
           	     <P>&nbsp;&nbsp;学&nbsp;号&nbsp;:<%=studentNum%><br>
           	         学生姓名:<%=studentName%><br>
           	         所属院系:<%=strDeptname%><br><br>
            	</font>
          			<center>
				   	<input type="button" value="查看学生信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>修改学生信息失败!</font>
            	<table width="270", height="200">
            	<tr><td>
          			<center>
          			<font size=4>
            		原因:未知名错误!
            		</font>
          			<br><br><br>
				   	<input type="button" value="返回后台首页" onclick="window.location.href('<%=basePath%>admin/index.jsp')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	}%>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>