<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>添加教师信息
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
	String teacherNum   = (String)request.getParameter("teacherNum");
	String teacherName  = (String)request.getParameter("teacherName");
	byte b1[] = teacherName.getBytes("ISO-8859-1");
	teacherName = new String(b1);
	String strSex = (String)request.getParameter("sex");
	byte b2[] = strSex.getBytes("ISO-8859-1");
	strSex = new String(b2);
	String strTitle  = (String)request.getParameter("titleType");
	byte b3[] = strTitle.getBytes("ISO-8859-1");
	strTitle = new String(b3);
	String strDeptname = (String)request.getParameter("deptname");
	byte b4[] = strDeptname.getBytes("ISO-8859-1");
	strDeptname = new String(b4);
	
	//先查询如果没有再插入数据
	String strQuery = "SELECT * FROM Teacher ";
	strQuery += "where tno='"+teacherNum+"'";
	dbCourse.connect("CmisDB");
	isHave = dbCourse.queryDBHave(strQuery);
	if (!isHave) {
		isAddOk = dbCourse.updateDB("insert into Teacher values('"+teacherNum+"','"+teacherName+"','"+
									 strSex+"','"+strDeptname+"','"+strTitle+"')");
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
            	<font size=6>添加教师成功!</font>
            	<table width="270", height="200">
            	<tr><td>
            	<font size=4>
           	     教师工号:<%=teacherNum%><br>
           	     教师姓名:<%=teacherName%><br>&nbsp;
           	         性&nbsp;别&nbsp;:<%=strSex%><br>&nbsp;
           	     职&nbsp;称&nbsp;:<%=strTitle%><br>
           	         所属院系:<%=strDeptname%><br><br>
            	</font>
          			<center>
				   	<input type="button" value="继续添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opTeacher/addTeacher')" style="width:125px;height:22px"/>
				   	<input type="button" value="查看教师" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opTeacher/lookTeachers&id=1')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>添加教师信息失败!</font>
            	<table width="270", height="200">
            	<tr><td>
          			<center>
          			<font size=4>
          			<% if (isHave == true) {
          			%>
            		原因:教师工号已经存在!
            		<% 
            		} else  {
            		%>
            		原因:未知名错误!
            		<% 
            		}%>
            		</font>
          			<br><br><br>
				   	<input type="button" value="重新添加" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opTeacher/addTeacher')" style="width:125px;height:22px"/>
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