<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>修改教室信息
</title>
<%!
	boolean isUpdateOk = false;
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String ClassroomNum = (String)request.getParameter("ClassroomNum");
	int iHoldNum = Integer.parseInt((String)request.getParameter("holdNum"));
	String strDeviceType = (String)request.getParameter("deviceType");
	byte b1[] = strDeviceType.getBytes("ISO-8859-1");
	strDeviceType = new String(b1);
	
	String strUpdate = "update Classroom set device='";
	strUpdate += strDeviceType+"',hold="+iHoldNum+" ";
	strUpdate += "where clno='"+ClassroomNum+"'";
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
            	<font size=6>修改教室信息成功!</font>
            	<table width="170", height="200">
            	<tr><td>
            	<font size=4>
           	     教室编号:<%=ClassroomNum%><br>
           	     容纳人数:<%=iHoldNum%><br>
           	     设&nbsp;&nbsp;&nbsp;&nbsp;备:<%=strDeviceType%><br><br>
            	</font>
          			<center>
				   	<input type="button" value="查看教室信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opClassroom/lookClassrooms')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>修改教室失败!</font>
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