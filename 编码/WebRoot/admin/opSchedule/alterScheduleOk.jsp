<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<jsp:useBean id="scheduleInfo" class="opDB.CmisDBInfo" scope="page"></jsp:useBean>

<html>
<head>
<title>修改开课信息
</title>
<%!
	boolean isUpdateOk = false;
	boolean isDelOk = false;
	boolean isHave = false; 
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
	
	//从session中读取原有的主码值,并销毁
	String ogClassroom = (String)session.getAttribute("ogClno");
	String ogWeekday = (String)session.getAttribute("ogWeekday");
	String ogPeriod = (String)session.getAttribute("ogPeriod");
	
	//为了安全考虑，销毁session中的值
	if (ogClassroom != null && ogWeekday != null && ogPeriod != null) {
		session.removeAttribute("ogClno");
		session.removeAttribute("ogWeekday");
		session.removeAttribute("ogPeriod");
		//如果主码改变了就需要删除原来的元组，增加新的元组，并检测主码是否冲突
		//如果主码和原来一样，则只更新
		if (ogClassroom.equals(classroomNum) && ogWeekday.equals(weekday) && ogPeriod.equals(period)) {
			String strUpdate = "update Schedule set cno='"+courseNum+"',tno='"+teacherNum+"' ";
			strUpdate += "where clno='"+classroomNum+"' and weekday='"+weekday+"' and period='"+period+"'";
			dbCourse.connect("CmisDB");
			isUpdateOk = dbCourse.updateDB(strUpdate);
		    dbCourse.disConnect();
		} else {
			//先查询是否有该记录
			String strQuery = "SELECT * FROM Schedule ";
			strQuery += "where clno='"+classroomNum+"' and weekday='"+weekday+"' and period='"+period+"'";
			dbCourse.connect("CmisDB");
			isHave = dbCourse.queryDBHave(strQuery);
			
			if (!isHave) {
				String strDel = "delete from Schedule where clno='"+ogClassroom+"' and weekday='"+ogWeekday+"' and period='"+ogPeriod+"'";
				dbCourse.connect("CmisDB");
				isDelOk = dbCourse.updateDB(strDel);
				if (isDelOk) {
					isUpdateOk = dbCourse.updateDB("insert into Schedule values('"+classroomNum+"','"+weekday+"','"+
											    	period+"','"+courseNum+"','"+teacherNum+"')");
				}
			    dbCourse.disConnect();
			}
		}
	}
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
            		<font size=6>修改开课信息成功!</font>
            		<table width="150", height="200">
            		<tr><td>
	            	<font size=4>
	           	     教室编号:<%=classroomNum%><br>
	           	     星 &nbsp;&nbsp; 期:<%=weekday%><br>
	           	     节 &nbsp;&nbsp; 次:<%=period%><br>
	           	     课程名称:<%=scheduleInfo.getCourseName(courseNum)%><br>
	           	     授课老师:<%=scheduleInfo.getTeacherName(teacherNum)%><br><br>
	            	</font>
          			<center>
				   	<input type="button" value="查看开课信息" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>修改开课信息失败!</font>
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