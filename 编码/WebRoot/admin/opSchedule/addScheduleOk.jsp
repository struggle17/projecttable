<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<jsp:useBean id="scheduleInfo" class="opDB.CmisDBInfo" scope="page"></jsp:useBean>

<html>
<head>
<title>增加开课信息
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
	String weekday = (String)request.getParameter("weekday");
	byte b1[] = weekday.getBytes("ISO-8859-1");
	weekday = new String(b1);
	String period = (String)request.getParameter("period");
	byte b2[] = period.getBytes("ISO-8859-1");
	period = new String(b2);
	String courseNum = (String)request.getParameter("courseNum");
	String teacherNum = (String)request.getParameter("teacherNum");
	
	//先查询如果没有再插入数据
	String strQuery = "SELECT * FROM Schedule ";
	strQuery += "where clno='"+classroomNum+"' and weekday='"+weekday+"' and period='"+period+"'";
	dbCourse.connect("CmisDB");
	isHave = dbCourse.queryDBHave(strQuery);
	if (!isHave) {
		isAddOk = dbCourse.updateDB("insert into Schedule values('"+classroomNum+"','"+weekday+"','"+
									 period+"','"+courseNum+"','"+teacherNum+"')");
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
            		<font size=6>添加开课信息成功!</font>
            		<table width="270", height="200">
            		<tr><td>
	            	<font size=4>
	           	     教室编号:<%=classroomNum%><br>
	           	     星 &nbsp;&nbsp; 期:<%=weekday%><br>
	           	     节 &nbsp;&nbsp; 次:<%=period%><br>
	           	     课程名称:<%=scheduleInfo.getCourseName(courseNum)%><br>
	           	     授课老师:<%=scheduleInfo.getTeacherName(teacherNum)%><br><br>
	            	</font>
         			<center>
			   		<input type="button" value="继续添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/addSchedule')" style="width:125px;height:22px"/>
			   		<input type="button" value="查看开课信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules&id=1')" style="width:125px;height:22px"/>
			   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>添加课程失败!</font>
            	<table width="270", height="200">
            	<tr><td>
          			<center>
          			<font size=4>
          			<% if (isHave == true) {
          			%>
            		原因:<%=classroomNum%>在<%=weekday%><%=period%>已经被安排上其他课程！
            		<% 
            		} else  {
            		%>
            		原因:未知名错误!
            		<% 
            		}%>
            		</font>
          			<br><br><br>
				   	<input type="button" value="重新添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/addSchedule')" style="width:125px;height:22px"/>
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