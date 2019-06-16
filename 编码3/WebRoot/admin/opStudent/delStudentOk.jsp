<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>删除学生信息
</title>
<%!
	boolean isDelOk = false;
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String strSno = (String)request.getParameter("sno");
    
	String strDel = "delete from Student where sno='"+strSno+"'";
	dbCourse.connect("CmisDB");
	isDelOk = dbCourse.updateDB(strDel);
    dbCourse.disConnect();
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<% if (isDelOk) {
            	%>
            	<center>
            	<font size=6>删除学生信息成功!</font>
            	<table width="220", height="200">
            	<tr><td>
            		<center>
            		<font size=4><%=strSno%>已经成功删除!</font>
            		<br><br><br>
				   	<input type="button" value="查看学生信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>删除学生信息失败!</font>
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