<%@ page contentType="text/html;charset=GB2312"%>
<html>
    <head>
    </head>
	<body>
	    <center>
	    <table background="images/backImage.jpg" width="100%" height="300">
	    <tr>
		<td>
			<input type="button" value="课程" style="width:150px;height:22px"/>
			<table id="t1">
				<tr>
					<td><a href ="index.jsp?mainPage=opCourse/lookCourses&id=1"><font size=2>查看课程信息</font></a></td>
				</tr>
				<tr>
					<td><a href ="index.jsp?mainPage=opCourse/addCourse"><font size=2>增加课程信息</font></a></td>
				</tr>
			</table>
		</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="教师" style="width:150px;height:22px"/>
				<table id="t2">
					<tr>
						<td><a href ="index.jsp?mainPage=opTeacher/lookTeachers&id=1"><font size=2>查看教师信息</font></a></td>
					</tr>
					<tr>
						<td><a href ="index.jsp?mainPage=opTeacher/addTeacher"><font size=2>增加教师信息</font></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="学生" style="width:150px;height:22px"/>
				<table id="t3">
					<tr>
						<td><a href ="index.jsp?mainPage=opStudent/lookStudents&id=1"><font size=2>查看学生信息</font></a></td>
					</tr>
					<tr>
						<td><a href ="index.jsp?mainPage=opStudent/addStudent"><font size=2>增加学生信息</font></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="教室" style="width:150px;height:22px"/>
				<table id="t3">
					<tr>
						<td><a href ="index.jsp?mainPage=opClassroom/lookClassrooms&id=1"><font size=2>查看教室信息</font></a></td>
					</tr>
					<tr>
						<td><a href ="index.jsp?mainPage=opClassroom/addClassroom"><font size=2>增加教室信息</font></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="教师开课" style="width:150px;height:22px"/>
				<table id="t3">
					<tr>
						<td><a href ="index.jsp?mainPage=opSchedule/lookSchedules&id=1"><font size=2>查看开课信息</font></a></td>
					</tr>
					<tr>
						<td><a href ="index.jsp?mainPage=opSchedule/addSchedule"><font size=2>增加开课信息</font></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="教室借用" style="width:150px;height:22px"/>
				<table id="t4">
					<tr>
						<td><a href ="index.jsp?mainPage=opBorrow/lookBorrows&id=1"><font size=2>查看教室借用信息</font></a></td>
					</tr>
					<tr>
						<td><a href ="index.jsp?mainPage=opBorrow/approvalBorrows&id=1"><font size=2>批准教室借用信息</font></a></td>
					</tr>
					<tr>
						<td><a href ="index.jsp?mainPage=opBorrow/disApprovalBorrows&id=1"><font size=2>取消批准借用信息</font></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="修改密码" style="width:150px;height:22px"/>
				<table id="t4">
					<tr>
						<td><a href ="alterownpwd.jsp"><font size=2>修改我的密码</font></a></td>
					</tr>
				</table>
			</td>
		</tr>
	    </table>
	    </center>
	</body>
</html>
