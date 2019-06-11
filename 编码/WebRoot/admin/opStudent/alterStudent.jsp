<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>修改课程
</title>
	<script>
	function checkFrom(form) 
	{
		if (form.studentName.value.length == 0) {
			alert("学生姓名不能为空");
			form.studentName.focus();
			return false;
		}
		return true;
	}
	</script>
  <%
	String strSno=(String)request.getParameter("sno");
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
    String strQuery = "SELECT * FROM Student ";
    strQuery += "where sno='"+strSno+"'";
    dbCourse.connect("CmisDB");
    ResultSet rs = dbCourse.queryDB(strQuery);
    String strName = "";
    String strDeptment = "";
    
    if (rs.next()) {
    	strName = rs.getString(2);
    	strDeptment = rs.getString(3);
    }
  %>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>修改学生信息</font>
            	<table width="220", height="160">
            	<tr><td>
            		<form id="alterCourse" name="alterCourseForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opStudent/alterStudentOk">
            			<P>&nbsp;&nbsp;学&nbsp;号&nbsp;:<input type="text" value="<%=strSno%>" name="studentNum" readOnly="true" size=17/>
            			<br>学生姓名:<input type="text" name="studentName" value="<%=strName%>" size=17/>
					    <br>所属院系:<Select name="deptname">
					    		   <%
					    		   String strTemp[] = cvariable.getDeptnames();
					    		   int length = strTemp.length;
					    		   for (int i = 0; i < length; i++) {
					    		       if (strDeptment.trim().equals(strTemp[i])) {
					    		   %>
					    		   	   <option value=<%=strTemp[i]%> selected><%=strTemp[i]%>
					    		   	   <% 
					    		   	   } else {%>
					    		   	   <option value=<%=strTemp[i]%>><%=strTemp[i]%>
					    		   	   <%
					    		   	   }%>
					    		   <%
					    		   }%>
					   		       </Select>
						   	</P>
						<center>
						   	<input type="submit" value="保存" name="submit" style="width:100px;height:22px"/>
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