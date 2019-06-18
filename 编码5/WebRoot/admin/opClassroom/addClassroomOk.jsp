<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>增加教室信息
</title>
<%!
	boolean isHave = false; 
	boolean isAddOk = false;
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String classroomNum = (String)request.getParameter("classroomNum");
	int holdNum = Integer.parseInt((String)request.getParameter("holdNum"));
	String deviceType = (String)request.getParameter("deviceType");
	byte b1[] = deviceType.getBytes("ISO-8859-1");
	deviceType = new String(b1);
	
	//先查询如果没有再插入数据
	String strQuery = "SELECT * FROM Classroom ";
	strQuery += "where clno='"+classroomNum+"'";
	dbCourse.connect("CmisDB");
	isHave = dbCourse.queryDBHave(strQuery);
	if (!isHave) {
		isAddOk = dbCourse.updateDB("insert into Classroom values('"+classroomNum+"','"+deviceType+"',"+holdNum+")");
        dbCourse.disConnect();
	}
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<% if (isHave == false && isAddOk) {
            	%>
            	<center>
            	<font size=6>添加教室信息成功!</font>
            	<table width="270", height="200">
            	<tr><td>
            	<font size=4>
           	     教室编号:<%=classroomNum%><br>
           	     容纳人数:<%=holdNum%><br>&nbsp;
           	     设&nbsp;备&nbsp;:<%=deviceType%><br><br>
            	</font>
          			<center>
				   	<input type="button" value="继续添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opClassroom/addClassroom')" style="width:125px;height:22px"/>
				   	<input type="button" value="查看教室信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opClassroom/lookClassrooms&id=1')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>添加教室信息失败!</font>
            	<table width="270", height="200">
            	<tr><td>
          			<center>
          			<font size=4>
          			<% if (isHave == true) {
          			%>
            		原因:教室编号已经存在!
            		<% 
            		} else  {
            		%>
            		原因:未知名错误!
            		<% 
            		}%>
            		</font>
          			<br><br><br>
				   	<input type="button" value="重新添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opClassroom/addClassroom')" style="width:125px;height:22px"/>
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