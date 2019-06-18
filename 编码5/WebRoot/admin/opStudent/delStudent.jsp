<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
<title>删除课程信息
</title>
  <%
	String strSno=(String)request.getParameter("sno");
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
  %>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>删除学生信息</font>
            	<table width="300", height="160">
            	<tr><td>
            		<form id="delStudent" name="delStudentForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opStudent/delStudentOk&sno=<%=strSno%>">
            			<center>
            				<P><font size=4>&nbsp;&nbsp;学&nbsp;号&nbsp;:</font><%=strSno%><br><br>
							<input type="submit" value="确认删除" name="submit" style="width:100px;height:22px"/>
							<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents')" style="width:100px;height:22px"/>
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