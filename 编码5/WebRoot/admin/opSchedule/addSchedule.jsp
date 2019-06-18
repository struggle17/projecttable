<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>
<jsp:useBean id="scheduleInfo" class="opDB.CmisDBInfo" scope="page"></jsp:useBean>

<html>
<head>
<title>���ӿ�����Ϣ</title>
	<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		
		var select1 = document.addScheduleForm.courseNum;
		var select2 = document.addScheduleForm.teacherNum;
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
			alert("�γ̲���Ϊ��!\n�����ӿγ���Ϣ");
			return false;
		}
		if (strSelect2.selectedIndex == -1)
		{
			alert("��ʦ����Ϊ��!\n�����ӽ�ʦ��Ϣ");
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
            	<font size=6>���ӿ�����Ϣ</font>
            		<table width="330", height="160">
            		<tr><td>
            			<form id="addSchedule" name="addScheduleForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opSchedule/addScheduleOk" onsubmit="return checkFrom(this);">
	            			<P> ���ұ��:<Select name="classroomNum"  style="width:131px">
	            							<%
	            							String[] classrooms = scheduleInfo.getClassrooms(); 
	            							for (int i = 0; i < classrooms.length; i++) {
	            							%>
	            								<option value=<%=classrooms[i]%>><%=classrooms[i]%>
	            							<% 
	            							}%>
							   		    </Select><br>
							     �� &nbsp;&nbsp; ��:<Select name="weekday" style="width:131px">
			            							<%
			            							String[] weekdays = cvariable.getWeekDays();
			            							for (int i = 0; i < weekdays.length; i++) {
			            							%>
			            								<option value=<%=weekdays[i]%>><%=weekdays[i]%>
			            							<% 
			            							}%>
										   		</Select>
							     �ڴ�:<Select name="period">
            							<%
            							String[] periods = cvariable.getPeriods();
            							for (int i = 0; i < periods.length; i++) {
            							%>
            								<option value=<%=periods[i]%>><%=periods[i]%>
            							<% 
            							}%>
							   		</Select><br>
							     ����Ժϵ:<Select name="deptname" style="width:131px" onChange="redirect(document.addScheduleForm.deptname.options.selectedIndex)">
						    		    <%
						    		    String strTemp[] = cvariable.getDeptnames();
						    		    int length = strTemp.length;
						    		    for (int i = 0; i < length; i++) {
						    		    %>
						    		    	<option value=<%=strTemp[i]%>><%=strTemp[i]%>
						    		    <%
						    		    }%>
						   		        </Select><br>
							   	�γ�����:<Select name="courseNum" style="width:131px">
	            							<%
	            							String[] courseNums = scheduleInfo.getCourses();
	            							String[] courseNames = scheduleInfo.getCourseNames();
	            							String[] courseDeptnames = scheduleInfo.getCourseDeptnames();
	            							for (int i = 0; i < courseNames.length; i++) {
	            								if (courseDeptnames[i].equals(strTemp[0])) {
	            							%>
	            								<option value=<%=courseNums[i]%>><%=courseNames[i]%>
	            							<%}
	            							}%>
							   			</Select><br>
							   	�ڿν�ʦ:<Select name="teacherNum" style="width:131px">
	            							<%
	            							String[] teacherNums = scheduleInfo.getTeachers();
	            							String[] teacherNames = scheduleInfo.getTeacherNames();
	            							String[] teacherDeptnames = scheduleInfo.getTeacherDeptnames();
	            							for (int i = 0; i < teacherNames.length; i++) {
	            								if (teacherDeptnames[i].equals(strTemp[0])) {
	            							%>
	            								<option value=<%=teacherNums[i]%>><%=teacherNames[i]%>
	            							<%}
	            							}%>
							   			</Select><br>
	            			</P>
	            			<center>
						   	<input type="submit" value="���" name="submit" style="width:120px;height:22px"/>
						   	<input type="button" value="ȡ��������" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules&id=1')" style="width:120px;height:22px"/>
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