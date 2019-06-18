<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<jsp:useBean id="scheduleInfo" class="opDB.CmisDBInfo" scope="page"></jsp:useBean>

<html>
<head>
<title>修改开课信息
</title>
	<script>
	function checkFrom(form) 
	{
		return true;
	}
	</script>
  <%
	String strClno = (String)request.getParameter("clno");
	String strWeekday = (String)request.getParameter("w");
	byte b1[] = strWeekday.getBytes("ISO-8859-1");
	strWeekday = new String(b1);
	String strPeriod = (String)request.getParameter("p");
	byte b2[] = strPeriod.getBytes("ISO-8859-1");
	strPeriod = new String(b2);
	
	//用session存储这几个变量
	session.setAttribute("ogClno", strClno);
	session.setAttribute("ogWeekday", strWeekday);
	session.setAttribute("ogPeriod", strPeriod);
	
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
    String strQuery = "SELECT * FROM Schedule ";
    strQuery += "where clno='"+strClno+"' and weekday='"+strWeekday+"' and period='"+strPeriod+"'";
    dbCourse.connect("CmisDB");
    ResultSet rs = dbCourse.queryDB(strQuery);
    
    String strCourseNum = "";
    String strTeacherNum = "";
    
    if (rs.next()) {
    	strCourseNum = rs.getString(4);
    	strTeacherNum = rs.getString(5);
    }
    
    scheduleInfo.loadClassrooms();
    scheduleInfo.loadCourses();
    scheduleInfo.loadTeachers();
    
    String courseNumString = scheduleInfo.getCourseString();
    String courseNameString = scheduleInfo.getCourseNameString();
    String courseDeptnameString = scheduleInfo.getCourseDeptnameString();
    String teacherNumString = scheduleInfo.getTeacherString();
    String teacherNameString = scheduleInfo.getTeacherNameString();
    String teacherDeptnameString = scheduleInfo.getTeacherDeptnameString();
    String deptnameString = cvariable.getDeptnameString();
    
    String strCourseDeptname = scheduleInfo.getCourseDeptName(strCourseNum);
  %>
  
	<script> 
	function redirect(index)
	{
		var vCourseNum = new Array(<%=courseNumString%>);
		var vCourseDeptname = new Array(<%=courseDeptnameString%>);
		var vTeacherNum = new Array(<%=teacherNumString%>);
		var vTeacherDeptname = new Array(<%=teacherDeptnameString%>);
		var vCourseName = new Array(<%=courseNameString%>);
		var vTeacherName = new Array(<%=teacherNameString%>);
		var vDeptname = new Array(<%=deptnameString%>);
		
		var select1 = document.alterScheduleForm.courseNum;
		var select2 = document.alterScheduleForm.teacherNum;
		var nowDeptname = vDeptname[index];
		
		for (var i = select1.options.length; i >= 0; i--)
		{
			select1.remove(i);
		}
		for (var i = select2.options.length; i >= 0; i--)
		{
			select2.remove(i);
		}
		for (var i = 0; i < vCourseNum.length; i++)
		{
			if (vCourseDeptname[i] == nowDeptname) {
				select1.add(new Option(vCourseName[i], vCourseNum[i]));
			}
		}
		if (select1.options.length != 0)
		{
			select1.options[0].selected=true;
		}
		for (var i = 0; i < vTeacherNum.length; i++)
		{
			if (vTeacherDeptname[i] == nowDeptname) {
				select2.add(new Option(vTeacherName[i], vTeacherNum[i]));
			}
		}
		if (select2.options.length != 0)
		{
			select2.options[0].selected=true;
		}
	}
	
	function checkFrom(form)
	{
		var strSelect1 = form.courseNum;
		var strSelect2 = form.teacherNum;
		
		if (strSelect1.selectedIndex == -1)
		{
			alert("课程不能为空!\n请增加课程信息");
			return false;
		}
		if (strSelect2.selectedIndex == -1)
		{
			alert("教师不能为空!\n请增加教师信息");
			return false;
		}
		return true;
	}
	</script>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>修改开课信息</font>
            	<table width="330", height="160">
            	<tr><td>
            		<form id="alterSchedule" name="alterScheduleForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opSchedule/alterScheduleOk" onsubmit="return checkFrom(this);">
            			<P> 教室编号:<Select name="classroomNum"  style="width:131px">
	            							<%
	            							String[] classrooms = scheduleInfo.getClassrooms(); 
	            							for (int i = 0; i < classrooms.length; i++) {
	            								if (classrooms[i].equals(strClno)) {
	            							%>
	            									<option value=<%=classrooms[i]%> selected><%=classrooms[i]%>
	            								<% 
	            								} else {%>
	            									<option value=<%=classrooms[i]%>><%=classrooms[i]%>
	            							<%  }
	            							}%>
							   		    </Select><br>
							星 &nbsp;&nbsp; 期:<Select name="weekday" style="width:131px">
		            							<%
		            							String[] weekdays = cvariable.getWeekDays();
		            							for (int i = 0; i < weekdays.length; i++) {
		            								if (weekdays[i].equals(strWeekday)) {
		            							%>
		            									<option value=<%=weekdays[i]%> selected><%=weekdays[i]%>
		            								<%
		            								} else {%>
		            									<option value=<%=weekdays[i]%>><%=weekdays[i]%>
		            							<%  }
		            							}%>
										   	  </Select>
							节次:<Select name="period">
           							<%
           							String[] periods = cvariable.getPeriods();
           							for (int i = 0; i < periods.length; i++) {
           								if (periods[i].equals(strPeriod)) {
           							%>
           									<option value=<%=periods[i]%> selected><%=periods[i]%>
           								<% 
           								} else {%>
           									<option value=<%=periods[i]%>><%=periods[i]%>
           							<%  }
           							}%>
							   	</Select><br>
						     所属院系:<Select name="deptname" style="width:131px" onChange="redirect(document.alterScheduleForm.deptname.options.selectedIndex)">
					    		    <%
					    		    String strTemp[] = cvariable.getDeptnames();
					    		    int length = strTemp.length;
					    		    for (int i = 0; i < length; i++) {
					    		    	if (strTemp[i].equals(strCourseDeptname)) {
					    		    %>
					    		    		<option value=<%=strTemp[i]%> selected><%=strTemp[i]%>
					    		    	<% 
					    		    	} else {%>
					    		    		<option value=<%=strTemp[i]%>><%=strTemp[i]%>
					    		    <%  }
					    		    }%>
					   		        </Select><br>
						   	课程名称:<Select name="courseNum" style="width:131px">
            							<%
            							String[] courseNums = scheduleInfo.getCourses();
            							String[] courseNames = scheduleInfo.getCourseNames();
            							String[] courseDeptnames = scheduleInfo.getCourseDeptnames();
            							for (int i = 0; i < courseNames.length; i++) {
            								if (courseDeptnames[i].equals(strCourseDeptname)) {
            									if (courseNums[i].equals(strCourseNum)) {
            							%>
            										<option value=<%=courseNums[i]%> selected><%=courseNames[i]%>
            									<% 
            									} else {
            									%>
            										<option value=<%=courseNums[i]%>><%=courseNames[i]%>
            							<%  	}
            								}
            							}%>
						   			</Select><br>
						   	授课教师:<Select name="teacherNum" style="width:131px">
            							<%
            							String[] teacherNums = scheduleInfo.getTeachers();
            							String[] teacherNames = scheduleInfo.getTeacherNames();
            							String[] teacherDeptnames = scheduleInfo.getTeacherDeptnames();
            							for (int i = 0; i < teacherNames.length; i++) {
            								if (teacherDeptnames[i].equals(strCourseDeptname)) {
            									if (teacherNums[i].equals(strTeacherNum)) {
            							%>
            										<option value=<%=teacherNums[i]%> selected><%=teacherNames[i]%>
            									<% 
            									} else {%>
            										<option value=<%=teacherNums[i]%>><%=teacherNames[i]%>
            							<%		}
            								}
            							}%>
						   			</Select><br>
            			</P>
						<center>
						   	<input type="submit" value="保存" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules')" style="width:100px;height:22px"/>
						</center>
            		</form>
            	</td></tr>
            	</table>
            	</center>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>