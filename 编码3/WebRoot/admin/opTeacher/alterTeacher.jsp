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
		if (form.teacherName.value.length == 0) {
			alert("教师姓名不能为空");
			form.teacherName.focus();
			return false;
		}
		return true;
	}
	</script>
  <%
	String strTno=(String)request.getParameter("tno");
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
    String strQuery = "SELECT * FROM Teacher ";
    strQuery += "where tno='"+strTno+"'";
    dbCourse.connect("CmisDB");
    ResultSet rs = dbCourse.queryDB(strQuery);
    String strName = "";
    String strSex = "";
    String strDeptment = "";
    String strTitle = "";
    
    if (rs.next()) {
    	strName = rs.getString(2);
    	strSex = rs.getString(3);
    	strDeptment = rs.getString(4);
    	strTitle = rs.getString(5);
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
            	<font size=6>修改教师信息</font>
            	<table width="310", height="180">
            	<tr><td>
            		<form id="alterCourse" name="alterTeacherForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opTeacher/alterTeacherOk">
            			<P> 教师工号:<input type="text" value="<%=strTno%>" name="teacherNum" readOnly="true" size=17/>
            			<br>教师姓名:<input type="text" value="<%=strName%>" name="teacherName" size=17/>
	            			性别:<Select name="sex">
	            					<% if (strSex.equals("男")) {
	            					%>
            							<option value="男" selected>男
            							<option value="女">女
            						<% 
            						} else {
            						%>
            						    <option value="男">男
            							<option value="女" selected>女
            						<% 
            						}%>
	            				</Select>
	           			
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
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opTeacher/lookTeachers')" style="width:100px;height:22px"/>
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